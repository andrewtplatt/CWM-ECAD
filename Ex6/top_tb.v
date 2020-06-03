//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
// Student Name: Andrew Platt
// Date: 03/06/2020
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module mux_tester();

	parameter CLK_PERIOD = 10;
	reg clk, rst, button, sel, err;
	reg [2:0] count;
	wire [2:0] result;
	
	// clock
    initial begin
    clk = 0;
    forever
        #(CLK_PERIOD/2) clk = ~clk;
    end
    
    initial begin
    	rst = 0;
    	sel = 0;
    	button = 1;
    	count = 1;
		err = 0;
		forever begin
			rst = 1;
			#CLK_PERIOD
    	    rst = 0;
    	    // commented out in case this was the problem... 
    	    if (~sel) begin
    			button <= 1;
        		#(count*CLK_PERIOD)
        		button = 0;
        		#(CLK_PERIOD)
        		// the problem I was having lies somewhere in here...
        		if (result != count) begin
        			$display("***TEST FAILED! expected throw=%d, actual throw=%d ***", count, result);
        			err = 1;
        		end
        		count = count + 1;
        		if (count == 7)
        			count = 1;
        	end
    	end
    end

	dice_traffic_mux my_dice_traffic_mux(rst, clk, button, sel, result);
	

endmodule
