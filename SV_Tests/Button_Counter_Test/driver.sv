class driver;
  
  virtual bct_tb vif;
  
  transaction trans;
  
  mailbox mbx;
  
  int transaction_count;
  
  function new(virtual bct_tb vif, mailbox mbx);
    
    this.vif = vif;
    this.mbx = mbx;
    
  endfunction
  
  task reset();
    
    wait(vif.rst);
    
    vif.btn <= 0;
    
    wait(!vif.rst);
    
    $display("Reset Completed");
    
  endtask
  
  task main();
    
    forever begin
      
      trans = new();
      mbx.get(trans);
      
      @(posedge vif.clk);
      vif.btn <= 0;
      #8
      vif.btn <= 1;
      
      trans.button_counter <= vif.button_counter;
      @(posedge vif.clk);
      
      $display("Driver Completed");
      transaction_count++;
      
      end
  endtask
endclass