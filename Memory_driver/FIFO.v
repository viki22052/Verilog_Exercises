module FIFO(din, wr_en, rd_en, clk, res, dout, empt, full);

input [31:0] din;
input wr_en, rd_en, clk, res;
output reg [31:0] dout;
output reg empt, full;

reg [31:0]buff[0:7];
reg [2:0] count, rdcount, wrcount;

		
always @(posedge clk) begin


	if(res) begin
		rdcount = 0;
		wrcount = 0;
		count = 0;
	end
	
	if(wr_en == 1'b1 && count <= 7) begin
		buff[wrcount] = din;
		wrcount = wrcount + 1;
	end
	
	if(rd_en == 1'b1 && count != 0) begin
		dout = buff[rdcount];
		rdcount = rdcount + 1;
	end
	
	if(wrcount == 7) begin
		wrcount = 0;
	end
		
	if(rdcount == 7) begin
		rdcount = 0;
	end
		
	if(wrcount > rdcount) begin
		count = wrcount - rdcount;
	end
		
	if(wrcount < rdcount) begin
		count = rdcount - wrcount;
	end
	
	///count check
	if(count == 8) begin
		full = 1'b1;
	end
	
	else begin
		full = 1'b0;
	end
	
	if(count == 0) begin
		empt = 1'b1;
	end
	
	else begin
		empt = 1'b0;
	end
	
end

endmodule
