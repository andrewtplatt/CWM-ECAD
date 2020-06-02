//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Traffic Lights
// Student Name: Andrew Platt
// Date: 02/06/2020
//
// Description: A testbench module to test Ex5 - Traffic Lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module traffic_tester();

	parameter CLK_PERIOD = 10;
	reg clk, err;
	wire red, amber, green;
	wire [2:0] curr_state;		// A convenience variable
	
	// clock
    initial begin
    clk = 0;
    forever
        #(CLK_PERIOD/2) clk = ~clk;
    end
    
    // Testing
    assign curr_state = {red, amber, green};
    initial begin
    	err = 0;
    	forever begin
    		#(CLK_PERIOD)
			if (curr_state != 3'b100)
			begin
        		$display("***TEST FAILED! expected state=100, actual state=%d ***", curr_state);
        		err = 1;
        	end
        	#(CLK_PERIOD)
			if (curr_state != 3'b110)
			begin
        		$display("***TEST FAILED! expected state=110, actual state=%d ***", curr_state);
        		err = 1;
        	end
        	#(CLK_PERIOD)
			if (curr_state != 3'b001)
			begin
        		$display("***TEST FAILED! expected state=001, actual state=%d ***", curr_state);
        		err = 1;
        	end
        	#(CLK_PERIOD)
			if (curr_state != 3'b010)
			begin
        		$display("***TEST FAILED! expected state=010, actual state=%d ***", curr_state);
        		err = 1;
        	end
    	end
    end
    
    // Check for success or failure
    initial begin
    	#(25*CLK_PERIOD)
    	if (err)
    		$display("***TEST FAILED!***");
    	else
    		$display("***TEST PASSED!***");
    end
    
    // Instantiate module
    traffic mytraffic(clk, red, amber, green);
    
endmodule
    
    
    
    
    
    
    
    
