`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.02.2024 11:17:51
// Design Name: 
// Module Name: sobel_X_scalable_tb
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


module sobel_X_scalable_tb# (parameter SIZE = 3)();
    reg [7:0] tb_arr_in [SIZE-1:0];
    wire [9:0] tb_arr_out [SIZE-3:0];
    reg tb_clk;
    
    sobel_X_scalable dut(.arr_in(tb_arr_in), .arr_out(tb_arr_out), .clk(tb_clk));
    
    initial begin
        tb_clk = 0;
        forever #1 tb_clk = ~tb_clk;
    end
    
    initial begin
        tb_arr_in[0] = 8'd88; tb_arr_in[1] = 8'd127; tb_arr_in[2] = 8'd165;
        #2;
        tb_arr_in[0] = 8'd121; tb_arr_in[1] = 8'd174; tb_arr_in[2] = 8'd216;
        #2;
        tb_arr_in[0] = 8'd60; tb_arr_in[1] = 8'd82; tb_arr_in[2] = 8'd71;
    end
endmodule
