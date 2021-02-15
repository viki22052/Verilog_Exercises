module end_mem(clk, res, datain, wr, addr);

	input clk, wr, res;
	input [31:0] datain;
	input [5:0] addr;
	reg [5:0] n;
	
	reg [31:0]mem[63:0];
	
	always @(posedge clk) begin
	
		if(res) begin
		
		for(n = 6'd63; n > 0; n = n - 6'd1) begin
		
			mem[n] = 0;
			
			end
			
		end
	
		if(wr) begin
			
			mem[addr] <= datain;
			
		end
			
	end
		
endmodule

			
	