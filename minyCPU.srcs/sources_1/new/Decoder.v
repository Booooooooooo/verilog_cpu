`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/06 15:05:51
// Design Name: 
// Module Name: Decoder
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


module Decoder(
    input [5:0] Opcode,//操作码
    output reg [15:0] CU_entry//输出微程序入口地址
    );
    
    initial
    begin
    CU_entry = 16'b0000000000000000;
    end
    
    always @(Opcode)
    begin
        case(Opcode)
        6'b000000:CU_entry <= 16'b0000010000000000;//mov i;
        6'b000001:CU_entry <= 16'b0000010000010000;//lad
        6'b000010:CU_entry <= 16'b0000010000100000;//lad i
        6'b000011:CU_entry <= 16'b0000010000110000;//sto
        6'b000100:CU_entry <= 16'b0000010001000000;//add
        6'b000110:CU_entry <= 16'b0000010001100000;//sub
        6'b001000:CU_entry <= 16'b0000010010000000;//inc
        6'b001010:CU_entry <= 16'b0000010010100000;//dec
        6'b001100:CU_entry <= 16'b0000010011000000;//and
        6'b001110:CU_entry <= 16'b0000010011100000;//or
        6'b010000:CU_entry <= 16'b0000010100000000;//not
        6'b010010:CU_entry <= 16'b0000010100100000;//cmp
        6'b010100:CU_entry <= 16'b0000010101000000;//jeq
        6'b010111:CU_entry <= 16'b0000010101110000;//jne
        6'b011001:CU_entry <= 16'b0000010101110000;//jhi
        6'b011011:CU_entry <= 16'b0000010101110000;//jhs
        6'b011101:CU_entry <= 16'b0000010101110000;//jlo
        6'b011111:CU_entry <= 16'b0000010101110000;//jls
        6'b100001:CU_entry <= 16'b0000010101110000;//jmp
        6'b100011:CU_entry <= 16'b0000010101110000;//hlt
        6'b111110:CU_entry <= 16'b0000000000000000;
        default:CU_entry <= 16'b0000000000000000;
        endcase
    end
endmodule
