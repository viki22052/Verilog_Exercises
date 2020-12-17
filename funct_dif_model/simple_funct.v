module simple_funct(f, a, b, c);
input a, b, c;
output f;



assign f = a | b&~c;

endmodule
