module color_to_grayscale_tb(
    );
    parameter SIZE = 100;
    reg [7:0] tb_R_in, tb_G_in, tb_B_in[SIZE-1:0];
    wire [9:0] tb_grayscale_out[SIZE-1:0];
    reg tb_clk;
   
    genvar i;
    generate
//        for (i=1;i<SIZE-1;i=i+1) begin
////            tb_R_in[i] = $urandom_range(255);
////            tb_G_in[i] = $urandom_range(255);
////            tb_B_in[i] = $urandom_range(255);
//        end
    for(i=0;i<SIZE;i=i+1)begin
        tb_R_in[i] <=  $urandom_range(255); ;
        tb_G_in[i] <=  $urandom_range(255);;
        tb_B_in[i] <=  $urandom_range(255);;
         #10;
        end
    endgenerate
     color_to_grayscalescalable dut(.R_in(tb_R_in[i]),.G_in(tb_G_in[i]),.B_in(tb_B_in[i]),.grayscale_out(tb_grayscale_out[i]));
    initial begin
        tb_clk = 1'b0;
        forever #1 tb_clk = ~tb_clk;
    end
endmodule