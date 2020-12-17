module testbench;
reg x, y, z;

wire end_cout, end_sum;

full_adder dut(.x(x), .y(y), .z(z), .end_cout(end_cout), .end_sum(end_sum));

initial begin
	#1
		x = 0;
		y = 0;
		z = 0;
		
	#20
		x = 1;
		y = 0;
		z = 0;
	#40
		x = 0;
		y = 1;
		z = 0;
	#50
		x = 1;
		y = 1;
		z = 0;
	#60
		x = 0;
		y = 0;
		z = 1;
	#70
		x = 1;
		y = 0;
		z = 1;
	#80
		x = 0;
		y = 1;
		z = 1;
	#90
		x = 1;
		y = 1;
		z = 1;
	#90 $finish;
end
endmodule
