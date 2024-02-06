`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.01.2024 19:11:27
// Design Name: 
// Module Name: sobel_filter_scalable
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


module sobel_filter_scalable
# (parameter SIZE = 100) ( // change SIZE to vary system size
    input [7:0] arr_in [SIZE-1:0],
    output [7:0] arr_out [SIZE-3:0],
    input clk
    );
    wire [9:0] intermediate [SIZE-1:0];
    genvar i;
    generate
        for(i=1; i<=SIZE-1; i=i+1) begin
            sequential_sobel sobel(.current_in(arr_in[i]), .left_in(arr_in[i-1]), .right_in(arr_in[i+1]), 
              .current_intermediate(intermediate[i]), .left_intermediate(intermediate[i-1]), .right_intermediate(intermediate[i+1]), 
              .sobel_out(arr_out[i-1]), .clk(clk));
        end
    endgenerate
    sequential_sobel sobel_0(.current_in(arr_in[0]), .right_in(arr_in[1]), 
              .current_intermediate(intermediate[0]), .right_intermediate(intermediate[1]), 
              .clk(clk));
endmodule
