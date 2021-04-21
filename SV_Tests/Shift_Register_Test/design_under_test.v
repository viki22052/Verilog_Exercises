module shift_register
    (
        // ----------------------------------------------------------------
        // Inputs and output
        input                           clk             ,   // Clock
        input                           rst             ,   // Reset 
        input       [8      -1:0]       button_counter  ,      
                                                               
        output     [32      -1:0]       concatenated        // Concatenated  
                                                            // output                                                         
    );

    // -------------------------------------------------------------------
    // Create instance of button_counter module
    /*button_counter    btn_ctr
    (   
            .clk                (clk)  		        ,	  
            .rst                (rst)               ,
            .button_counter     (button_counter)    
    );	 
     */                           
    // --------------------------------------------------------------------
    // Registers
    reg         [8      -1:0]       button_counter_1                ;
    reg         [8      -1:0]       button_counter_2                ;
    reg         [8      -1:0]       button_counter_3                ;
    reg         [8      -1:0]       button_counter_4                ;

    reg         [2      -1:0]       button_counter_number = 2'b 00  ;

    reg        [32      -1:0]       concatenated_output             ;
    reg                             valid_fifo_reg                  ;

    // --------------------------------------------------------------------
    // Assigment 
    assign      concatenated    =   concatenated_output     ;


     		  
    // --------------------------------------------------------------------
    // Procedural block         Procedural block         Procedural block 
    // --------------------------------------------------------------------


        always  @   (posedge clk)

            if (rst == 1) begin
                button_counter_number   =   0   ;
                concatenated_output     =   0   ;
            end
            else 
                case (button_counter_number)

                    2'b00: begin
                        button_counter_number  <= button_counter_number + 1;
                        button_counter_1       <= button_counter           ;        
                    end
               
                    2'b01: begin
                        button_counter_number  <= button_counter_number + 1;
                        button_counter_2       <= button_counter           ;                          
                    end
 
                    2'b10: begin
                        button_counter_number  <= button_counter_number + 1;
                        button_counter_3       <= button_counter           ;                          
                    end

                    2'b11:begin
                        button_counter_number  <= button_counter_number + 1;
                        button_counter_4       <= button_counter           ;
                      #10;
                        concatenated_output    =   {
                                                        button_counter_1,
                                                        button_counter_2,
                                                        button_counter_3,
                                                        button_counter_4
                                                    };
                    end

                endcase

endmodule