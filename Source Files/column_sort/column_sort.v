`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 11:49:43
// Design Name: 
// Module Name: column_sort
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


module column_sort(
    input [7:0] A_in,
    output [7:0] L_out,
    output [7:0] M_out,
    output [7:0] S_out,
    input clk
    );
    reg [7:0] B_in, C_in;
    three_sort sorter (.A_in(A_in), .B_in(B_in), .C_in(C_in), .L_out(L_out), .M_out(M_out), .S_out(S_out), .clk(clk));
    always @ (posedge clk) begin
        B_in <= A_in;
        C_in <= B_in;
    end
endmodule
