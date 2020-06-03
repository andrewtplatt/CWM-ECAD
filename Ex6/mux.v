//////////////////////////////////////////////////////////////////////////////////
// Exercise #2 
// Student Name: Andrew Platt
// Date: 01/06/2020
//
//  Description: In this exercise, you need to design a multiplexer, where the  
//  output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | a
//   1  | b
//
//  inputs:
//           a, b, sel
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module mux(
    //Todo: define inputs here
    a, b, sel, out
    );
    
    //Todo: define registers and wires here
    input [2:0] a, b;
    input sel;
    output [2:0] out;
       
    //Todo: define your logic here
    assign out = (sel) ? b : a;
endmodule
