`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: FH-JOANNEUM, STM21
// Engineer: Johanna Sumper, Timotei Muresan
// 
// Create Date: 01/05/2020 03:07:06 PM
// Design Name: 
// Module Name: uart_tx
//
// 
// Description: 
//	This component may be used to transfer data over a UART device. It will
//  serialize a byte of data and transmit it over a TXD line. The serialized
//   data has the following characteristics:
//     * 9600 Baud Rate
//     * 8 data bits, LSB first
//     * 1 stop bit
//     * no parity
//
//         				
// Port Descriptions:
//
//    clk:    A 100 MHz clock is expected
//    send_i: Used to trigger a send operation. The upper layer logic should 
//           set this signal high for a single clock cycle to trigger a 
//           send. When this signal is set high send_data_i must be valid. Should 
//           not be asserted unless ready_o is high.
//    send_data_i: The parallel data to be sent. Must be valid the clock cycle
//           that send_i has gone high.
//    ready_o: This signal goes low once a send operation has begun and
//           remains low until it has completed and the module is ready to
//           send another byte.
//    uart_tx_o: This signal should be routed to the appropriate TX pin of the 
//           external UART device.
//////////////////////////////////////////////////////////////////////////////////

`default_nettype none
module uart_tx(
    input wire  rst_ni,               // I; Reset (active low)
    input wire  clk,                  // I; Clock 
    
    // Control
    input wire       send_i,          // I; Start send
    input wire [7:0] send_data_i,     // I; Data to send
    output logic     ready_o,         // O; Transfer done, new data can be send
    
    // data output 
    output logic     uart_tx_o        // O; Serial output
);

    
    // 100MHz/9600 = 10416,666. This is the factor used for the clock divider.
    //`define CLK_FACTOR_HALF 13'b1_0100_0101_1000    // = decimal 5208
    `define CLK_FACTOR_HALF 13'b0_0000_0000_1111  // = decimal 16 only for simulation
    
    logic[12:0] uart_clk_cnt;
    logic uart_clk;
    logic uart_clk_en = 1'b1;
    logic uart_clk_posedge;
    logic uart_clk_negedge;
    logic edge_detection = 1'b0;
    logic send_done = 1'b0;
    logic [3:0] bits_cnt = 4'h0;
    logic ready_o_s;
    logic uart_tx_o_s;
    logic [9:0] complete_pkg;   // includes the Start and Stop bits


    typedef enum logic [1:0] {INIT, IDLE, RECIVE, SEND} states_type;
	states_type actual_fsm_state = INIT;
	states_type next_fsm_state = INIT;



    // Clock divider for UART ========================================================================
    always_ff @(posedge clk, negedge rst_ni) begin
        if(!rst_ni || !uart_clk_en) begin
            uart_clk_cnt <= 13'h0;
            uart_clk <= 1'b1;
        end else begin
            if(uart_clk_cnt <= `CLK_FACTOR_HALF-1) begin
                uart_clk_cnt <= uart_clk_cnt + 1'b1;
            end else begin
                uart_clk_cnt <= 13'h0;
                uart_clk <= ~uart_clk;
            end
        end
    end
    
    // Rising-edge pulse
    always_ff @(posedge clk, negedge rst_ni) begin
        if(!rst_ni) begin
            edge_detection <= 1'b0;;
        end else begin
            edge_detection <= uart_clk;
        end
    end
    assign uart_clk_posedge = !edge_detection && uart_clk;
    assign uart_clk_negedge = edge_detection && !uart_clk; 
    // ===============================================================================================


    // Update the states of the state machine
    always_ff @(posedge clk, negedge rst_ni) begin
        if (!rst_ni) actual_fsm_state <= INIT;
        else        actual_fsm_state <= next_fsm_state;
    end
    

	// Change the states (combinational logic)
	always_comb
	begin
	   next_fsm_state = actual_fsm_state;
	   case(actual_fsm_state)
	       INIT: begin
	           next_fsm_state = IDLE;
	       end
	       IDLE: begin
	           if(send_i) begin
	               next_fsm_state = RECIVE;
	           end 
	       end
	       RECIVE: begin
	           next_fsm_state = SEND;
	       end
   	       SEND: begin
	           if(send_done) begin
	               next_fsm_state = IDLE;
	           end
	       end
	   endcase	
	end    

    always_ff @(posedge clk, negedge rst_ni) begin	
    
        if(!rst_ni) begin
            complete_pkg <= 10'b0;
            bits_cnt     <= 4'h0;
            ready_o_s    <= 1'b0;
            uart_clk_en  <= 1'b0;
            send_done    <= 1'b0;
        end else begin
        
            case(actual_fsm_state)
                INIT: begin
                    complete_pkg[0] <= 1'b1;
                    bits_cnt <= 4'h0;
                end
                
                IDLE: begin
                    ready_o_s <= 1'b1;
                    uart_clk_en <= 1'b0;
                end
                
                RECIVE: begin
                    complete_pkg[0] <= 1'b0; //Start bit
                    complete_pkg[9] <= 1'b1; //Stop bit
                    complete_pkg[8:1] <= send_data_i;         
                end
                
                SEND: begin
                    ready_o_s <= 1'b0;
                    uart_clk_en <= 1'b1;
                               
                    if (bits_cnt <= 4'h8)begin 
                        send_done <= 1'b0;
                        // basically wait on the rising edge of UART clk
                        if (uart_clk_posedge) begin
                            complete_pkg <= complete_pkg >>1;
                            bits_cnt <= bits_cnt + 1'b1;
                        end 
                    
                    end else if (bits_cnt > 4'h8) begin
                        // basically wait on the falling edge of UART clk
                        if (uart_clk_negedge) begin
                            bits_cnt <= 4'h0;
                            send_done <= 1'b1;
                        end
                    end
                end
            endcase
        end
    end // end of always_ff

    assign uart_tx_o_s = complete_pkg[0];
    assign uart_tx_o   = uart_tx_o_s;
    assign ready_o     = ready_o_s;
 
endmodule
`default_nettype wire