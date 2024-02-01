`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.02.2024 10:59:42
// Design Name: 
// Module Name: sobel_X_scalable
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
module sobel_X_scalable
# (parameter SIZE = 3) ( // change SIZE to vary system size
    input [7:0] arr_in [SIZE-1:0],
    output [9:0] arr_out [SIZE-3:0],
    input clk
    );
    wire [9:0] intermediate [SIZE-1:0];
    genvar i;
    generate
        for(i=0; i<SIZE; i=i+1) begin
        sequential_sobel_X sobel_x(
            .current_in(arr_in[i]),
            .left_intermediate(intermediate[i-1]),
            .right_intermediate(intermediate[i+1]),
            .current_intermediate(intermediate[i]),
            .sobel_X_out(arr_out[i-1]),
            .clk(clk)
        );
        end
    endgenerate
endmodule
