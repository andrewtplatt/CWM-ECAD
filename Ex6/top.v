//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 
// Student Name: Andrew Platt
// Date: 03/06/2020
//
//
//  Description: In this exercise, you need to design a multiplexer between a dice and traffic 
//  lights, where the output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | dice
//   1  | traffic lights
//
//  inputs:
//           rst, clk, button,sel
//
//  outputs:
//           result[2:0]
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module dice_traffic_mux(rst, clk, button, sel, result);

	input rst, clk, button, sel;
	output [2:0] result;
	wire [2:0] diceout, trafficout;
	wire red, amber, green;
	
	assign trafficout = {red, amber, green};
	

	dicethrow my_dice(.rst(rst), .clk(clk), .button(button), .throw(diceout));
	traffic my_traffic(.clk(clk), .red(red), .amber(amber), .green(green));
	mux my_mux(.a(diceout), .b(trafficout), .sel(sel), .out(result));

	//mux my_mux1(.a(diceout[1]), .b(trafficout[1]), .sel(sel), .out(result[1]));
	//mux my_mux0(.a(diceout[0]), .b(trafficout[0]), .sel(sel), .out(result[0]));
	
	
endmodule	
	
	
	
	
	
	
	

