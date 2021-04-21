`include "environment.sv"

program test(bct_tb tif);
  
  environment env;
  
  initial begin 
    
    env = new(tif);
    env.gen.count = 4;
    env.run();
    
  end
  
endprogram