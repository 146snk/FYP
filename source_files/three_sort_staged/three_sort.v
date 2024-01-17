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
    output [7:0] S_out,
    input clk
    );
    // intermediate registers
    reg A_GT_B, B_GT_C, C_GT_A;
    reg [7:0] tempA, tempB, tempC;
    always @ (posedge clk) begin
        A_GT_B <= A_in > B_in;
        B_GT_C <= B_in > C_in;
        C_GT_A <= C_in > A_in;
        tempA <= A_in; tempB <= B_in; tempC <= C_in;
    end
    
    assign L_out = A_GT_B? (C_GT_A?tempC:tempA) :(B_GT_C?tempB:tempC);
    assign M_out = A_GT_B? (B_GT_C?tempB: (C_GT_A?tempA:tempC) ) :(B_GT_C? (C_GT_A?tempC:tempA) :tempB);
    assign S_out = A_GT_B? (B_GT_C?tempC:tempB) : (C_GT_A?tempA:tempC);
endmodule
