`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.12.2023 15:20:12
// Design Name: 
// Module Name: median_filter_scalable
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


module median_filter_scalable
# (parameter SIZE = 100) (
    input [7:0] arr_in [SIZE-1:0],
    output [7:0] arr_out [SIZE-3:0],
    input clk
    );
    genvar i;
    generate
        for (i=1;i<SIZE;i=i+1) begin
            sequential_nine_median median(.A_in(arr_in[i-1]), .B_in(arr_in[i]), .C_in(arr_in[i+1]), .median_out(arr_out[i-1]), .clk(clk));
        end 
    endgenerate
endmodule
