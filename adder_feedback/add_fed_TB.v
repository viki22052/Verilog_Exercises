`timescale 1ns/100ps

module add_fed_TB();
  reg [15:0] din; 
  reg clk, res;
  wire [15:0] dout;
  
  add_fed add(din, res, clk, dout);
  initial begin
    clk = 0;
	 res = 1;
    $dumpfile("waves.vcd");
    $dumpvars(1,add_fed_TB);

  end
  
  always #100 clk = ~clk;
  
  always @(din or dout) begin
	 #50
	 res = 0;
	 #51
	 din = 16'd12;
    #101
    din = 16'd10;
    
  end
endmodule
  
    
  