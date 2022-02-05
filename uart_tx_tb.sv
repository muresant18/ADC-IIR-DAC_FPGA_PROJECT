`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: FH-JOANNEUM, STM21
// Engineer: Johanna Sumper, Timotei Muresan
// 
// Create Date: 20.01.2022 17:47:27
// Design Name: 
// Module Name: uart_tx_tb
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


module uart_tx_tb();
    // local signals to connect the RTL module
    logic rst_ni      = 1'b1;
    logic clk         = 1'b0;
    logic send_i      = 1'b0;
    logic [7:0] send_data_i ;
    logic ready_o     ;
    logic uart_tx_o   ;

    // additional signals
    logic [7:0] test_vector[4];
    logic [7:0] read_vector;
    int read_pkg_cnt = 0;
    logic uart_clk = 1'b1;
    
    // Drive the system clock for f = 100MHz
    always #5ns clk = ~clk; 



    uart_tx uart_tx_i(
        .rst_ni      (rst_ni      ),      
        .clk         (clk         ),     
        .send_i      (send_i      ), 
        .send_data_i (send_data_i ), 
        .ready_o     (ready_o     ),
        .uart_tx_o   (uart_tx_o   )  
    );


    initial begin
        // These data will be sent to the URAT_TX module (parallel write)
        test_vector[0] = 8'hFF;
        test_vector[1] = 8'h00;
        test_vector[2] = 8'hAA;
        test_vector[3] = 8'h55;
    
        /* Start two processes in parallel:
           - The first one will send data into toe UART_TX module (parallel write).
           - The second one will sample the output signal of the UART_TX module and verify
             if the parallel written data is corectly serialized.
        */
        fork
            // THREAD 1 ---------------------------------------------------------------------
            // Drive stimulus to the UART_TX module
            begin       
                #203ns;
                
                // Generate a reset pulse
                rst_ni = 1'b0;
                #200ns;
                rst_ni = 1'b1;
                #200ns;
                
                for (int i=0; i<4; i++) begin
                    
                    // according to the RQs, the ready_o must be high before we send new data in
                    if(!ready_o) begin
                        @(posedge ready_o);
                        #100ns;
                    end else begin
                        #1ns;
                    end    
                        
                    send_data_i <= test_vector[i];
                    #15ns;
                    
                    // Generate a short pulse of the send-flag
                    send_i = 1'b1;
                    #10ns;
                    send_i = 1'b0;
                    #200ns;
                    
                end;
            end //---------------------------------------------------------------------------
            
            
            // THREAD 2 ---------------------------------------------------------------------
            // Verify if the data sent in is serialized back by the UART_TX module
            begin   
                @(negedge rst_ni)
                while (read_pkg_cnt < 4) begin

                    // Wait for a new package to be sent by the other thread of the fork
                    @(negedge send_i) 

                    //shift 10 bits into the 8 bits vecotr (the start and stop bits will be ignored)
                    for(int n=0; n<=9; n++) begin
                    
                        // sample the output of the UART_TX module @ falling edge of clk
                        @(negedge uart_clk)
                                            
                        /* Skip the start and stop bits.
                           This statement will transit the for loop directly into the next itteration, 
                           without considering the rest of the code in the actual itteration.     */
                        if((n==0) || (n==9)) continue;
                        
                        // Store the sampled value in a local vector
                        read_vector[n-1] <= uart_tx_o; 
                    end
                    
                    @(posedge clk)
                    assert (read_vector == test_vector[read_pkg_cnt]) else $warning("read_vector != test_vector");
                    $display("read_vector is    %b", read_vector);
                    $display("test_vector[%1d] is %b", read_pkg_cnt, test_vector[read_pkg_cnt]);
                    
                    #1ns;
                    read_pkg_cnt++;
                end    
            end //---------------------------------------------------------------------------
            
            // THREAD 3 ---------------------------------------------------------------------
            // Drive the UART clock for the slave (TB)
            forever begin
                if (read_pkg_cnt >=4) begin
                    break;
                    disable fork;
                end else begin
                    @(negedge ready_o)
                    while(!ready_o) begin
                        //#52080ns;     // to test the real scenarion
                        #160ns;         // for simulation only
                        uart_clk = ~uart_clk;                
                    end
                end    
            end
        join
        #500ns;
        $finish;
    end
endmodule
