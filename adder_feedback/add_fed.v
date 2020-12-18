`timescale 1ns/100ps


module sum_add(din, ext_in, out);
  input [15:0] din, ext_in;
  output reg [15:0] out;
  
  
  always @(din or ext_in) begin
  out = din + ext_in;
  end
endmodule

module reg_add(clk, res, in, dout);
  input [15:0] in;
  input clk, res;
  output reg [15:0] dout;
  
  
  always @(posedge clk) begin
  if(res == 1)
  dout = 0;
  else
  dout = in;
  end
endmodule

module add_fed(din, res, clk, dout);
  input [15:0] din;
  input clk, res;
  output [15:0] dout;
  wire [15:0] out_sum;
  
  sum_add bl1(din, dout, out_sum);
  
  reg_add bl2(clk, res, out_sum, dout);
  
endmodule