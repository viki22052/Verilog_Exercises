module struct_mod(f, a, b, c);
input a, b, c;
output f;

wire and_1, reverse_c;

not(reverse_c, c);
and(and_1, reverse_c, b);
or(f, and_1, a);
endmodule
