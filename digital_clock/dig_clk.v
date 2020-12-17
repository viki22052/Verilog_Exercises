`timescale 1ns/100ps

module dig_clk(clk, min_u_t, hour_u_t);
  input clk;
  output [7:0] min_u_t, hour_u_t;
  reg [7:0] min_u_t, hour_u_t, seconds;
  
  initial begin
  	min_u_t = 0;
  	hour_u_t = 0;
	seconds = 0;
  end
  
  always @(clk) begin
  
  seconds = seconds + 1;
    
    if(seconds == 8'd60)
	 begin
      min_u_t = min_u_t + 1;
       if(min_u_t == 8'd60)
		 begin
        	hour_u_t = hour_u_t + 1;
			if(hour_u_t == 8'd24)
			begin
			seconds = 0;
			min_u_t = 0;
			hour_u_t = 0;
			end
			seconds = 0;
			min_u_t = 0;
		end
			seconds = 0;
     end
  end
endmodule
