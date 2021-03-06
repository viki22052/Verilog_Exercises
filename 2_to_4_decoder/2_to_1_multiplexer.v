module 2_to_1_multiplexer(cout, a, b, sel);

input a, b, sel;
output cout;
wire and_1, and_2, reverse_sel;

not(reverse_sel, sel);
and(and_1, a, reverse_sel);
and(and_2, b, sel);
or(cout, and_1, and_2);

endmodule
