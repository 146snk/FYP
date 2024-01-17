`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2024 12:35:46
// Design Name: 
// Module Name: sequential_sobel_tb
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


module sequential_sobel_tb(
    );
    reg [7:0] tb_current_inout, left_in, right_in;
    reg [9:0] tb_left_intermediate, tb_right_intermediate;
    wire [9:0] current_intermediate;
    wire [7:0] tb_sobel_out;
    reg tb_clk;
    sequential_sobel dut(.current_inout(tb_current_inout), .left_in(tb_left_in), .right_in(tb_right_in),
      .left_intermediate(tb_left_intermediate), .right_intermediate(tb_right_intermediate), .current_intermediate(tb_current_intermediate), 
      .sobel_out(tb_sobel_out), .clk(tb_clk));
    initial begin
        tb_clk = 1'b0;
        forever #1 tb_clk = ~tb_clk;
    end
  
endmodule
