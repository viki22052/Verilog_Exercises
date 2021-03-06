module FIFO_TB();

	reg [31:0] din;
	reg wr_en, rd_en, clk, res;
	wire [31:0] dout;
	wire empt, full;

	
	FIFO sts(din, wr_en, rd_en, clk, res, dout, empt, full);
	
	initial begin
		clk = 0;
		res = 1;
		$dumpfile("waves.vcd");
		$dumpvars(1,FIFO_TB);
	end
	
	always #50 clk = ~clk;
	
	always @(posedge clk) begin
	
		#20
		res = 0;
		#100
		wr_en = 1'b1;
		rd_en = 1'b0;
		din = 32'd10;
		#200
		din = 32'd1;
		#200
		din = 32'd16;
		#300
		wr_en = 1'b0;
		rd_en = 1'b1;
		if(dout != 32'd10) begin
			$display("Error");
			end
	end
		
endmodule
