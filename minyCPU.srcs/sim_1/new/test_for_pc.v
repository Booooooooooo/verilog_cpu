`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/07 22:46:19
// Design Name: 
// Module Name: test_for_pc
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


module test_for_pc(output [15:0]pc_out);
    reg clk;
    reg rst;
    reg en;
    reg [1:0] PC_sel;//确定计数器工作方式，11跳转，10branch作为偏移量，00或01pc+1
    reg [15:0] PC_in;//绝对地址
    reg [15:0] PC_branch;//地址偏移量
    Program_Counter pc(
                        .clk(clk),
                        .rst(rst),
                        .en(en),
                        .PC_sel(PC_sel),
                        .PC_in(PC_in),
                        .PC_branch(PC_branch),
                        .PC_out(pc_out));
    always#(100) clk = ~clk;
    initial
    begin
        clk = 0;
        rst = 1;
        en = 1;
        PC_sel = 2'b11;
        PC_in = 16'b0000000000100000;
        PC_branch = 16'b0000000000000000;
        #500;
        PC_sel = 2'b10;
        PC_branch = 16'b0000000000000010;
        #500;
        PC_sel = 2'b01;
    end        
endmodule
