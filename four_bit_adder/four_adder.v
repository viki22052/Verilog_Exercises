module full_adder(sum, c_out, a, b, c_in);

input a, b, c_in;
output sum, c_out;

wire s1, c1, c2;

xor(s1, a, b);
and(c1, a, b);

xor(sum, s1, c_in);
and(c2, s1, c_in);
or(c_out, c1, c2);

endmodule

module four_adder(sum, c_out, a, b, c_in);

input [3:0] a, b;
input c_in;
output c_out;
output [3:0] sum;
wire c1, c2, c3;

full_adder fa0(sum[0], c1, a[0], b[0], c_in);
full_adder fa1(sum[1], c2, a[1], b[1], c1);
full_adder fa2(sum[2], c3, a[2], b[2], c2);
full_adder fa3(sum[3], c_out, a[3], b[3], c3);

endmodule
