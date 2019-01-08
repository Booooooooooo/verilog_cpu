`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/06 15:54:35
// Design Name: 
// Module Name: psw
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


module psw(
    input clk,
    input rst,
    input CF_en,
    input ZF_en,
    input CF_in,
    input ZF_in,
    input [4:0] Opcode,
    output reg jmp
    );
    
    reg ZF;
    reg CF;
    reg EQ;
    reg NE;
    reg HI;
    reg HS;
    reg LO;
    reg LS;
    
    initial
    begin
    jmp = 0;
    ZF = 0;
    CF = 0;
    EQ = 0;
    NE = 0;
    HI = 0;
    HS = 0;
    LO = 0;
    LS = 0;
    end
    
    always @(ZF, CF)
    begin
        if(ZF == 1) EQ = 1;
        else EQ = 0;
        NE = ~EQ;
        if(ZF == 0 && CF == 0) HI = 1;
        else HI = 0;
        if(CF == 0)HS = 1;
        else HS = 0;
        if(CF == 1)LO = 1;
        else LO = 0;
        if(ZF != CF)LS = 1;
        else LS = 0;
    end
//    assign EQ = (ZF == 1)?1:0;
//    assign NE = ~EQ;
//    assign HI = (ZF == 0 && CF == 0)?1:0;
//    assign HS = (CF == 0)?1:0;
//    assign LO = (CF == 1)?1:0;
//    assign LS = (ZF != CF)?1:0;
   
    //-- 跳转判定
    always @(ZF, CF ,Opcode, clk, EQ)
    begin
    if (Opcode == 5'b01011 && EQ == 1) jmp = 1;
    else if (Opcode == 5'b01100 && NE == 1 ) jmp = 1;
    else if (Opcode == 5'b01101 && HI == 1) jmp = 1;
    else if (Opcode == 5'b01110 && HS == 1) jmp = 1;
    else if (Opcode == 5'b01111 && LO == 1) jmp = 1;
    else if (Opcode == 5'b10000 && LS == 1) jmp = 1;
    else if (Opcode == 5'b10001)jmp = 1;
    else jmp = 0;
    end
    
    //-- 标志改变控制
    always @(posedge clk)
    begin
        if (rst == 0) 
        begin
            ZF = 0;
            CF = 0;
        end
        else
        begin
            if (CF_en == 1) CF = CF_in;
            if (ZF_en == 1) ZF = ZF_in;
        end
    end
endmodule
