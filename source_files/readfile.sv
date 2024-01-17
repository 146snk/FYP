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


module readfile # (parameter SIZE = 100)(
    output [7:0]rgb_value[SIZE:0]
    );
    reg [7:0] rgb [SIZE:0];
    integer i;
    initial begin
        $readmemh("original.dat", rgb);
    end
    assign rgb_value = rgb;
endmodule
