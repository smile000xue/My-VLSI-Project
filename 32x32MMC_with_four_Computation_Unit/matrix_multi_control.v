module matrix_multi_control(
    input clk,rst,start,
	output [8-1:0]     DO_A,
	output  [32-1:0]    DO_B,
	output reg [20:0]mul_out,
	output [9:0]counter_A,
	output reg [9:0] counter_C,
	output [7:0]counter_B,
	output reg nce,done
	);
	
	reg [13:0]counter0;
	wire [20:0]mul_out0,mul_out1,mul_out2,mul_out3;
	wire [20:0]mul_out10,mul_out20,mul_out21,mul_out30,mul_out31,mul_out32;
	wire [21-1:0]    DO;
	reg done1;
	
	always @(posedge clk)
	if(!rst)
	begin
		nce<=1;
		done<=0;
	end
	else if(start)
	begin
		nce<=0;
		done<=0;
	end
	else if(done1)
	 begin
		nce<=1;
		done<=1;
	end
	else
	begin
		nce<=nce;
		done<=0;
	end
	   
	 always@(posedge clk)
	if (!rst)
	done1<=0;
	else if (counter0==14'd8197)
	done1<=1;
	else if (counter0==14'd8198)
	done1<=0;
	   
	always @(posedge clk)
	if(!rst)
	begin
		counter0<=0;
	end
	else if(!nce)
		counter0<=counter0+1;
		
		
	assign counter_A=counter0[12:8]*32+counter0[4:0];
	assign counter_B=counter0[4:0]*8+counter0[7:5];
	


	
	MatrixMulContr mmc0(clk,rst,DO_A,DO_B[31:24],counter0[4:0],mul_out0);
	MatrixMulContr mmc1(clk,rst,DO_A,DO_B[23:16],counter0[4:0],mul_out1);
	MatrixMulContr mmc2(clk,rst,DO_A,DO_B[15:8],counter0[4:0],mul_out2);
	MatrixMulContr mmc3(clk,rst,DO_A,DO_B[7:0],counter0[4:0],mul_out3);
	
	D_FlipFlop21 d0(clk,rst,mul_out1,mul_out10);
	D_FlipFlop21 d1(clk,rst,mul_out2,mul_out20);
	D_FlipFlop21 d2(clk,rst,mul_out20,mul_out21);
	D_FlipFlop21 d3(clk,rst,mul_out3,mul_out30);
	D_FlipFlop21 d4(clk,rst,mul_out30,mul_out31);
	D_FlipFlop21 d5(clk,rst,mul_out31,mul_out32);
	
	
	always@(posedge clk)
	if (!rst)
	counter_C<=0;
	else if (counter0>=6'd33&&counter0%6'd32>=1'd1&&counter0%6'd32<=3'd4)
	begin
	counter_C<=counter_C+1;
	if(counter_C==10'd1023)
	counter_C<=counter_C;
	end
	else
	counter_C<=counter_C;
	
	
	always@(*)
	if (!rst)
	mul_out<=0;
	else if (counter_C%3'd4==2'd0)
	mul_out<=mul_out0;
	else if (counter_C%3'd4==2'd1)
	mul_out<=mul_out10;
	else if (counter_C%3'd4==2'd2)
	mul_out<=mul_out21;
	else if (counter_C%3'd4==2'd3)
	mul_out<=mul_out32;
	
endmodule
	
	
	
	
	