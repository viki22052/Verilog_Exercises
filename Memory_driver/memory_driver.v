module memory_driver(bin, clk, res, mem_full);

	input bin, clk, res;
	output mem_full;
	wire validout, count_vout, stop, write_tr;
	wire [7:0] count_dataout;
	wire [31:0] shift_dataout, mem_dataout;
	wire [5:0] addr;
	
	valid_in inst_1(bin, clk, res, validout);
	counter inst_2(validout, clk, res, stop, count_dataout, count_vout);
	shift_reg inst_3(clk, res, count_dataout, count_vout, shift_dataout);
	Memory_dr inst_4(shift_dataout, clk, stop, mem_full, mem_dataout, write_tr, res, addr);
	end_mem inst_5(clk, res, mem_dataout, write_tr, addr);
	
endmodule
	
	