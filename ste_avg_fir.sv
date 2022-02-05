//  --------------------------------------------------------------------------
//                    Copyright Message
//  --------------------------------------------------------------------------
//
//  CONFIDENTIAL and PROPRIETARY
//  COPYRIGHT (c) XXXX 2019
//
//  All rights are reserved. Reproduction in whole or in part is
//  prohibited without the written consent of the copyright owner.
//
//
//  ----------------------------------------------------------------------------
//                    Design Information
//  ----------------------------------------------------------------------------
//
//  File             $URL: http://.../ste.sv $
//  Author
//  Date             $LastChangedDate: 2019-02-15 08:18:28 +0100 (Fri, 15 Feb 2019) $
//  Last changed by  $LastChangedBy: kstrohma $
//  Version          $Revision: 2472 $
//
// Description       Generic shift register
//
//  ----------------------------------------------------------------------------
//                    Revision History (written manually)
//  ----------------------------------------------------------------------------
//
//  Date        Author     Change Description
//  ==========  =========  ========================================================
//  2019-01-09  strohmay   Initial verison       

`default_nettype none
module ste_avg #(
  parameter integer DATA_W      = 16     // _INFO_ Parameter
) (
  input   wire                clk             , // I; System clock 
  input   wire                reset_ni        , // I; system cock reset (active low)  
  input   wire  [DATA_W-1:0]  din_i           , // I; Input data    
  input   wire                avg_clr_i       , // I; Clear average data 
  input   wire                avg_en_i        , // I; Enable averaging
  output  logic [DATA_W-1:0]  dout_o            // O; Averaged data 
);
  
  
  // -------------------------------------------------------------------------
  // Definition 
  // -------------------------------------------------------------------------
  localparam logic [DATA_W-1:0] zero = {(DATA_W) {1'b0}};
  
  // delayed input value  
   logic [2:0][DATA_W-1:0] shift_ff;

  logic [DATA_W+1-1:0]  sum1;
  logic [DATA_W+1-1:0]  sum2;
  logic [DATA_W+2-1:0]  sum3;
  logic [DATA_W-1:0]    avg_ff;
  

  // -------------------------------------------------------------------------
  // Implementation
  // -------------------------------------------------------------------------

  // Shift register
  always_ff @(posedge clk or negedge reset_ni) begin
    if (~reset_ni) begin
      shift_ff <= {(3) {zero} };      
    end else begin 
      if          (avg_clr_i) begin
        shift_ff <= {(3) {zero} };       
      end else if (avg_en_i) begin 
        shift_ff[2:0] <=    {shift_ff[1:0], din_i};
      end        
    end  
  end
  
  // Adder
  assign sum1 = din_i       + shift_ff[0];
  assign sum2 = shift_ff[2] + shift_ff[0];
  assign sum3 = sum1 + sum2;
  
  // Output register plus divide by 4
  always_ff @(posedge clk or negedge reset_ni) begin
    if (~reset_ni) begin
      avg_ff <= {(DATA_W) {1'b0}};      
    end else begin 
      avg_ff <= sum3 >> 2;
    end  
  end
  
  assign dout_o         = avg_ff;
  
endmodule
`default_nettype wire  