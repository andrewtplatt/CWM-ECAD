//////////////////////////////////////////////////////////////////////////////////
// Exercise #7
// Student Name: Andrew Platt
// Date: 04/06/2020
//
//  Description: In this exercise, you need to implement a times table of 0..7x0..7
//  using a memory.
//
//  inputs:
//           clk, a[2:0], b[2:0], read
//
//  outputs:
//           result[4:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module times_tables(
	input clk, enable,
	input [2:0] a, b,
	output [4:0] result);

	wire [5:0] ab;
	
	assign ab = {a, b};
	
	mybram lookup_table (
  .clka(clk),     // input wire clka
  .ena(enable),   // input wire ena
  .wea(0),      // input wire [0 : 0] wea
  .addra(ab),     // input wire [5 : 0] addra
  .dina(result),    // input wire [5 : 0] dina
  .douta(result)  // output wire [4 : 0] douta
);
	
	//mybram lookuptable(ab, result);
	
endmodule







