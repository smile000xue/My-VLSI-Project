`timescale 1ns / 10ps
module stimulus_project1;

	reg [21-1:0] mat_output [0:4096-1];
	reg [21-1:0] mat_out;
	reg [21-1:0] out;
	reg clk;
	reg rst;
	reg start;

	wire done;

	top_controller CON(.done(done), .start(start), .clk(clk), .rst(rst));

	initial	$readmemh("D:/Project/VLSI/Practice/Project1/vec_a.txt", CON.MEM_A.array);
	initial	$readmemh("D:/Project/VLSI/Practice/Project1/vec_b.txt", CON.MEM_B.array);
	initial $readmemh("D:/Project/VLSI/Practice/Project1/vec_c.txt", mat_output);

    always #5 clk <= ~clk;
	
	initial begin
		clk = 1; rst = 0; start = 0;
		#10
		rst = 1;
		#10 start = 1;
		#10 start = 0;
		// #2622000 $stop;
	end

	integer i = 0;
	integer err = 0;

	always @(posedge clk) begin
		if(done) begin
			for(i = 0; i < 1024; i = i + 1) begin
				#(10);
				mat_out <= mat_output[i];
				out     <= CON.MEM_C.array[i];
				if(out != mat_out) err = err + 1;
			end
			#20 $stop;
		end
	end

endmodule