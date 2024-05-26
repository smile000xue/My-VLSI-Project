module D_FlipFlop(clk,rst,in,out);
input clk,rst;
input[0:0]in;
output reg [0:0]out;

always @(posedge clk or negedge rst)
if(!rst)
	out<=0;
else
	out<=in;
	
	
endmodule
