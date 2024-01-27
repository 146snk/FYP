`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/27 16:42:56
// Design Name: 
// Module Name: color_to_grayscale_row_tb
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


module color_to_grayscale_row_tb(

    );
    
    reg [7:0] tb_R_in, tb_G_in, tb_B_in;
    wire [7:0] tb_grayscale_out;
    reg tb_clk;
    integer i, j, k;
    color_to_grayscale_row dut(.R_in(tb_R_in),.G_in(tb_G_in),.B_in(tb_B_in),.grayscale_out(tb_grayscale_out)); 
    initial begin
        tb_clk = 1'b0;
        forever #1 tb_clk = ~tb_clk;
    end
    initial begin
//        tb_R_in = 1; tb_G_in = 2; tb_B_in = 3;
//        #1
//        tb_R_in = 4; tb_G_in = 5; tb_B_in = 6;
//        #1
//        tb_R_in = 7; tb_G_in = 8; tb_B_in = 9;
//        #1
//        tb_R_in = 0; tb_G_in = 0; tb_B_in = 0;
//        #1
//        tb_R_in = 255; tb_G_in = 255; tb_B_in = 255;
//        #1
//        tb_R_in = 0; tb_G_in = 255; tb_B_in = 0; 
        
        for(k=0;k<256;k=k+1)begin
        tb_R_in = k;
            for(j=0;j<256;j=j+1)begin
                tb_G_in = j;
                for(i=0;i<256;i=i+1)begin
                    tb_B_in = i;
                    #10;
                end
            end
        end
    end 
endmodule
