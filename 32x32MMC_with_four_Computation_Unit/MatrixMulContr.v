module MatrixMulContr(input clk,rst,
	input [8-1:0] DO_A,DO_B,
	input [4:0]counter0,
	output reg [20:0]mul_out);
	
	wire [16-1:0] mul_out0;
	reg [21-1:0] mul_out1;
	reg [21-1:0] mul_out2;
	wire [21-1:0] mul_out4;
	
assign mul_out0=DO_A*DO_B;


always @(*)
    mul_out2=mul_out0+mul_out1;


always @(posedge clk)
if(!rst)
	mul_out<=0;
else
	mul_out<=mul_out2;
	
always @(*)
if(counter0==5'b00001)
	mul_out1=21'b0;
else
	mul_out1=mul_out4;
	
assign mul_out4=mul_out;
	
	
endmodule
	
	