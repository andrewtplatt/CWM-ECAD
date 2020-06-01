//////////////////////////////////////////////////////////////////////////////////
// Exercise #3 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design an up / down counter, where 
//  if the rst=1, the counter should be set to zero. If enable=0, the value
//  should stay constant. If direction=1, the counter should count up every
//  clock cycle, otherwise it should count down.
//  Wrap-around values are allowed.
//
//  inputs:
//           clk, rst, enable, direction
//
//  outputs:
//           counter_out[7:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module counter(
    //Todo: add ports 
    clk, rst, enable, direction, counter_out
    );
                    
    //Todo: add registers and wires, if needed
    input clk, rst, enable, direction;
    output [7:0] counter_out;
    reg [7:0] r;

    //Todo: add user logic
    assign counter_out = r;
    always @(posedge clk or posedge rst) begin
        if (rst)
            r <= 0;
        else if (enable)
            if (direction)
                r <= r + 1;
            else
                r <= r - 1;
    end
    
endmodule
