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
    wire [15:0]Aout;
    wire [15:0]Bout;
    wire [15:0]DBUSout;
    wire [15:0]PCout;
    wire [15:0]IRout;
    tinycpu cpu(
                .clk(clk),
                .rst(rst),
                .DBUSout(DBUSout),
                .Aout(Aout),
                .Bout(Bout),
                .PCout(PCout),
                .IRout(IRout)
                );
    always#(100) clk = ~clk;
    initial
    begin
        clk = 0;
        rst = 1;
    end        
endmodule
