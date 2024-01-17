`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2024 11:28:33
// Design Name: 
// Module Name: sequential_sobel
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


module sequential_sobel(
    input [7:0] current_in,
    input [7:0] left_in, right_in,
    input [9:0] left_intermediate, right_intermediate,
    output [9:0] current_intermediate,
    output [7:0] sobel_out,
    input clk
    );
    wire [9:0] sobel_X_out, sobel_Y_out;
    reg [9:0] sobel_X_reg, sobel_Y_reg;
    reg [10:0] sobel_reg;
    sequential_sobel_X X_filter(.current_in(current_in), .left_intermediate(left_intermediate), .right_intermediate(right_intermediate), 
      .current_intermediate(current_intermediate), .sobel_X_out(sobel_X_out), .clk(clk));
    sequential_sobel_Y Y_filter(.current_in(current_in), .left_in(left_in), .right_in(right_in), .sobel_Y_out(sobel_Y_out), .clk(clk));
    
    always @(posedge clk) begin
        sobel_X_reg <= sobel_X_out;
        sobel_Y_reg <= sobel_Y_out;
        sobel_reg <= sobel_X_reg + sobel_Y_reg;
    end
    assign sobel_out = sobel_reg[10:3];
endmodule
