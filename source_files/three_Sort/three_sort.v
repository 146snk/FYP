`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Hong Kong University of Science and Technology
// Engineer: 146snk
// 
// Design Name: three_sort module
// Module Name: three_sort
// Project Name: ZW01a_23
// Description: take three inputs, sort and output them
// 
// Dependencies: NONE
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module three_sort(
    input [7:0] A_in,
    input [7:0] B_in,
    input [7:0] C_in,
    output [7:0] L_out,
    output [7:0] M_out,
    output [7:0] S_out
    );
    wire A_GT_B, B_GT_C, C_GT_A;
    assign A_GT_B = A_in > B_in;
    assign B_GT_C = B_in > C_in;
    assign C_GT_A = C_in > A_in;
    
    assign L_out = A_GT_B? (C_GT_A?C_in:A_in) :(B_GT_C?B_in:C_in);
    assign M_out = A_GT_B? (B_GT_C?B_in: (C_GT_A?A_in:C_in) ) :(B_GT_C? (C_GT_A?C_in:A_in) :B_in);
    assign S_out = A_GT_B? (B_GT_C?C_in:B_in) : (C_GT_A?A_in:C_in);
endmodule
