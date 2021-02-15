module Memory_dr(datain, clk, stop, mem_full, dataout, write_tr, res, addr);

	input [31:0] datain;
	input clk, res;
	output stop, mem_full, write_tr;
	reg write_tr;
	output reg [5:0] addr;
	output [31:0] dataout;
	wire empt;
	
	
	
	FIFO inst(datain, 1'b1, 1'b1, clk, res, dataout, empt, stop);
	
	assign mem_full = stop;
	
	
	
	
	initial begin
	
	addr = 0;
	
	end
	
	
	
	always @(posedge clk) begin
	
		if(stop != 1'b1) begin
			
			addr = addr + 6'b1;
			write_tr = 1'b1;
			
		end
		
		else begin
		
			write_tr = 1'b0;
			
		end
		
	end
	
	
	
endmodule
		
		
			
			
	
	
	