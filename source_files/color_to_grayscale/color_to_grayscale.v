`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/22 18:01:49
// Design Name: 
// Module Name: color_to_grayscale_row
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

module color_to_grayscale(
    input [7:0] R_in,G_in,B_in,
    output [7:0] grayscale_out,
    input clk
    );
    reg [15:0] weighted_R,weighted_G,weighted_B;
    reg [15:0] add_R_B, temp_G;
    reg [15:0] grayscale_reg;
    always@(posedge clk)begin
       //grayscale_reg<=R_in*0.229+G_in*0.589+B_in*0.114;            //0.001110101,,,,0.100101101,,,,,,,,0.00011101
         weighted_R <= R_in*16'b00110101; // 0.229d  0.001110101b
         weighted_G <= G_in*16'b10010110; // 0.589d  0.100101101b
         weighted_B <= B_in*16'b00011101; // 0.114d  0.00011101b
         add_R_B <= weighted_R + weighted_B;
         temp_G <= weighted_G;
         grayscale_reg <= add_R_B + weighted_G;
    end
    assign grayscale_out=grayscale_reg[15:8];
endmodule
