//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name: Andrew Platt
// Date: 01/06/2020
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
    parameter CLK_PERIOD = 10;

//Todo: Regitsers and wires
    reg clk, rst, enable, direction, err;
    wire [7:0] counter_out;

//Todo: Clock generation
    initial begin
        clk = 0;
        forever
            #(CLK_PERIOD/2) clk = ~clk;
    end

//Todo: User logic
    initial begin
        rst <= 1;
        enable <= 0;
        direction <= 1;
        err <= 0;
         #CLK_PERIOD
         rst <= 0;
         #CLK_PERIOD
         enable <= 1;
         #(2*CLK_PERIOD)
         if (counter_out != 2) begin
         	$display("***TEST FAILED! expected out=2, actual out=%d ***", counter_out);
         	err <= 1;
         end
         enable <= 0;
         #(2*CLK_PERIOD)
         if (counter_out != 2) begin
         	$display("***TEST FAILED! expected out=2, actual out=%d ***", counter_out);
         	err <= 1;
         end
         direction <= 0;
         enable <= 1;
         #(2*CLK_PERIOD)
         if (counter_out != 0) begin
         	$display("***TEST FAILED! expected out=0, actual out=%d ***", counter_out);
         	err <= 1;
         end
         direction <= 1;
         #(4*CLK_PERIOD)
         if (counter_out != 4) begin
         	$display("***TEST FAILED! expected out=0, actual out=%d ***", counter_out);
         	err <= 1;
         end
         rst <= 1;
         #(3*CLK_PERIOD)
         if (counter_out != 0) begin
         	$display("***TEST FAILED! expected out=0, actual out=%d ***", counter_out);
         	err <= 1;
         end
         enable <= 0;
    end
    
//Todo: Finish test, check for success
    initial begin
    	#(17*CLK_PERIOD)
    	if (err)
         	$display("***TEST FAILED! expected final out=0, actual out=%d ***", counter_out);
        else 
         	$display("***TEST PASSED! expected out=0, actual out=%d ***", counter_out);
     end
//Todo: Instantiate counter module
    counter test_counter(clk, rst, enable, direction, counter_out);
    
endmodule 
