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
	reg clk, enable, err;
	reg [2:0] a, b;
	wire [4:0] result, expected_result;
	//wire [5:0] ab
	
	// clock
    initial begin
    clk = 0;
    forever
        #(CLK_PERIOD/2) clk = ~clk;
    end
	
	//assign ab = {a, b};
	assign #(2*CLK_PERIOD) expected_result = (a == 3'b000 || b == 3'b000) ? 0:
							 (a == 3'b001) ? b:
							 (b == 3'b001) ? a:
							 (a == 3'b010) ? b+b:
							 (b == 3'b010) ? a+a:
							 (a == 3'b011) ? b+b+b:
							 (b == 3'b011) ? a+a+a: 
							 (a == 3'b100) ? b+b+b+b:
							 (b == 3'b100) ? a+a+a+a:
							 (a == 3'b101) ? b+b+b+b+b:
							 (b == 3'b101) ? a+a+a+a+a:
							 (a == 3'b110) ? b+b+b+b+b+b:
							 (b == 3'b110) ? a+a+a+a+a+a:
							 (a == 3'b111) ? b+b+b+b+b+b+b:
							 a+a+a+a+a+a+a;

	initial begin
		#(CLK_PERIOD/2)
		err = 0;
		enable = 1;
		a = 3'b000;
		b = 3'b000;
		forever begin
		    #(3*CLK_PERIOD)
			if (result != expected_result) begin
				$display("*** TEST FAILED! Expected result: %d. Result: %d ***", expected_result, result);
				err = 1;
			end
			if (b == 3'b111) begin
				b = 3'b000;
				a = a + 3'b001;
			end
			else
				b = b + 3'b001;
		end
	end
	
	initial begin
	   #(79*CLK_PERIOD)
	   if (err)
	       $display("*** TEST FAILED! ***");
	   else
	       $display("*** TEST PASSED! ***");
	end
	times_tables mytimestables(.clk(clk), .a(a), .b(b), .enable(enable), .result(result));
	
endmodule
