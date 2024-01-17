`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2024 10:44:04
// Design Name: 
// Module Name: sequential_sobel_Y_tb
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


module sequential_sobel_Y_tb(
    );
    reg [7:0] tb_current_in, tb_left_in, tb_right_in;
    wire [9:0] tb_sobel_Y_out;
    reg tb_clk;
    sequential_sobel_Y dut(.current_in(tb_current_in), .left_in(tb_left_in), .right_in(tb_right_in), .sobel_Y_out(tb_sobel_Y_out), .clk(tb_clk));
    initial begin
        tb_clk = 1'b0;
        forever #1 tb_clk = ~tb_clk;
    end
    initial begin
        tb_left_in = 1; tb_current_in = 2; tb_right_in = 3;
        #2
        tb_left_in = 4; tb_current_in = 5; tb_right_in = 6;
        #2
        tb_left_in = 0; tb_current_in = 0; tb_right_in = 0;
        #2
        tb_left_in = 14; tb_current_in = 15; tb_right_in = 16;
        
    end
    
    
endmodule
