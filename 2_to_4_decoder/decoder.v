module decoder(y, a, b, en);

output [3:0]y;
input a, b, en;

reg [3:0]y;
always @(a or b or en)
begin

if(en == 1)
begin

case({a, b})

	2'b00: {y[3], y[2], y[1], y[0]} = 4'b0001;
	2'b01: {y[3], y[2], y[1], y[0]} = 4'b0010;
	2'b10: {y[3], y[2], y[1], y[0]} = 4'b0100;
	2'b11: {y[3], y[2], y[1], y[0]} = 4'b1000;
	default: {y[3], y[2], y[1], y[0]} = 4'bxxxx;
endcase
end
else
{y[3], y[2], y[1], y[0]} = 4'b0000;

end
endmodule


