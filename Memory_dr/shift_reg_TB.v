`timescale 1ns/100ps
module shift_reg_TB();
  
  reg [7:0] datain;
  reg clk, vin;
  wire [31:0]dataout;
  
  shift_reg mod(clk, datain, vin, dataout);
  
  
  initial begin
    clk = 0;
    vin = 1'b0;
	 datain = 0;
    $dumpfile("waves.vcd");
    $dumpvars(1,shift_reg_TB);
    
  end
  
  always #100 clk = ~clk;
  
  always @(posedge clk) begin
    
    datain = 8'd10;
    #75
    datain = 8'd13;
    #75
    datain = 8'd15;
    #75
    datain = 8'd11;
    #76
    vin = 1'b1;
    #100
    vin = 1'b0;
    
  end
  
endmodule
