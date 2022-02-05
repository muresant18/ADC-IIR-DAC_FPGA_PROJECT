`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: FH-JOANNEUM
// Engineer: Klaus Strohmayer
// Students: Johanna Sumper, Timotei Muresan
// 
// Create Date:    5 FEB 2020
// Design Name: 
// Module Name:    basys3_top 
// Project Name: 
// Target Devices: 
// Tool versions: 
//
// Description: 
//   Demo for PmodADC1 readout (PmodADC1 connected to JA) 
//     ADC values is shown on 4digit 7segment display
//     The ADC conversion is enabled via SW1
//     The channels is selected via SW15
//   
//   The system can be triggered via buttont BTNC
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module basys3_top(  
  input wire clk,                  // CLK Input
	 
  //Push Button Inputs	 
  input wire btnC,              // I; Center 
  input wire btnU,              // I; Up 
  input wire btnD,              // I; Down 
  input wire btnR,              // I; Left  
  input wire btnL,              // I; Right
	 
  // Slide Switch Inputs
  input wire [15:0] sw,         // I; SW 0..15 
 
  // Pmod Header JA
  inout wire [7:0] JA,  
  inout wire [7:0] JB,  
  
  // USB-RS232 Interface
  output wire      RsTx,        // O; TXD  
  input  wire      RsRx,        // I; RXD
  
  output wire [15:0] led,       // O; LED Outputs 
     
  // Seven Segment Display Outputs
  output [6:0] seg,             // O; Segment  
  output [3:0] an,              // O; Anode of Seg0 ..3
  output dp                     // O; 
);
	

    // -------------------------------------------------------------------------
    // Definition
    // -------------------------------------------------------------------------
    `define TOP_FILTERS_DATA_W 12
    
    
    /* 
    The function of the dont_touch attribute is function is to prevent logic 
    optimization of either signals or hierarchical blocks and forward annotate 
    the netlist to place and route.
    More details:  https://support.xilinx.com/s/article/54699?language=en_US
    */
    
    (* dont_touch = "true" *) logic [11:0] data0_o_sig;
    (* dont_touch = "true" *) logic [11:0] data1_o_sig;
    (* dont_touch = "true" *) logic [`TOP_FILTERS_DATA_W-1:0] data0;
    (* dont_touch = "true" *) logic [`TOP_FILTERS_DATA_W-1:0] data1;


    
    // Reset
    logic       rst_n;
    logic [1:0] rst_nff;
    
    // signals for the SPI Master module
    logic spi_sck_s;
    
    // Signals for the Filters
    logic data_updata_o_sig;
    
    // Signals for MUX];
    logic [`TOP_FILTERS_DATA_W-1:0] mux_output;
    
    
    // Signals for the UART_TX module
    logic send_i_s = 1'b0;
    logic [7:0] send_data_i_s;
    logic ready_o_s;
    logic uart_tx_o_s; 
      
    // Signals for the dec2bdc
    logic [19:0] dbcd_o_s;
    
    logic [7:0] JA_s;
    logic [7:0] JB_s;
    logic local_en = 1'b1;

    
    // -------------------------------------------------------------------------
    // Implementation
    // -------------------------------------------------------------------------
    
    // Reset generation
    always @(negedge clk or posedge btnC) begin
        if (btnC) begin
            rst_nff <= 2'b00;
        end else begin
            rst_nff <= {rst_nff[0], 1'b1};
        end  
    end
    assign rst_n = rst_nff;
    
    // Route switch to LEDs
    assign led[15:0] = sw[15:0];

    
    // Instatiate the SPI-Master module
    spi_adc spi_adc_i (
        .rst_ni       (rst_n            ),     // I; Reset (active low)
        .clk          (clk              ),     // I; Clock 
        .en_i         (sw[15]           ),     // I; Enable
        .spi_cs_no    (JA[4]            ),     // O; SPI chip select
        .spi_sck_o    (JA[7]            ),     // O; SPI clock
        .spi_miso_i   ({JA[6], JA[5]}   ),     // I; SPI data in (2 bit for 2 miso lines =  2 parallel slaves)
        .data_updata_o(data_updata_o_sig),     // O; New data available
        .data0_o      (data0_o_sig      ),     // O; ADC data channel 0 
        .data1_o      (data1_o_sig      )      // O; ADC data channel 1  
        );
    

     // Instantiate the IIR Filter (1)
    iir #(.DATA_W(`TOP_FILTERS_DATA_W))
    ste_avg_1_i(.clk      (clk              ),   // I; System clock 
                .reset_ni (rst_n            ),   // I; system cock reset (active low)  
                .din_i    (data0_o_sig      ),   // I; Input data    
                .avg_clr_i(1'b0             ),   // I; Clear average data 
                .avg_en_i (data_updata_o_sig),   // I; Enable averaging
                .dout_o   (data0            )    // O; Averaged data     
                );
              
    // Instantiate the FIR Filter (2)
    ste_avg #(.DATA_W(`TOP_FILTERS_DATA_W))
    ste_avg_2_i(.clk      (clk              ),   // I; System clock 
                .reset_ni (rst_n            ),   // I; system cock reset (active low)  
                .din_i    (data1_o_sig      ),   // I; Input data    
                .avg_clr_i(1'b0             ),   // I; Clear average data 
                .avg_en_i (data_updata_o_sig),   // I; Enable averaging
                .dout_o   (data1            )    // O; Averaged data     
                );
            
    // Insantiate the UART_TX module
    uart_tx uart_tx_i(.rst_ni       (rst_n        ),          // I; Reset (active low)
                      .clk          (clk          ),         // I; Clock 
                      // Control
                      .send_i       (send_i_s     ),       // I; Start send
                      .send_data_i  (send_data_i_s),      // I; Data to send, [7:0] send_data_i
                      .ready_o      (ready_o_s    ),       // O; Transfer done, new data can be send
                      // data output
                      .uart_tx_o     (uart_tx_o_s )      // O; Serial output
                      ); 
 
    assign  RsTx = uart_tx_o_s;
    assign send_data_i_s = 8'b0;
    
    
    // Instantiate the DAC_SPI module
    spi_dac spi_dac_i( .rst_ni      (rst_n         ),      // I; Reset (active low)
                    .clk            (clk           ),      // I; Clock 
                    .en_i           (sw[15]        ),      // I; Enable
                     
                    // SPI interface     
                    .spi_cs_no      (JB[4]          ),      // O; SPI chip select
                    .spi_sck_o      (JB[7]          ),      // O; SPI clock
                    .spi_mosi_o     ({JB[6], JB[5]} ),      // O; SPI data in (2 bit)
                    
                    // data input   
                    .data0_i        (data0              ),       // I; DAC data channel 0 , [11:0]  data0_i
                    .data_pd0_i     ({sw[11], sw[12]}   ),       // I; DAC operating mode, [1:0]  data_pd0_i
                    .data0_updata_i (data_updata_o_sig  ),       // I; New DAC data cahnnel 0 available
                    .data1_i        (data1              ),       // I; DAC data channel 1 , [11:0]  data1_i
                    .data_pd1_i     ({sw[13], sw[14]}   ),       // I; DAC operating mode, [1:0]  data_pd1_i
                    .data1_updata_i (data_updata_o_sig  )        // I; New DAC data cahnnel 1 available
                    );    
 
 
 
    // Instantiate the dec2bdc module
    bin_to_bcd bin_to_bcd_i( .dbin_i ({4'b0000, mux_output}), // I; binary number, [15:0] dbin_i
                             .dbcd_o (dbcd_o_s)              // O; BCD coded number (4 digits), [19:0] dbcd_o
                             );

            
    always_ff @(posedge clk)
    begin
        if (sw[0]==1'b0)   mux_output = data0;
        else               mux_output = data1;
    end     
  
  
    // Instantiate the 7 seg disp
    seg7_ctrl seg7_ctrl_i( .rst_ni(rst_n            ),
                           .clk   (clk              ),
                           .x     (dbcd_o_s[15:0]   ),    // [15:0], dbcd_o_s is [19:0]
//                           .x     (dbcd_o_s[19:4]   ),    // [15:0], dbcd_o_s is [19:0]
                           .clr   (1'b0             ),
                           .a_to_g(seg              ),    // [6:0] 
                           .an    (an               ),    // [3:0]
                           .dp    (dp               )
                            );

    
    
    // for I/Os
    //assign JA = (local_en) ? JA_s : 1'bz;
    
    assign  JA[3] = 1'bz;
    assign  JA[2] = 1'bz;
    assign  JA[1] = 1'bz;
    assign  JA[0] = 1'bz;
    assign  JB[3] = 1'bz;
    assign  JB[2] = 1'bz;
    assign  JB[1] = 1'bz;
    assign  JB[0] = 1'bz;
    
    
    
    
    
    
    
    
         
endmodule
