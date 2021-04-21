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
    
    vif.button_counter <= 0;
    
    wait(!vif.rst);
    
    $display("Reset Completed");
    
  endtask
  
  task main();
    
    forever begin
      
      trans = new();
      mbx.get(trans);
      
      @(posedge vif.clk);
      vif.button_counter <= 8'd25;
      #55
      vif.button_counter <= 8'd32;
      #55
      vif.button_counter <= 8'd45;
      #55
      vif.button_counter <= 8'd243;
      #55
      vif.button_counter <= 8'd123;
      #55
      vif.button_counter <= 8'd132;
      
      trans.concatenated  <= vif.concatenated;
      @(posedge vif.clk);
      
      $display("Driver Completed");
      transaction_count++;
      
      end
  endtask
endclass