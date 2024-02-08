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
    reg [15:0]temp_out;
    reg [7:0]temp_carry;
    reg [7:0]temp_sum;
    reg [5:0]cal_R=16'b00110101;
    reg [7:0]cal_G=16'b10010110;
    reg [4:0]cal_B=16'b00011101;
    reg [15:0]tempR,tempG,tempB;
    always@(posedge clk)begin
       //temp_out<=R_in*0.229+G_in*0.589+B_in*0.114;            //0.001110101,,,,0.100101101,,,,,,,,0.00011101
     tempR=R_in*cal_R;
     tempG=G_in*cal_G;
     tempB=B_in*cal_B;
     temp_out=tempR+tempB+tempG;
//       temp_Rout<=R_in/3;
//       temp_Gout<=G_in/3;
//       temp_Bout<=B_in/3;    
    end
    assign grayscale_out=temp_out[15:8];
endmodule
