`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 11:53:26
// Design Name: 
// Module Name: column_sort_tb
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


module column_sort_tb(
    );
    reg [7:0] tb_A_in; 
    reg tb_clk;
    wire [7:0] tb_L_out, tb_M_out, tb_S_out;
    column_sort dut (.A_in(tb_A_in), .L_out(tb_L_out), .M_out(tb_M_out), .S_out(tb_S_out), .clk(tb_clk));
    initial begin
        tb_clk = 1'b0;
        forever #1 tb_clk = ~tb_clk;
    end
    
    initial begin
        tb_A_in = 8'd0;
        #2;
        tb_A_in = 8'd9;
        #2;
        tb_A_in = 8'd15;
        #2;
        tb_A_in = 8'd12;
        #2;
        tb_A_in = 8'd8;
        #2;
        tb_A_in = 8'd10;
        #2;
        tb_A_in = 8'd7;
        #2;
        #2;
        tb_A_in = 8'd7;
        #2;
    end
endmodule
