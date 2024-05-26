module synthesis_matmul_ctrl(
    input clk,rst,start,
	output [8-1:0]     DO_A_d,
	output [32-1:0]    DO_B_d,
	output [20:0]mul_out_d,
	output [9:0]counter_A_d,
	output [9:0] counter_C_d,
	output [7:0]counter_B_d,
	output nce_d,done_d
	);
	
	wire [8-1:0]     DO_A;
	wire  [32-1:0]    DO_B;
	wire [20:0]mul_out;
	wire [9:0]counter_A;
	wire [9:0] counter_C;
	wire [7:0]counter_B;
	wire nce,done;
	
	matrix_multi_control mctrl0(clk,rst,start,DO_A,DO_B,mul_out,counter_A,counter_C,counter_B,nce,done);
	
	D_FlipFlop8 d0(clk,rst,DO_A,DO_A_d);
    D_FlipFlop32 d1(clk,rst,DO_B,DO_B_d);
    D_FlipFlop21 d2(clk,rst,mul_out,mul_out_d);
    D_FlipFlop10 d3(clk,rst,counter_A,counter_A_d);
    D_FlipFlop10 d4(clk,rst,counter_C,counter_C_d);
    D_FlipFlop8 d5(clk,rst,counter_B,counter_B_d);
    D_FlipFlop d6(clk,rst,nce,nce_d);
    D_FlipFlop d7(clk,rst,done,done_d);
	
endmodule