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
	reg clk;
	wire red, amber, green;
	
	// clock
    initial begin
    clk = 0;
    forever
        #(CLK_PERIOD/2) clk = ~clk;
    end
    
    // Instantiate module
    traffic mytraffic(clk, red, amber, green);
    
endmodule
    
    
    
    
    
    
    
    
