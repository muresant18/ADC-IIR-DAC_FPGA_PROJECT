`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: FH-JOANNEUM
// Engineer: Timotei Muresan, Johanna Sumper
// 
// Create Date: 01/14/2022 09:51:33 AM
// Design Name: 
// Module Name: iir
// Project Name: Lab 6 - Comparisson of IIR and FIR filters
// Target Devices: 
// Tool Versions: 
// Description: Moving average filter with feedback (1st order IIR, Gain a = 0,125)
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module iir #(
  parameter integer DATA_W = 16  
) (
  input   wire                clk             , // I; System clock 
  input   wire                reset_ni        , // I; system cock reset (active low)  
  input   wire  [DATA_W-1:0]  din_i           , // I; Input data    
  input   wire                avg_clr_i       , // I; Clear average data 
  input   wire                avg_en_i        , // I; Enable averaging
  output  logic [DATA_W-1:0]  dout_o            // O; Averaged data 
);
  
    /****************************************************************************
    a   = 0,125
    1-a = 0,875 =  0,5 + 0,25  + 0,125
    
    We need (1-a)*y[n-1]:
      0,875  =  0,5         + 0,25         + 0,125
      m(1-a) =  m>>1        + m>>2         + m>>3    
    *****************************************************************************/
                    
    // -------------------------------------------------------------------------
    // Definition 
    // -------------------------------------------------------------------------
    
    `define CORRECTION_OFFSET 2'b11 
    
    logic [DATA_W-1+3:0]  stage_1;
    logic [DATA_W-1+3:0]  stage_2;
    logic [DATA_W-1+3:0]  stage_3;
    logic [DATA_W-1+3:0]  din_in_long;
    
    always_ff @(posedge clk or negedge reset_ni) begin
        if (~reset_ni) begin 
            stage_2 <= {(DATA_W+3){1'b0}} ;       
        end else begin 
            if (avg_clr_i) begin
                stage_2 <= {(DATA_W+3){1'b0}} ;   
            end else if (avg_en_i) begin  
                
                /*  For a maximal accuracy, we will need an offset of decimal 3 to the stage_2 register.
                 *
                 *  The reason for this could be: 
                 *   - by shifting the stage_2 reg 3 times to the right, 
                 *     we lose approximately the mean value of those bits.
                 *
                 *  Why decimal 3?
                 *  - With the 3 LSBs cutted out, we could have decimal values between 0 and 7. 
                 *  - The value of 3 would be the average value of those lost bits over a longer 
                 *    period of time ( respectively a larger number of filter operations).
                 */
                stage_2 <= stage_3 + `CORRECTION_OFFSET;
            end        
        end  
    end    
    
    assign din_in_long[DATA_W-1+3:3] = din_i;
    assign din_in_long[2:0] = 3'b0; // these last 3 bits are not relevant anyway
    
    // >>3 is equivalent to multiplying by 0,125
    assign stage_1 = {3'b000, din_in_long >> 3};      
    assign stage_3 = stage_1 + ( (stage_2>>1) + (stage_2>>2) + (stage_2>>3) ) ;

    // slice the 3rd stage (the MSB) and assign it to output
    assign dout_o = stage_3[DATA_W-1+3:3];  
    
endmodule
`default_nettype wire 
