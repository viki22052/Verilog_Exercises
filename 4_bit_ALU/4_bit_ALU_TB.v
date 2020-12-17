`timescale 1ns/100ps

module four_bit_ALU_TB();
  
  reg [3:0] operand_1, operand_2;
  reg [1:0]operation;
  wire [3:0]out;
  wire out_ext;

  
  four_bit_ALU ALU(operand_1, operand_2, operation, out, out_ext);
  
  initial begin
    $dumpfile("out.vcd");
    $dumpvars(1, four_bit_ALU_TB);
    
    operand_1 = 4'd3;
    operand_2 = 4'd8;
    
    #10
    operation = 2'b00;
    #100
    operation = 2'b01;
    #100
    operation = 2'b10;
    #100
    operation = 2'b11;
    #20
    $finish;
  end
endmodule