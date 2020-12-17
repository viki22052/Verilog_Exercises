module testbench;

reg a, b;
wire out;

andFunct dut(.a(a), .b(b), .out(out));
initial begin 
#1
a = 0; 
b = 0;

#20 
a = 0;
b = 1; 

#40
a = 1; 
b = 0;

#50 
a = 1;
b = 1; 

#50 $finish;
end endmodule