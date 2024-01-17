`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/17 16:15:10
// Design Name: 
// Module Name: readfile
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


module readfile_tb # (parameter SIZE = 100)();

reg [7:0] rgb_in [SIZE-1:0];
reg tb_clk;
reg [7:0] rgb_out [SIZE-3:0];

readfile read(.rgb_value(rgb_in));
median_filter_scalable test_med(.clk(tb_clk), .arr_in(rgb_in), .arr_out(rgb_out));

    initial begin
        tb_clk = 0;
        forever #1 tb_clk = ~tb_clk;
    end
    
endmodule
