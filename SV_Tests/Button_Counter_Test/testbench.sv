`include "interface.sv"
`include "program_run.sv"


module button_counter_TB();
  
  bit clk, rst;
  
  bct_tb tbi(clk, rst);
  test t1(tbi);
  mailbox mbx;
  monitor mtr;
  
  button_counter inst_1(clk, rst, tbi.btn, tbi.button_counter);
  
  
  always #12 clk = ~clk;
  
  initial begin
    
    rst = 1;
    
    #21 
    rst = 0;
    
  end
  
  initial begin
    
    mtr = new(mbx);
    mtr.mif = tbi;
    #1 $display("%0d",tbi.button_counter);
    mtr.run();
    
  end
  
  initial begin
   $dumpfile("dump.vcd"); 
    $dumpvars;
    
  end
  
endmodule