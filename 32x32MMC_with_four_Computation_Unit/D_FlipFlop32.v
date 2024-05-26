module D_FlipFlop32(clk,rst,in,out);
input clk,rst;
input[31:0]in;
output reg [31:0]out;

always @(posedge clk or negedge rst)
if(!rst)
	out<=0;
else
	out<=in;
	
	
endmodule
