module D_FlipFlop8(clk,rst,in,out);
input clk,rst;
input[7:0]in;
output reg [7:0]out;

always @(posedge clk or negedge rst)
if(!rst)
	out<=0;
else
	out<=in;
	
	
endmodule
