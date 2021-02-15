`timescale 1ns/100ps

module d_flip(din, clk, res, q, revq);

	input din, clk, res;
	output q, revq;
	reg q;

	assign revq = ~q;

always @(clk) begin

	if(res == 0)
		q = 0;

	else 
		q = din;
end
endmodule

module valid_in(din, clk, res, out);

	input din, clk, res;
	output out;
	wire q1, revq1, q2, revq2;
	
	d_flip bl1(din, clk, res, q1, revq1);
	d_flip bl2(q1, clk, res, q2, revq2);
	and(out, q1, revq2);
	
endmodule


