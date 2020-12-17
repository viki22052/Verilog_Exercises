`timescale 1ns/100ps

module dig_clk_TB();
  reg clk;
  wire [7:0] min_u_t, hour_u_t;
  
  dig_clk clk_mod(clk, min_u_t, hour_u_t);
  
  
  always #100 clk = ~clk;
    initial begin
    clk = 1;
    $dumpfile("clk_waves.vcd");
    $dumpvars(1, dig_clk_TB);
  
  end
endmodule