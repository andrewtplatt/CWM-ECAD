//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 
// Student Name: Andrew Platt
// Date: 01/06/2020
//
//  Description: In this exercise, you need to design an electronic dice, following
//  the diagram provided in the exercises documentation. The dice rolls as long as
//  a button is pressed, and stops when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           throw [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module dicethrow(clk, rst, button, throw);
	
    // I/O
    input clk, rst, button;
    output reg [2:0] throw; 
    reg [2:0] prev_throw;
	
    //logic
    //thrown = 1'b0;
	always @(posedge clk or posedge rst)
	begin
		// If we are in a valid state go as normal, otherwise go to 001
		if (throw)
			prev_throw = throw;
		else begin
			prev_throw = 3'b000;
			throw = 3'b000;
		end
		if (rst)
			throw = 3'b000;
		else if (throw == 3'b000 || throw == 3'b111)
			throw = 3'b001;
		else if (button)
			begin
			if (throw[2]&throw[1])
				throw = 3'b001;
			else
			    throw = throw + 1;
			end
		else
		    throw = prev_throw;
	end

endmodule

