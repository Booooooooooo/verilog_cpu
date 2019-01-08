`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/08 19:08:19
// Design Name: 
// Module Name: test_for_Imem
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


module test_for_Imem(
    output [15:0]IR
    );
    
    reg clk;
    reg rst;
    reg en;
    reg [15:0] Addr;
    
    Imem imem(
                .clk(clk),
                .rst(rst),
                .en(en),
                .Addr(Addr),
                .IR(IR));
    
    always#(100) clk = ~clk;
    initial
    begin
    clk = 0;
    rst = 1;
    en = 1;
    Addr = 16'b0000000000000100;
    #500;
    Addr = 16'b0000000000000001;
    end
    
endmodule
