//////////////////////////////////////////////////////////////////////////////////
// Exercise #9 
// Student Name: Andrew Platt
// Date: 05/06/2020
//
//  Description: In this exercise, you need to design a module that lights leds
//  at different frequencies
//
//  inputs:
//           rst_n, clk_n, clk_p, button
//
//  outputs:
//           led_0, led_1, led_2
//////////////////////////////////////////////////////////////////////////////////


module top(
    input clk_p,
    input clk_n,
     //Todo: add all other ports besides clk_n and clk_p 
    input rst_n, button,
	output led_0, led_1, led_2
   );
    

   /* clock infrastructure, do not modify */
    wire clk_ibufds;

    IBUFDS IBUFDS_sysclk (
	.I(clk_p),
	.IB(clk_n),
	.O(clk_ibufds)
);

     wire clk; //use this signal as a clock for your design
        
     BUFG bufg_clk (
	.I  (clk_ibufds),
	.O  (clk)
      );
	

	reg [27:0] counter_0;
	reg [27:0] counter_1;
	reg [27:0] counter_2;
	reg [2:0] leds;
	wire change_0, change_1, change_2;
	
	assign led_0 = leds[0];
	assign led_1 = leds[1];
	assign led_2 = leds[2];
	
	assign change_0 = (counter_0 == 28'h1312D00) && (led_0 | ~led_0); // Every 20 mil cycles - 50Hz
	assign change_1 = (counter_1 == 28'h1C9C380) && (led_1 | ~led_1); // Every 30 mil cycles - 33.3Hz
	assign change_2 = (counter_2 == 28'h2625A00) && (led_2 | ~led_2); // Every 40 mil cycles - 25Hz
	
//Add logic here
	always @(posedge clk) begin
		if (rst_n | button)
			leds = 3'b000;
		else begin
			leds[0] = (change_0) ? ~leds[0] :
					  (~change_0)? leds[0]:
					  1'b0;	
			leds[1] = (change_1) ? ~leds[1] :
					  (~change_1)? leds[1]:
					  1'b0;	
			leds[2] = (change_2) ? ~leds[2] :
					  (~change_2)? leds[2]:
					  1'b0;	
			// Increment counters
			counter_0 = (change_0) ? 28'h0: counter_0 + 1;
			counter_1 = (change_1) ? 28'h0: counter_1 + 1;
			counter_2 = (change_2) ? 28'h0: counter_2 + 1;
		end
	end
endmodule
