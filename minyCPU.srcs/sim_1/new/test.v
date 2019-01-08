`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/07 15:32:00
// Design Name: 
// Module Name: test
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


module test;
    reg clk;
    reg rst;
    wire [15:0]PCout;
    wire [31:0]Microins;
    tinycpu cpu(
                .clk(clk),
                .rst(rst),
                .PC_out(PCout),
                .Micro_ins(Microins)
                );
    always#(100) clk = ~clk;
    initial
    begin
        clk = 0;
        rst = 1;
    end        
endmodule
