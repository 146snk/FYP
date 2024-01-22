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


module color_to_grayscale_row(
    input [7:0] R_in,G_in,B_in,
    input clk,
    output [7:0] grayscale_out
    );
    reg [7:0]temp_out;
    reg [7:0]temp_Rout;
    reg [7:0]temp_Gout;
    reg [7:0]temp_Bout;
    always@(posedge clk)begin
       //temp_out<=R_in*0.229+G_in*0.589+B_in*0.114;
       //temp_out<=R_in/3+G_in/3+B_in/3;
       temp_Rout<=R_in/3;
       temp_Gout<=G_in/3;
       temp_Bout<=B_in/3;    
    end
    assign grayscale_out=temp_Rout+temp_Gout+temp_Bout;
endmodule
