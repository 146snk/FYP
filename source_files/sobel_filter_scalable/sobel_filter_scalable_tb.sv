`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/02/02 19:54:58
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


module sobel_filter_scalable_tb #(parameter SIZE = 100)();

reg [7:0] rgb_in [SIZE-1:0];
reg tb_clk;
wire [7:0] rgb_out [SIZE-3:0];
reg [7:0] image_out [SIZE-3:0][SIZE-3:0];
reg [7:0] image [SIZE-1:0][SIZE-1:0];
integer i,j,k, result;

//readfile read(.rgb_value(rgb_in));
sobel_filter_scalable test_sobel(.clk(tb_clk), .arr_in(rgb_in), .arr_out(rgb_out));

    initial begin
        $readmemh("lena_grayscale.dat", image);
        result = $fopen("lena_sobel.csv", "w");
        i <= 0;
        j <= 0;
        k <= 0;
        tb_clk <= 0;
        forever #1 tb_clk = ~tb_clk;
    end
    

    always@(posedge tb_clk) begin
        if (i < SIZE)
            rgb_in <= image[i];
    end
    
    always@(negedge tb_clk) begin
        if ((i >= 9) && (i <= SIZE+6)) begin
            image_out[j] <= rgb_out;
            j <= j+1;
        end
        else if (i > SIZE+6) 
            if (k <= SIZE-3) begin
                $fdisplay(result, image_out[k]);
                k <= k+1;
            end 
        else $fclose(result);       
	    i <= i+1;
    end
endmodule
