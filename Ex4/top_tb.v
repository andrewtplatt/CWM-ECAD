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

	reg clk, rst, button, err;
	reg [2:0] count;
	wire [2:0] throw;
	wire [2:0] thrown;
	
	initial begin
    clk = 0;
    forever
        #(CLK_PERIOD/2) clk = ~clk;
    end
    
    initial begin
    	rst <= 1;
    	button <= 1;
    	count <= 1;
    	err <= 0;
    	#CLK_PERIOD
    	forever begin
    	    rst <= 0;
    		button <= 1;
        	#(count*CLK_PERIOD)
        	button = 0;
        	#(CLK_PERIOD)
        	rst = 1;
        	#(CLK_PERIOD)
        	if (thrown != count)
        		begin
        			$display("***TEST FAILED! expected throw=%d, actual throw=%d ***", count, thrown);
        			err = 1;
        		end
        	count = count + 1;
        	if (count == 7)
        		count = 1;
    	end
    end
    
    initial begin
    	#(50*CLK_PERIOD)
    	if (err)
    		$display("***TEST FAILED!***");
    	else
    		$display("***TEST PASSED!***");
    end
    dicethrow testdicethrow(clk, rst, button, throw, thrown);
    
endmodule
    
