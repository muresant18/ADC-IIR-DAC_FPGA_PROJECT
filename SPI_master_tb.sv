`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: FH-JOANNEUM
// Engineer: Johanna Sumper, Timotei Muresan
// 
// Create Date: 12/23/2021 12:31:11 PM
// Design Name: 
// Module Name: SPI_master_tb
// Project Name: 
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


module SPI_master_tb();

    //local signals for connecting the DUT
    logic rst_ni           = 1'b1;  
    logic clk              = 1'b0;
    logic en_i             = 1'b1;
    logic spi_cs_no        ;
    logic spi_sck_o        ;
    logic [1:0] spi_miso_i ;
    logic data_updata_o    ;
    logic [11:0] data0_o   ;
    logic [11:0] data1_o   ;
    
    // data to be streamed over MOSI
    logic [16:0] test_vector [3];   
    

    spi_adc spi_adc_i(
      .rst_ni       (rst_ni       ),
      .clk          (clk          ),  
      .en_i         (en_i         ), 
      .spi_cs_no    (spi_cs_no    ), 
      .spi_sck_o    (spi_sck_o    ), 
      .spi_miso_i   (spi_miso_i   ),
      .data_updata_o(data_updata_o),
      .data0_o      (data0_o      ),
      .data1_o      (data1_o      )
    );

    //Toggle the system clock for 100MHz
    always #5ns clk = ~clk;         

    initial begin

        test_vector[0] = {4'b0000, 12'h000, 1'b1};
        test_vector[1] = {4'b0000, 12'hFFF, 1'b1};
        test_vector[2] = {4'b0000, 12'hA5A, 1'b1};
//        test_vector[0]= {17'b00001111000011110};
//        test_vector[1]= {17'b00001111111111111};
//        test_vector[2]= {17'b00001000000000011};
        
        // Generate a reset-pulse (active low)
        # 111ns;
        rst_ni = 1'b0;
        # 111ns;
        rst_ni = 1'b1;


        for(shortint unsigned x=0; x<3; x++) begin
            
            // Begin to stream data as soon as the chip is selected
            @(negedge spi_cs_no)
            
            // shift the first zero
            spi_miso_i[0] = test_vector[x]  [16];
            spi_miso_i[1] = test_vector[2-x][16];
                
            for(shortint unsigned i=16; i>0; i--) begin
                // The slave changes the data at the leading (falling) edge of the SCK 
                @(negedge spi_sck_o)
                spi_miso_i[0] = test_vector[x]  [i-1];
                spi_miso_i[1] = test_vector[2-x][i-1];
            end     
            
            // Check the decoded data every time when the output-validation-flag is asserted.      
            @(posedge data_updata_o)       
            CHECK_OUTPUT_CH_0: assert (data0_o == test_vector[x]  [12:1]) else $error("The decoded value of the channel 0: %h doesn't match the expected value %h.", data0_o, test_vector[x]  [12:0] );
            CHECK_OUTPUT_CH_1: assert (data1_o == test_vector[2-x][12:1]) else $error("The decoded value of the channel 1: %h doesn't match the expected value %h.", data0_o, test_vector[2-x][12:0] );
                          
        end
        #10us;
        $finish;
    end
    
endmodule
