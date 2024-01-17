`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 17:30:40
// Design Name: 
// Module Name: sequential_nine_median
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


module sequential_nine_median(
    input [7:0] A_in,
    input [7:0] B_in,
    input [7:0] C_in,
    output [7:0] median_out,
    input clk
    );
    reg [7:0] row_L_reg, row_M_reg, row_S_reg, column_LS_reg, column_MM_reg, column_SL_reg;
    wire [7:0] row_L_out, row_M_out, row_S_out, column_LS_out, column_MM_out, column_SL_out;
    
    three_sort row_sorter(.A_in(A_in), .B_in(B_in), .C_in(C_in), .L_out(row_L_out), .M_out(row_M_out), .S_out(row_S_out), .clk(clk));
    column_sort column_sorter_L (.A_in(row_L_reg), .S_out(column_LS_out), .clk(clk));
    column_sort column_sorter_M (.A_in(row_M_reg), .M_out(column_MM_out), .clk(clk));
    column_sort column_sorter_S (.A_in(row_S_reg), .L_out(column_SL_out), .clk(clk));
    three_sort diagonal_sorter(.A_in(column_LS_reg), .B_in(column_MM_reg), .C_in(column_SL_reg), .M_out(median_out), .clk(clk));
    
    always @(posedge clk) begin
        row_L_reg <= row_L_out;
        row_M_reg <= row_M_out;
        row_S_reg <= row_S_out;
        column_LS_reg <= column_LS_out;
        column_MM_reg <= column_MM_out;
        column_SL_reg <= column_SL_out;
    end
endmodule
