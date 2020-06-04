//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Times Table
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex7 - Times Table
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module times_table_tester();

	parameter CLK_PERIOD = 10;
	reg clk, enable;
	reg [2:0] a, b;
	wire [4:0] result;
	
	// clock
    initial begin
    clk = 0;
    forever
        #(CLK_PERIOD/2) clk = ~clk;
    end
	
	initial begin
		enable = 1;
		a = 3'b001;
		b = 3'b111;
	end
	
	times_tables mytimestables(.clk(clk), .a(a), .b(b), .enable(enable), .result(result));
	
endmodule
