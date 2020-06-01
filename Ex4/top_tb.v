//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name: Andrew Platt
// Date: 01/06/2020
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );

    parameter CLK_PERIOD = 10;

	reg clk, rst, button;
	wire [2:0] throw;
	
	initial begin
    clk = 0;
    forever
        #(CLK_PERIOD/2) clk = ~clk;
    end
    
    initial begin
    	rst = 1;
    	button = 1;
    	#CLK_PERIOD
    	rst = 0;
    	forever begin
        	#5*CLK_PERIOD
        	rst = 1;
        	#3*CLK_PERIOD
        	button = 0;
    	end
    end
    
    dicethrow testdicethrow(clk, rst, button, throw);
    
    
    
