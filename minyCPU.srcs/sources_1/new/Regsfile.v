`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/05 15:31:23
// Design Name: 
// Module Name: Regsfile
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


module Regsfile(
    input clk,
    input rst,
    input [15:0] DR_in,
    input DR_en,
    input R0_en,
    input R1_en,
    input R2_en,
    input R3_en,
    input R4_en,
    input R5_en,
    input R6_en,
    input R7_en,
    input [2:0] A_sel,
    input [2:0] B_sel,
    output reg[15:0] A_port,
    output reg[15:0] B_port
    );
    
    reg [15:0] R0;
    reg [15:0] R1;
    reg [15:0] R2;
    reg [15:0] R3;
    reg [15:0] R4;
    reg [15:0] R5;
    reg [15:0] R6;
    reg [15:0] R7;
    reg [15:0] DR;
   
    initial
    begin
    A_port = 16'b0000000000000000;
    B_port = 16'b0000000000000000;
    R0 = 16'b0000000000000000;
    R1 = 16'b0000000000000000;
    R2 = 16'b0000000000000000;
    R3 = 16'b0000000000000000;
    R4 = 16'b0000000000000000;
    R5 = 16'b0000000000000000;
    R6 = 16'b0000000000000000;
    R7 = 16'b0000000000000000;
    DR = 16'b0000000000000000;
    end

    always @(A_sel)
    begin
        if(A_sel == 3'b000) A_port = R0;
        if(A_sel == 3'b001) A_port = R1;
        if(A_sel == 3'b010) A_port = R2;
        if(A_sel == 3'b011) A_port = R3;
        if(A_sel == 3'b100) A_port = R4;
        if(A_sel == 3'b101) A_port = R5;
        if(A_sel == 3'b110) A_port = R6;
        if(A_sel == 3'b111) A_port = R7;
    end
//    assign A_port = (A_sel == 3'b000)?R0:16'b0000000000000000;
//    assign A_port = (A_sel == 3'b001)?R1:16'b0000000000000000;
//    assign A_port = (A_sel == 3'b010)?R2:16'b0000000000000000;
//    assign A_port = (A_sel == 3'b011)?R3:16'b0000000000000000;
//    assign A_port = (A_sel == 3'b100)?R4:16'b0000000000000000;
//    assign A_port = (A_sel == 3'b101)?R5:16'b0000000000000000;
//    assign A_port = (A_sel == 3'b110)?R6:16'b0000000000000000;
//    assign A_port = (A_sel == 3'b111)?R7:16'b0000000000000000;
    
    always @(B_sel)
    begin
        if(B_sel == 3'b000) B_port = R0;
        if(B_sel == 3'b001) B_port = R1;
        if(B_sel == 3'b010) B_port = R2;
        if(B_sel == 3'b011) B_port = R3;
        if(B_sel == 3'b100) B_port = R4;
        if(B_sel == 3'b101) B_port = R5;
        if(B_sel == 3'b110) B_port = R6;
        if(B_sel == 3'b111) B_port = R7;
    end
//    assign B_port = (B_sel == 3'b000)?R0:16'b0000000000000000;
//    assign B_port = (B_sel == 3'b001)?R1:16'b0000000000000000;
//    assign B_port = (B_sel == 3'b010)?R2:16'b0000000000000000;
//    assign B_port = (B_sel == 3'b011)?R3:16'b0000000000000000;
//    assign B_port = (B_sel == 3'b100)?R4:16'b0000000000000000;
//    assign B_port = (B_sel == 3'b101)?R5:16'b0000000000000000;
//    assign B_port = (B_sel == 3'b110)?R6:16'b0000000000000000;
//    assign B_port = (B_sel == 3'b111)?R7:16'b0000000000000000;
    
    always @(posedge clk)
    begin
        if(rst == 1'b0)
            begin
            R0 = 16'b0000000000000000;
            R1 = 16'b0000000000000000;
            R2 = 16'b0000000000000000;
            R3 = 16'b0000000000000000;
            R4 = 16'b0000000000000000;
            R5 = 16'b0000000000000000;
            R6 = 16'b0000000000000000;
            R7 = 16'b0000000000000000;
            end
        else
            begin
                if(R0_en == 1'b1) R0 = DR;
                else if(R1_en == 1'b1) R1 = DR;
                else if(R2_en == 1'b1) R2 = DR;
                else if(R3_en == 1'b1) R3 = DR;
                else if(R4_en == 1'b1) R4 = DR;
                else if(R5_en == 1'b1) R5 = DR;
                else if(R6_en == 1'b1) R6 = DR;
                else if(R7_en == 1'b1) R7 = DR;
            end
    end
endmodule
