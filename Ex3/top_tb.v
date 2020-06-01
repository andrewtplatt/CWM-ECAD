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
    reg clk, rst, enable, direction;
    wire [7:0] counter_out;

//Todo: Clock generation
    initial begin
        clk = 0;
        forever
            #(CLK_PERIOD/2) clk = ~clk;
    end

//Todo: User logic
    initial begin
        rst = 1;
        enable = 0;
        direction = 1;
        forever begin
         #CLK_PERIOD
         rst = ~rst;
         #CLK_PERIOD
         enable = 1;
         #CLK_PERIOD
         direction = 0;
         #CLK_PERIOD
         direction = 1;
         #CLK_PERIOD
         enable = 0;
       end
    end
    
//Todo: Finish test, check for success
    
//Todo: Instantiate counter module
    counter test_counter(clk, rst, enable, direction, counter_out);
    
endmodule 
