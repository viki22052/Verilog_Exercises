`timescale 1ns/100ps

module four_bit_ALU(opd_int_1, opd_int_2, opt_int, out, out_ext);
  
  input [3:0]opd_int_1;
  input [3:0]opd_int_2;
  input [1:0]opt_int;
  output [4:0]out;
  reg [3:0]out;
  output out_ext;
  reg out_ext;
  
  
  always @(opd_int_1 or opt_int or opd_int_2)
    begin
      
      case(opt_int)
        2'b00: begin out = opd_int_1 + opd_int_2;
          if(out - opd_int_1 != opd_int_2) begin
          out_ext = 1'b1;
        end
        else
          out_ext = 1'b0;
        end
        
        2'b01: begin out = opd_int_1 - opd_int_2;
          if(opd_int_2 > opd_int_1) begin
            out_ext = 1'b1;
          end
		else 
          out_ext = 1'b0;
        end
        
        2'b10: begin out = opd_int_1 * opd_int_2;
          if(opd_int_1 != 0 && out / opd_int_1 != opd_int_2) begin
          out_ext = 1'b1;
        end
        else
          out_ext = 1'b0;
        end
        
        2'b11: begin out = opd_int_1 >> opd_int_2;
          out_ext = 1'b0;
        end
		  
        default: out = 4'bxxxx;
      endcase
    end 
endmodule        
      
  
  
  
  

  