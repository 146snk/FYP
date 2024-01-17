`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2023 12:36:27
// Design Name: 
// Module Name: three_sort_tb
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


module three_sort_tb(
    );
    reg [7:0] tb_A_in, tb_B_in, tb_C_in; 
    reg tb_clk;
    wire [7:0] tb_L_out, tb_M_out, tb_S_out;
    reg correct;
    three_sort uut(.A_in(tb_A_in), .B_in(tb_B_in), .C_in(tb_C_in), .L_out(tb_L_out), .M_out(tb_M_out), .S_out(tb_S_out), .clk(tb_clk));
    
    integer i, j, k;
    initial begin
        for(k=0;k<256;k=k+1)begin
        tb_C_in = k;
            for(j=0;j<256;j=j+1)begin
                tb_B_in = j;
                for(i=0;i<256;i=i+1)begin
                    tb_A_in = i;
                    tb_clk = 1'b0;
                    #5;
                    tb_clk = 1'b1;
                    #5;
                end
            end
        end
    end
    
    always @(*) begin
        if (tb_L_out>=tb_M_out && tb_M_out>=tb_S_out)
            correct = 1'b1;
        else 
            correct = 1'b0;
    end
endmodule
