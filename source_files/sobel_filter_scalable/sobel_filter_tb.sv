`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.02.2024 21:39:31
// Design Name: 
// Module Name: sobel_filter_scalable_tb
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
module sobel_filter_tb # (parameter SIZE = 5)();
    reg [7:0] tb_arr_in [SIZE-1:0];
    wire [7:0] tb_arr_out [SIZE-3:0];
    reg tb_clk;
    
    sobel_filter_scalable dut(.arr_in(tb_arr_in), .arr_out(tb_arr_out), .clk(tb_clk));
    initial begin
        tb_clk = 1'b0;
        forever #1 tb_clk = ~tb_clk;
    end
    initial begin
        tb_arr_in[0] = 8'd60; tb_arr_in[1] = 8'd82; tb_arr_in[2] = 8'd71; tb_arr_in[3] = 8'd82; tb_arr_in[4] = 8'd60; #2
        tb_arr_in[0] = 8'd121; tb_arr_in[1] = 8'd174; tb_arr_in[2] = 8'd216; tb_arr_in[3] = 8'd174; tb_arr_in[4] = 8'd121; #2
        tb_arr_in[0] = 8'd88; tb_arr_in[1] = 8'd127; tb_arr_in[2] = 8'd165; tb_arr_in[3] = 8'd127; tb_arr_in[4] = 8'd88;
        
    end
endmodule
