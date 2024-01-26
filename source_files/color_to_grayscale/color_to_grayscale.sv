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


module color_to_grayscale
# (parameter SIZE = 100) (
    input [7:0] R_in,G_in,B_in [SIZE-1:0],
    output [7:0]grayscale_out [SIZE-1:0],
    input clk
    );
    genvar i;
    generate
        for (i=1;i<SIZE-1;i=i+1) begin
           color_to_grayscale_row(R_in[i],G_in[i],B_in[i],grayscale_out[i]);   
        end 
    endgenerate
endmodule

