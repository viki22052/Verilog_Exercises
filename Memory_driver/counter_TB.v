module counter_TB();

	reg vin, clk;
	wire [7:0] dataout;
	wire vout;
	
	
	
	counter test(vin, clk, dataout, vout);
	
	initial begin
		clk = 0;
		
		vin = 0;
		
		$dumpfile("c_waves.vcd");
		
		$dumpvars(1,counter_TB);
		
	end
	
	always #50 clk = ~clk;
	
	always @(posedge clk) begin
	
		#10
		vin = 1;
		#55
		vin = 0;
		
	end
	
endmodule
	