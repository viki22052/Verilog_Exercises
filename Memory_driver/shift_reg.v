`timescale 1ns/100ps
module shift_reg(clk, res, datain, vin, dataout);

	input clk, vin, res;
	input [7:0] datain;
	output reg [31:0] dataout;
	reg [31:0]conc_par;
	
	
	always @(posedge clk) begin
			
			if(res) begin
				
				dataout = 0;
				
			end
		
			
			if(vin == 1'b1) begin
			
				dataout <= conc_par;
			
			end
			
		conc_par = {conc_par[23:0], datain};
			
		end
	endmodule
	