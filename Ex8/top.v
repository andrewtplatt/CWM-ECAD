//////////////////////////////////////////////////////////////////////////////////
// Exercise #8
// Student Name: Andrew Platt
// Date: 04/06/2020
//
//  Description: In this exercise, you need to implement a times table of 0..7x0..7
//  using a memory and AXI-4-lite interface.
//
//  inputs:
//           clk, rst, a[2:0], b[2:0], read
//
//  outputs:
//           result[5:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module times_tables(
	input clk, enable, rst,
	input [2:0] a, b,
	output [4:0] result);

	wire [5:0] ab;
	wire [31:0] addr, value;

	assign ab = {a, b};
	assign addr = {26'b00000000000000000000000000, ab};
	assign result = value[4:0];

	mybram lookup_table (
  .rsta_busy(0),          // output wire rsta_busy
  .rstb_busy(0),          // output wire rstb_busy
  .s_aclk(clk),                // input wire s_aclk
  .s_aresetn(rst),          // input wire s_aresetn
  .s_axi_awaddr(addr),    // input wire [31 : 0] s_axi_awaddr
  .s_axi_awvalid(1),  // input wire s_axi_awvalid
  .s_axi_awready(0),  // output wire s_axi_awready
  .s_axi_wdata(addr),      // input wire [31 : 0] s_axi_wdata
  .s_axi_wstrb(4'b0000),      // input wire [3 : 0] s_axi_wstrb
  .s_axi_wvalid(0),    // input wire s_axi_wvalid
  .s_axi_wready(0),    // output wire s_axi_wready
  .s_axi_bresp(OKAY),      // output wire [1 : 0] s_axi_bresp
  .s_axi_bvalid(0),    // output wire s_axi_bvalid
  .s_axi_bready(0),    // input wire s_axi_bready
  .s_axi_araddr(addr),    // input wire [31 : 0] s_axi_araddr
  .s_axi_arvalid(1),  // input wire s_axi_arvalid
  .s_axi_arready(1),  // output wire s_axi_arready
  .s_axi_rdata(value),      // output wire [31 : 0] s_axi_rdata
  .s_axi_rresp(OKAY),      // output wire [1 : 0] s_axi_rresp
  .s_axi_rvalid(1),    // output wire s_axi_rvalid
  .s_axi_rready(1)    // input wire s_axi_rready
);
		
endmodule
		
		
		
		

