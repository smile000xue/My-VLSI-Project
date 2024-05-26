module top_controller(
	output done,
	input start,clk,rst);
	
	wire [9:0]counter_A;
	wire [7:0]counter_B;
	wire [9:0]counter_C;
	wire  [8-1:0]     DO_A;
	wire  [32-1:0]    DO_B;
	wire nce;
	wire [21-1:0]    DO;
	wire [20:0]mul_out;

    matrix_multi_control mmc0(clk,rst,start,DO_A,DO_B,mul_out,counter_A,counter_C,counter_B,nce,done);
	
	rflp1024x8mx2 MEM_A(DO_A,8'b0,counter_A[9:2],counter_A[1:0],1'b1,nce,clk);
	rflp256x32mx2 MEM_B(DO_B,32'b0,counter_B[7:2],counter_B[1:0],1'b1,nce,clk);
	rflp1024x21mx2 MEM_C(DO,mul_out,counter_C[9:2],counter_C[1:0],1'b0,nce,clk);
	
endmodule
	
	
	
	
	