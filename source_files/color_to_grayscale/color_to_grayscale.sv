`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/22 18:42:45
// Design Name: 
// Module Name: color_to_grayscale
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


module color_to_grayscale # (parameter SIZE = 100) (
    input [7:0] R_arr_in [SIZE-1:0], 
    input [7:0] G_arr_in [SIZE-1:0], 
    input [7:0] B_arr_in [SIZE-1:0],
    output [7:0] gray_arr_out [SIZE-1:0],
    input clk
    );
    integer result;
    genvar i;
    generate
        for (i=0;i<SIZE;i=i+1) begin
            color_to_grayscale_row grayscale(.R_in(R_arr_in[i]), .G_in(B_arr_in[i]), .B_in(B_arr_in[i]), .grayscale_out(gray_arr_out[i]), .clk(clk));
        end 
    endgenerate
    
endmodule
