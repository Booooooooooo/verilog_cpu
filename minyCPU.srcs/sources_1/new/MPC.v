`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/06 15:23:09
// Design Name: 
// Module Name: MPC
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


module MPC(
    input clk,
    input rst,
    input en,
    input [1:0] MPC_sel,
    input [15:0] MPC_in,
    input [15:0] Next_addr,
    output reg [15:0] MPC_out
    );
    
//    reg [15:0] MPC;
//    always @(MPC)
//    begin
//        MPC_out = MPC;
//    end

    initial
    begin
    MPC_out = 16'b0000000000000000;
    end
    
    always @(posedge clk)
    begin
        if(rst == 0) MPC_out = 16'b0000000000000000;
        else
        begin
            if(en == 1)
            begin
                if(MPC_sel == 2'b11) MPC_out = MPC_in;
                else if(MPC_sel == 2'b10) MPC_out = Next_addr;
                else MPC_out = 16'b0000000000000000;
            end
        end
    end
endmodule
