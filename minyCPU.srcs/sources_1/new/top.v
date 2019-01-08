`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/10 19:36:11
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input rst,
    input clk,
    output [31:0] M01,
    output [31:0] M23,
    output [31:0] M45
    );
wire[15:0] M0_out;
wire[15:0] M1_out;
wire[15:0] M2_out;
wire[15:0] M3_out;
wire[15:0] M4_out;
wire[15:0] M5_out;
assign M01 = {M0_out, M1_out};
assign M23 = {M2_out, M3_out};
assign M45 = {M4_out, M5_out};

endmodule
