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


module color_to_grayscale_scalable_tb # (parameter SIZE = 100)();

reg [7:0] R_arr_in [SIZE-1:0];
reg [7:0] G_arr_in [SIZE-1:0];
reg [7:0] B_arr_in [SIZE-1:0];
reg tb_clk;
wire [7:0] gray_out [SIZE-1:0];
reg [7:0] image_out [SIZE-1:0][SIZE-1:0];
reg [7:0] image_red [SIZE-1:0][SIZE-1:0];
reg [7:0] image_green [SIZE-1:0][SIZE-1:0];
reg [7:0] image_blue [SIZE-1:0][SIZE-1:0];
integer i,j,k, result;


//readfile read(.rgb_value(rgb_in));
color_to_grayscale test_gray(.clk(tb_clk), .R_arr_in(R_arr_in), .G_arr_in(G_arr_in), 
                             .B_arr_in(B_arr_in), .gray_arr_out(gray_out));

    initial begin
        $readmemh("lena_red.dat", image_red);
        $readmemh("lena_green.dat", image_green);
        $readmemh("lena_blue.dat", image_blue);
        result = $fopen("color2grayscale.csv", "w");
        i <= 0;
        j <= 0;
        k <= 0;
        tb_clk <= 0;
        forever #1 tb_clk = ~tb_clk;
    end
    

    always@(posedge tb_clk) begin
        if (i < SIZE) begin
            R_arr_in <= image_red[i];
            G_arr_in <= image_green[i];
            B_arr_in <= image_blue[i];
        end
    end
    
    always@(negedge tb_clk) begin
        if ((i >= 3) && (i <= SIZE+2)) begin
            image_out[j] <= gray_out;
            j <= j+1;
        end
        else if (i > SIZE+2) 
            if (k < SIZE) begin
                $fdisplay(result, image_out[k]);
                k <= k+1;
            end 
        else $fclose(result);       
	    i <= i+1;
    end
    
       
endmodule