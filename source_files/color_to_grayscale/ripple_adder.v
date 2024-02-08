`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/02/07 19:35:46
// Design Name: 
// Module Name: ripple_adder
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


module ripple_adder(
    input [7:0]a,b,
    input cin,
    output [7:0]sum,
    output cout
    );
    wire[6:0]c_arr;
    full_adder a0(.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.cout(c_arr[0]));
    full_adder a1(.a(a[1]),.b(b[1]),.cin(c_arr[0]),.sum(sum[1]),.cout(c_arr[1]));
    full_adder a2(.a(a[2]),.b(b[2]),.cin(c_arr[1]),.sum(sum[2]),.cout(c_arr[2]));
    full_adder a3(.a(a[3]),.b(b[3]),.cin(c_arr[2]),.sum(sum[3]),.cout(c_arr[3]));
    full_adder a4(.a(a[4]),.b(b[4]),.cin(c_arr[3]),.sum(sum[4]),.cout(c_arr[4]));
    full_adder a5(.a(a[5]),.b(b[5]),.cin(c_arr[4]),.sum(sum[5]),.cout(c_arr[5]));
    full_adder a6(.a(a[6]),.b(b[6]),.cin(c_arr[5]),.sum(sum[6]),.cout(c_arr[6]));
    full_adder a7(.a(a[7]),.b(b[7]),.cin(c_arr[6]),.sum(sum[7]),.cout(cout));
endmodule
