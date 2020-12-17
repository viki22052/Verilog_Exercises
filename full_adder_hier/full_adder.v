module half_adder(sum, cout, x, y);
input x, y;
output sum, cout;

xor(sum, x, y);
and(cout, x, y);

endmodule

module full_adder(end_sum, end_cout, x, y, z);

input x, y, z;
output end_sum, end_cout;
wire s1, c1, c2;

half_adder B1(s1, c1, x, y);
half_adder B2(end_sum, c2, s1, z);
or(end_cout, c1, c2);

endmodule
