`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 17:52:38
// Design Name: 
// Module Name: sequential_nine_median_tb
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


module sequential_nine_median_tb(
    );
    reg [7:0] tb_A_in, tb_B_in, tb_C_in;
    reg tb_clk;
    wire [7:0] tb_median_out;
    sequential_nine_median dut(.A_in(tb_A_in), .B_in(tb_B_in), .C_in(tb_C_in), .median_out(tb_median_out), .clk(tb_clk));
    initial begin
        tb_A_in = 7'd0;
        tb_B_in = 7'd1;
        tb_C_in = 7'd2;
        #2;
        tb_A_in = 7'd3;
        tb_B_in = 7'd4;
        tb_C_in = 7'd5;
        #2;
        tb_A_in = 7'd6;
        tb_B_in = 7'd7;
        tb_C_in = 7'd8;
        #2;
        tb_A_in = 7'd0;
        tb_B_in = 7'd1;
        tb_C_in = 7'd2;
        #2;
        tb_A_in = 7'd3;
        tb_B_in = 7'd4;
        tb_C_in = 7'd5;
        #2;
        tb_A_in = 7'd6;
        tb_B_in = 7'd7;
        tb_C_in = 7'd8;
    end
    initial begin
        tb_clk = 0;
        forever #1 tb_clk = ~tb_clk;
    end
endmodule
