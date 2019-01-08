`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/07 20:26:22
// Design Name: 
// Module Name: test_for_CUmem
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


module test_for_CUmem(
    output [31:0]Microins,
    output [15:0]Nextaddr);
    
    reg [15:0] mpc;
    
    
    CUmem mem(
                .MPC_out(mpc),
                .Micro_ins(Microins),
                .Next_addr(Nextaddr));
                
    
    initial
    begin
    mpc = 16'b0000000000000000;
    #100;
    mpc = 16'b0000010000000000;
    end
endmodule
