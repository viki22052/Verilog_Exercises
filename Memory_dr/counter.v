module counter(vin, clk, dataout, vout);

	input vin, clk;
	output reg [7:0] dataout;
	output reg vout;
	reg br;
	
	always @(posedge vin) begin
		vout = 1'b0;
		
		if(clk) begin
			
			dataout = dataout + 1;
			br = br + 1;
			end
			
		if(br == 4) begin
			vout = 1'b1;
			br = 0;
			end
			
	end
endmodule
