`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Klaus Strohmayer
// 
// Create Date:    17:08:26 06/12/2014 
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
  
  
  // Reset
  logic       rst_n;
  logic [1:0] rst_nff;
  
  
  
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

  
endmodule