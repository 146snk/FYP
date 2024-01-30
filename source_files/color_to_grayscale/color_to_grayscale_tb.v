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


module color_to_grayscale_tb(

    );
    
    reg [7:0] tb_R_in, tb_G_in, tb_B_in;
    wire [7:0] tb_grayscale_out;
    reg tb_clk;
    integer i, j, k;
    color_to_grayscale dut(.R_in(tb_R_in),.G_in(tb_G_in),.B_in(tb_B_in),.grayscale_out(tb_grayscale_out),.clk(tb_clk)); 
    initial begin
        tb_clk = 1'b0;
        forever #1 tb_clk = ~tb_clk;
    end
    initial begin
       
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
