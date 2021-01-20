module counter(vin, clk, res, stop, dataout, vout);

	input vin, clk, res, stop;
	output reg [7:0] dataout;
	output reg vout;
	integer br;
	
	
	always @(posedge vin) begin
		
		if(res || stop) begin
			dataout = 0;
			br = 0;
		end
			
		
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
