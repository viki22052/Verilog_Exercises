`timescale 1ns/100ps

module valid_in_TB();
	reg din, clk, res;
	wire out;

valid_in mod(din, clk, res, out);

initial begin
	clk <= 0;
	res <= 0;
	din <= 0;
	#10
	din <= 1;
	#50
	res <= 1;


	$dumpfile("waves.vcd");
	$dumpvars(1,valid_in_TB);

end

always #50 clk = ~clk;

always @(posedge din) begin

	#25
	din = 0;
	#27
		if(out != 1)
			$display("Error"); 
	#200
	din = 1;

end

endmodule
