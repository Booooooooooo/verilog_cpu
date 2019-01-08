`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/05 17:34:39
// Design Name: 
// Module Name: mem_256x16
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


module mem_256x16(
    input clk,
    input cs,
    input we,
    input Outenab,
    input [7:0] Address,
    inout [15:0] Dio
    );
    
    //typedef ram_type reg[15:0][0:255];
    //ram_type RAM;
    reg[15:0] RAM [255:0];
    assign Dio = RAM[Address];
    
//    always@(Outenab or Address)
//    begin
//        if(Outenab == 1) assign Dio = RAM[Address];
//    end
    
    always @ (posedge clk)
    begin
        if(cs == 1'b1)
        begin
            if (we == 1'b1 && Outenab == 1'b0) RAM[Address] = Dio;
        end
    end
                     
endmodule
