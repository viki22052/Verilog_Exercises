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
    trans.btn = mif.btn;
    trans.button_counter = mif.button_counter;
    $display("%0d", trans.button_counter);
    mbx.put(trans);
   
  endtask
  
endclass