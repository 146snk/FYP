`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/02/07 20:56:18
// Design Name: 
// Module Name: color_to_grayscale_round
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


module color_to_grayscale_round(
input [15:0] R_in,G_in,B_in,
    output [7:0] grayscale_out,
    input clk
    );
    reg [15:0]temp_Rout;
    reg [15:0]temp_Gout;
    reg [15:0]temp_Bout;
    reg [7:0]temp_carry;
    reg [7:0]temp_sum;
    reg [15:0]cal_R=16'b00000000_00110101;
    reg [15:0]cal_G=16'b00000000_10010110;
    reg [15:0]cal_B=16'b00000000_00011101;
    reg [31:0]tempR,tempG,tempB;
    always@(posedge clk)begin
       //temp_out<=R_in*0.229+G_in*0.589+B_in*0.114;            //0.001110101,,,,0.100101101,,,,,,,,0.00011101
     tempR=R_in*cal_R;
     tempG=G_in*cal_G;
     tempB=B_in*cal_B;
     
     temp_Rout=tempR[24:17];
     temp_Gout=tempG[24:17];
     temp_Bout=tempB[24:17];
//       temp_Rout<=R_in/3;
//       temp_Gout<=G_in/3;
//       temp_Bout<=B_in/3;    
    end
    assign grayscale_out=temp_Rout+temp_Gout+temp_Bout;
endmodule
