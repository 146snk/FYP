`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.01.2024 22:09:10
// Design Name: 
// Module Name: sequential_sobel_Y
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


module sequential_sobel_Y(
    input [7:0] current_in,
    input [7:0] left_in,
    input [7:0] right_in,
    output [9:0] sobel_Y_out,
    input clk
    );
    wire [8:0] current_in_shifted;
    reg [9:0] add_reg [2:0];
    reg[10:0] sobel_Y_reg;
    
    always @ (posedge clk)begin
        add_reg[0] <= current_in_shifted + left_in + right_in;
        add_reg[1] <= add_reg[0];
        add_reg[2] <= add_reg[1];
        sobel_Y_reg <= add_reg[2] - add_reg[0];
    end
    assign current_in_shifted = {current_in, 1'b0};
    assign sobel_Y_out = (sobel_Y_reg[10]==1)?~sobel_Y_reg[9:0]:sobel_Y_reg[9:0];
endmodule
