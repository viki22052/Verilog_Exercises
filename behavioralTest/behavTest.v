module behavTest( A, B, Cin, S, Cout);

 input wire A, B, Cin;
 output reg S, Cout;

 always @(A or B or Cin)
  begin 
   S = A ^ B ^ Cin; 
   Cout = A&B | (A^B) & Cin; 
  end
  
endmodule