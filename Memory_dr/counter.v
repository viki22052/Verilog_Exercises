module counter(vin, clk, dataout, vout);

	input vin, clk;
	output reg [7:0] dataout;
	output reg vout;
	integer br;
	
	initial begin
	
		dataout = 0;
		br = 0;
		
	end
	
	always @(posedge vin) begin
		
		
		if(clk) begin
		
			vout = 1'b0;
			dataout = dataout + 1;
			br = br + 1;
			
		end
			
		if(br == 4) begin
	
			vout = 1'b1;
			br = 0;
			
		end
			
	end
	
	
endmodule
