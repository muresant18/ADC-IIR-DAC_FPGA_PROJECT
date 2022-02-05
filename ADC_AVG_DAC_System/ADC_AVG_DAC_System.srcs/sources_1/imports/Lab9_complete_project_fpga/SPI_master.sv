`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: FH JOANNEUM
// Engineer: JOHANNA SUMPER, TIMOTEI MURESAN
// 
// Create Date: 
// Design Name: SPI Master
// Module Name: spi_adc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created






///////////////////////////////////////////////////////////////////////////////////
// Additional Comments:
//
//  - The ADC used in this project works with SPI MODE 3 (CPHA = 1, CPOL = 1)
//  - the slave updates the data at the leading edge (falling edge of the SCK)
//  - the data will be sampled @ the trailing edge (rising edge of the SCK)
//
//        _ _ ___      ____      ____      ____      _ _ _ 
//  sck          |____|    |____|    |____|    |____|
//                _________ _________ _________
//  sda ---------<_________X_________X_________>-----------
//                   .^.       .^.       .^.
//                    |         |         | 
//                      sample MISO line here
//
//////////////////////////////////////////////////////////////////////////////////


module spi_adc(
    input wire  rst_ni,               // I; Reset (active low)
    input wire  clk,                  // I; Clock 
    
    // Control
    input wire       en_i,            // I; Enable
    
    // SPI interface
    output logic     spi_cs_no,       // O; SPI chip select
    output logic     spi_sck_o,       // O; SPI clock
    input wire [1:0] spi_miso_i,      // I; SPI data in (2 bit for 2 miso lines =  2 parallel slaves)
    
    // data output 
    output logic data_updata_o,        // O; New data available
    output logic [11:0] data0_o,       // O; ADC data channel 0 
    output logic [11:0] data1_o        // O; ADC data channel 1  
    );

   
    // by dividing the system clock (100MHz) to 100 we obtain a period T = 100 sys clk cycles.
    `define SCK_half_period 6'd50

    // defines used for the active low chip select signal
    `define ENABLED_N 1'b0
    `define DISABLED_N 1'b1
 
    // states of the state machine
    typedef enum { IDLE, SAMPLE_SDA, SAMPLE_FIRST_ZERO, SEND_SDA, QUIET } states_t;
    states_t curr_state = IDLE;
    states_t next_state = IDLE;
                                                
    logic [13:0] recived_digital_data [1:0] ;   // Define two local regs will store the receved data
    logic up_data_sig = 1'b0;                   // internal signals
    logic sck_sig = 1'b1;
    logic [1:0] sck_sig_pulse ;
    logic cs_n_sig = 1'b0;
    logic MISO_sig[2];                          // internals signals which store the MISO lines last values
    logic [11:0] output_data1_sig [2];
    logic [4:0] bits_cnt = 5'b1_0000;           // for 16 bits (16...1)
    logic package_complete = 1'b0;
    logic [4:0] t_quiet_cnt = 5'b0;        
    logic quiet_done = 1'b0;  
      
    //for generating the 1Mhz SPI clock, we devide the sys clk (100MHz) to 100.
    // we will toggle the SPI clock at every 50 cycles of the sys clock
    logic [5:0] clk_cnt = `SCK_half_period;    //start from the value 100 and then count down to 0
    

    
    // CLOCK DIVIDER ========================================================================
    // Drive the SPI Clock
    always_ff @(posedge clk, negedge rst_ni, posedge cs_n_sig ) begin
        if((!rst_ni) || (cs_n_sig == `DISABLED_N)) begin
            clk_cnt <= `SCK_half_period-1;
            sck_sig <= 1'b1;
        end else begin        
            if(clk_cnt > 6'd0) begin
                clk_cnt <= clk_cnt-1;
            end else begin
                clk_cnt <= `SCK_half_period-1;
                sck_sig <= ~sck_sig;
            end
        end
    end  
    //assign the local singal to the output
    assign spi_sck_o = sck_sig; //===========================================================
    
    
    
    // Generate one pulse at every risign edge of SCK
    always_ff @(posedge clk, negedge rst_ni) begin
        if (!rst_ni)  sck_sig_pulse[0] <= 1'b0;
        else          sck_sig_pulse[0] <= sck_sig;
    end
    assign sck_sig_pulse[1] = !sck_sig_pulse[0] && sck_sig;    
    
    
    
    
    
    // =============================== STATE MACHINE ========================================
    // ======================================================================================
    
    // Update the states ==============================================
    always_ff @(posedge clk, negedge rst_ni ) begin
        if (!rst_ni)  curr_state <= IDLE;
        else          curr_state <= next_state;
    end    
    
	// Change the states (combinational logic) =======================
	// Defines the next state
	always_comb	begin
	   next_state = curr_state;   //defalut state
	   case(curr_state)
	       IDLE: begin
	           if(en_i) next_state = SAMPLE_FIRST_ZERO;      
	       end 
	       SAMPLE_FIRST_ZERO: begin
	           if(cs_n_sig == `ENABLED_N)  next_state = SAMPLE_SDA;
	       end 
	       SAMPLE_SDA: begin
	           if(package_complete) next_state = SEND_SDA;
	       end 
	       SEND_SDA: begin
	           next_state = QUIET;
	       end 
	       QUIET: begin
	           if (quiet_done) next_state = IDLE;
	       end 
	    endcase     
	end        
	
	// Sequential logic for the state machine =======================
	// Here happens things :)
  
    always_ff @(posedge clk, negedge rst_ni) begin
        if(!rst_ni) begin
            package_complete        <= 1'b0;
            up_data_sig             <= 1'b0;
            cs_n_sig                <= `DISABLED_N; 
            bits_cnt                <= 5'b1_0000; // dec 16
            package_complete        <= 1'b0;
            recived_digital_data[0] <= 13'h0;
            recived_digital_data[1] <= 13'h0;
            quiet_done              <= 1'b0;
            output_data1_sig[0]     <= 12'h000;
            output_data1_sig[1]     <= 12'h000;            
        end else begin        

            //default signals 
            package_complete    <= 1'b0;
            up_data_sig         <= 1'b0;

            
            case(curr_state)
                IDLE: begin
                    cs_n_sig                <= `DISABLED_N; 
                    bits_cnt                <= 5'b1_0000; // dec 16
                    package_complete        <= 1'b0;
                    recived_digital_data[0] <= 13'h0;
                    recived_digital_data[1] <= 13'h0;
                    quiet_done              <= 1'b0;
                    output_data1_sig[0]     <= 12'h000;
                    output_data1_sig[1]     <= 12'h000;
                end
                
                SAMPLE_FIRST_ZERO: begin
                    cs_n_sig <= `ENABLED_N; 
                    //it's gonna be seen as enabled (active low) in the next clk cycle
                    if(cs_n_sig == `ENABLED_N) begin
                        recived_digital_data[0] <= { recived_digital_data[0][11:0], spi_miso_i[0]};
                        recived_digital_data[1] <= { recived_digital_data[1][11:0], spi_miso_i[1]};        
                    end    
                end
                
                SAMPLE_SDA: begin
//                    _ _ ___      ____      ____      ____      _ _ _ 
//              sck          |____|    |____|    |____|    |____|
//                            _________ _________ _________
//              sda ---------<_________X_________X_________>-----------
//                               .^.       .^.       .^.
//                                |         |         | 
//                                  sample MISO line here

                    if (bits_cnt > 5'b0) begin
                        // store SDA data into the local register (for both lines, MSB first !!!)
                        // sample data at risign edge of the SCK 
                        if (sck_sig_pulse[1]) begin                      
                            recived_digital_data[0] <= { recived_digital_data[0][11:0], spi_miso_i[0]};
                            recived_digital_data[1] <= { recived_digital_data[1][11:0], spi_miso_i[1]};
                            bits_cnt <= bits_cnt-1;
                        end 
                     end else begin //if bits_cnt == 0
                        bits_cnt         <= 5'b1_0000; //16
                        package_complete <= 1'b1;
                     end 
                end 
                
                SEND_SDA: begin
                    output_data1_sig[0] <= recived_digital_data[0][12:1];
                    output_data1_sig[1] <= recived_digital_data[1][12:1];
                    cs_n_sig <= `DISABLED_N;
                    package_complete <= 1'b0;                
                    up_data_sig <= 1'b1;
                end 
                
                QUIET: begin
                    if(t_quiet_cnt <  5'b1_1110) begin //= 30 x 10ns = 300ns quiet time
                        t_quiet_cnt <= t_quiet_cnt + 1;
                    end else begin
                        t_quiet_cnt <= 5'b0;
                        quiet_done <= 1'b1;
                    end
                end
            endcase
        end //end if no resetn
    end     
           

	// Assign local signals to the outputs ===========================
    assign data0_o       = output_data1_sig[0];
    assign data1_o       = output_data1_sig[1];
    assign spi_cs_no     = cs_n_sig;
    assign data_updata_o = up_data_sig;
	   
endmodule
`default_nettype wire
