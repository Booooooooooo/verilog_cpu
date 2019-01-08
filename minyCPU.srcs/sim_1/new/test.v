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
    wire M0;
    wire M1;
    wire M2;
    wire M3;
    wire M4;
    wire M5;
    
    tinycpu cpu(
                .clk(clk),
                .rst(rst),
                .PC_out(PCout),
                .Micro_ins(Microins),
                .M0(M0),
                .M1(M1),
                .M2(M2),
                .M3(M3),
                .M4(M4),
                .M5(M5)
                );
    always#(100) clk = ~clk;
    initial
    begin
        clk = 0;
        rst = 1;
    end        
endmodule
