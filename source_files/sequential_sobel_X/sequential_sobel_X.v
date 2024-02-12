`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.01.2024 18:03:39
// Design Name: 
// Module Name: sequential_sobel_X
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


module sequential_sobel_X(
    input [7:0] current_in,
    input [9:0] left_intermediate,
    input [9:0] right_intermediate,
    output reg [9:0] current_intermediate,
    output [9:0] sobel_X_out,
    input clk
    );
    reg [7:0] shift_add_reg [1:0];
    reg [9:0] add_reg;
    reg [10:0] sobel_X_signed;
    always @(posedge clk) begin
        shift_add_reg[0] <= current_in;
        shift_add_reg[1] <= shift_add_reg[0];
        add_reg <= current_in + shift_add_reg[1];
        current_intermediate <= add_reg + {shift_add_reg[1], 1'b0};
        
        sobel_X_signed <= right_intermediate - left_intermediate;
    end
    assign sobel_X_out = sobel_X_signed[10]?~sobel_X_signed[9:0]+1:sobel_X_signed[9:0];
endmodule
