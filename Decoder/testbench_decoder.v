module testbench;
reg a, b, en = 1;
wire [3:0]y;

decoder dut(.a(a), .b(b), .en(en), .y(y));

initial begin
	#1
		a = 0;
		b = 0;
	#20
		a = 0;
		b = 1;
	#40
		a = 1;
		b = 0;
	#50
		a = 1;
		b = 1;
	#50 $finish;
end
endmodule
