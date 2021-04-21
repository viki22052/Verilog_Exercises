class monitor;
  
  virtual bct_tb mif;
  
  mailbox mbx;
  
  transaction trans;
  
  function new(mailbox mbx);
    
    this.mbx = mbx;
    
    
  endfunction
  
  task run();
    
    trans = new();
    mbx = new();
    trans.button_counter = mif.button_counter;
    trans.concatenated = mif.concatenated;
    $display("%0d", trans.concatenated);
    mbx.put(trans);
   
  endtask
  
endclass