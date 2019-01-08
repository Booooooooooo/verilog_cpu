`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/06 15:26:35
// Design Name: 
// Module Name: CUmem
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


module CUmem(
    input [15:0] MPC_out,
    output [31:0] Micro_ins,
    output [15:0] Next_addr
    );
    
    reg[40:0] CU_data;
    assign Micro_ins[31:25] = 7'b0000000;
    assign Micro_ins[24:0] = CU_data[40:16];
    //assign Micro_ins = 7'b0000000 & CU_data[40:16];
    assign Next_addr = CU_data[15:0];
    
    always @(MPC_out)
    begin
        case (MPC_out)
        16'b0000000000000000: CU_data <= 41'b00000000000000000010110000000000000000001;
        16'b0000000000000001: CU_data <= 41'b00000000000000000011100010000000000000000; // MOV
        16'b0000010000000000: CU_data <= 41'b00000100001000000010100000000010000000001;
        16'b0000010000000001: CU_data <= 41'b00000001000000000000100000000000000000000;//    -- MOV(I)
        16'b0000010000010000: CU_data <= 41'b00000000100000000010100000000010000010001;
        16'b0000010000010001: CU_data <= 41'b00000001000000000000100000000000000000000;//    -- LAD
        16'b0000010000100000: CU_data <= 41'b00000100001010000010100000000010000100001;
        16'b0000010000100001: CU_data <= 41'b00000000010001010010100000000010000100010;
        16'b0000010000100010: CU_data <= 41'b00000001000000000000100000000000000000000;//    -- LAD(I)
        16'b0000010000110000: CU_data <= 41'b00000000100010000010100000000010000110001;
        16'b0000010000110001: CU_data <= 41'b00000000010001010010100000000010000110010;
        16'b0000010000110010: CU_data <= 41'b00000001000000000000100000000000000000000;//    -- STO
        16'b0000010001000000: CU_data <= 41'b00000100001010000010100000000010001000001;
        16'b0000010001000001: CU_data <= 41'b11111010000110000010100000000000000000000;//    -- ADD
        16'b0000010001100000: CU_data <= 41'b01001110000100001110100000000010001100001;
        16'b0000010001100001: CU_data <= 41'b00000001000000000000100000000000000000000;//    -- SUB
        16'b0000010010000000: CU_data <= 41'b00110110000100001110100000000010010000001;
        16'b0000010010000001: CU_data <= 41'b00000001000000000000100000000000000000000;//    -- INC
        16'b0000010010100000: CU_data <= 41'b01000010000100000010100000000010010100001;
        16'b0000010010100001: CU_data <= 41'b00000001000000000000100000000000000000000;//    -- DEC
        16'b0000010011000000: CU_data <= 41'b01111010000100000010100000000010011000001;
        16'b0000010011000001: CU_data <= 41'b00000001000000000000100000000000000000000;//    -- AND
        16'b0000010011100000: CU_data <= 41'b11011110000100001110100000000010011100001;
        16'b0000010011100001: CU_data <= 41'b00000001000000000000100000000000000000000;//   -- OR
        16'b0000010100000000: CU_data <= 41'b11110110000100001110100000000010100000001;
        16'b0000010100000001: CU_data <= 41'b00000001000000000000100000000000000000000;//    -- NOT
        16'b0000010100100000: CU_data <= 41'b10000010000100000010100000000010100100001;
        16'b0000010100100001: CU_data <= 41'b00000001000000000000100000000000000000000;//    -- CMP
        16'b0000010101000000: CU_data <= 41'b00110110000000001100100000000000000000000;//    -- J
        16'b0000010101110000: CU_data <= 41'b00000000100000000000101110000000000000000;//    -- HLT
        16'b0000011111100000: CU_data <= 41'b00000000000000000000000000000000000000000;
        default:CU_data <= 41'b00000000000000000000000000000010000000001;
        endcase
     end
endmodule
