`include "interface.sv"
`include "program_run.sv"


module shift_register_TB();
  
  bit clk, rst;
  
  bct_tb tbi(clk, rst);
  test t1(tbi);
  mailbox mbx;
  monitor mtr;
  
  shift_register inst_1(clk, rst, tbi.button_counter, concatenated);
  
  
  always #20 clk = ~clk;
  
  initial begin
    
    rst = 1;
    
    #21 
    rst = 0;
    
  end
  
  initial begin
    
    mtr = new(mbx);
    mtr.mif = tbi;
    #1 $display("%0d",tbi.concatenated);
    mtr.run();
    
  end
  
  initial begin
   $dumpfile("dump.vcd"); 
    $dumpvars;
    
  end
  
endmodule