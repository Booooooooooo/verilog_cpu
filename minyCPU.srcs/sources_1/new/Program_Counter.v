`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/06 14:13:23
// Design Name: 
// Module Name: Program_Counter
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


module Program_Counter(
    input clk,
    input rst,
    input en,
    input [1:0] PC_sel,//确定计数器工作方式，11跳转，10branch作为偏移量，00或01pc+1
    input [15:0] PC_in,//绝对地址
    input [15:0] PC_branch,//地址偏移量
    output reg [15:0] PC_out
    );
    
//    reg [15:0] PC;
    
//    always @(PC)
//    begin
//        PC_out = PC;
//    end
    initial
    begin
        PC_out = 16'b0000000000000000;
    end
    
    always @ (posedge clk)
    begin
        if(rst == 0)PC_out <= 16'b0000000000000000;
        else
        begin
             //PC_out <= PC_out + 1;
            if(en == 1)
            begin
                if(PC_sel == 2'b11)PC_out <= PC_in;
                else if(PC_sel == 2'b10)PC_out <= PC_out + PC_branch;
                else PC_out <= PC_out + 1;
            end
        end
    end
            
endmodule
