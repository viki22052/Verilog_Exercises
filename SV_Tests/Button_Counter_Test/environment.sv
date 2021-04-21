`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"

class environment;
  
  generator gen;
  
  driver drv;
  
  mailbox mbx;
  
  virtual bct_tb eif;
  
  function new(virtual bct_tb eif);
    
    this.eif = eif;
    
    mbx = new();
    gen = new(mbx);
    drv = new(eif, mbx);
    
  endfunction
  
  task res();
    drv.reset;
    
  endtask
  
  task test();
    
    fork
      
      gen.main();
      drv.main();
      
      
    join_any
  endtask
  
  task endtest();
    
    wait(gen.complete.triggered);
    wait(gen.count == drv.transaction_count);
  endtask
  
  task run();
    
    res();
    test();
    endtest();
    
     $finish;
    
  endtask
  
  
endclass
  
  
  