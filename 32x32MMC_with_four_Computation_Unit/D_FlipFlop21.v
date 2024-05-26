module D_FlipFlop21(clk,rst,in,out);
input clk,rst;
input[20:0]in;
output reg [20:0]out;

always @(posedge clk or negedge rst)
if(!rst)
	out<=0;
else
	out<=in;
	
	
endmodule
