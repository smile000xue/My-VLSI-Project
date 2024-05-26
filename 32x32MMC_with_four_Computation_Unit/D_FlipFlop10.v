module D_FlipFlop10(clk,rst,in,out);
input clk,rst;
input[9:0]in;
output reg [9:0]out;

always @(posedge clk or negedge rst)
if(!rst)
	out<=0;
else
	out<=in;
	
	
endmodule
