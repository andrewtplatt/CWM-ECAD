//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 
// Student Name: Andrew Platt
// Date: 02/06/2020
//
//  Description: In this exercise, you need to implement a UK traffic lights 
//  sequencing system. 
//
//  inputs:
//           clk
//
//  outputs:
//           red, amber, green
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module traffic(clk, red, amber, green);

	input clk;
	output red, amber, green;
	reg [2:0] state;
	
	assign red   = state[2];
	assign amber = state[1];
	assign green = state[0];
	always @(posedge clk) begin
		if ( red & ~amber & ~green)
			state = 3'b110;
		else if ( red &  amber & ~green)
			state = 3'b001;
		else if (~red & ~amber &  green)
			state = 3'b010;
		else
			state = 3'b100;
			
		// The following didn't work - are these not the same?
		//state = ( red & ~amber & ~green) ? 3'b110:
			    //( red &  amber & ~green) ? 3'b001:
			    //(~red & ~amber &  green) ? 3'b010:
			    //3'b100;
	end
			 
endmodule	
	



