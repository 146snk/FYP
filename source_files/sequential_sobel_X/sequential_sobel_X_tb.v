`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.01.2024 18:25:06
// Design Name: 
// Module Name: sequential_sobel_X_tb
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


module sequential_sobel_X_tb(
    );
    reg [7:0] tb_current_in;
    reg [9:0] tb_left_intermediate, tb_right_intermediate;
    reg tb_clk;
    wire [9:0] tb_sobel_X_out;
    wire [9:0] tb_current_intermediate;
    initial begin
        tb_clk = 1'b0;
        forever #1 tb_clk = ~tb_clk;
    end
    initial begin
        tb_current_in = 8'd88; tb_left_intermediate = 10'd390; tb_right_intermediate = 10'd668;
        #2 tb_current_in = 8'd121;
        #2 tb_current_in = 8'd60; tb_left_intermediate = 10'd15; tb_right_intermediate = 10'd10;
    end
    sequential_sobel_X dut(.current_in(tb_current_in), .current_intermediate(tb_current_intermediate), .left_intermediate(tb_left_intermediate), .right_intermediate(tb_right_intermediate), .sobel_X_out(tb_sobel_X_out), .clk(tb_clk));
endmodule
