`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: FH-JOANNEUM
// Engineer: Timotei Muresan, Johanna Sumper
// 
// Create Date: 01/14/2022 10:37:28 AM
// Design Name: 
// Module Name: iir_tb
// Project Name: Lab 6 - Comparisson of IIR and FIR filters
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module iir_tb();

    `define DATA_W_TB 16
    
    logic                  clk = 1'b0 ;
    logic                  reset_ni = 1'b1;     // active low reset
    logic [`DATA_W_TB-1:0] din_i;
    logic                  avg_clr_i = 1'b0;
    logic                  avg_en_i  = 1'b0;
    logic [`DATA_W_TB-1:0] fir_dout_o;
    logic [`DATA_W_TB-1:0] iir_dout_o;
    
    logic [`DATA_W_TB-1:0] test_vec[4];
    logic [7:0] noise_vec;
    logic [`DATA_W_TB-1:0] ramp_vec;
    
    // Drive the system clock with 50 MHz
    always #10ns clk =~ clk;
    
    // instantiate the IIR Filter
    iir #(.DATA_W(`DATA_W_TB)  ) 
        iir_i(  .clk      (clk       )      , // I; System clock 
                .reset_ni (reset_ni  )      , // I; system cock reset (active low)  
                .din_i    (din_i     )      , // I; Input data    
                .avg_clr_i(avg_clr_i )      , // I; Clear average data 
                .avg_en_i (avg_en_i  )      , // I; Enable averaging
                .dout_o   (iir_dout_o)        // O; Averaged data 
    );
     // instantiate the FIR Filter (DUT by Mr. Strohmayer)
    ste_avg #(.DATA_W(`DATA_W_TB)  ) 
        ste_avg_i(  .clk      (clk       )      , // I; System clock 
                    .reset_ni (reset_ni  )      , // I; system cock reset (active low)  
                    .din_i    (din_i     )      , // I; Input data    
                    .avg_clr_i(avg_clr_i )      , // I; Clear average data 
                    .avg_en_i (avg_en_i  )      , // I; Enable averaging
                    .dout_o   (fir_dout_o)        // O; Averaged data 
    );
    

    initial begin
        #102ns;
        // Generate a reset pulse (active low)
        reset_ni = 1'b0;
        #35ns;
        reset_ni = 1'b1;     
        
        // Generate the ramp input signal
        for (int i=0; i<=255; i++) begin
            #40ns;
            
            // Generate a noise with decimal values between 1 and 15
            noise_vec = $urandom_range(8'h1, 8'hF);
            // Add that noise to the "original" input signal
            din_i = i + noise_vec;
            
            // OR TEST CONSTANT VALUES
            //din_i = `DATA_W_TB'd4095;
            //din_i = `DATA_W_TB'd6000;
            //din_i = `DATA_W_TB'd9025;      
            #20ns;
            
            // Enable the filter once
            avg_en_i = 1'b1;
            #20ns;
            avg_en_i = 1'b0;
        end 
        #400ns;
        $finish;
    end
endmodule
