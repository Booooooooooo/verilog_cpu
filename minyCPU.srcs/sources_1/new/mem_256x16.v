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
    input [15:0] Dio,
    output reg [15:0]M0,
    output reg [15:0]M1,
    output reg [15:0]M2,
    output reg [15:0]M3,
    output reg [15:0]M4,
    output reg [15:0]M5
    );
    
    //typedef ram_type reg[15:0][0:255];
    //ram_type RAM;
    reg[15:0] RAM [255:0];
    assign Dio = RAM[Address];

    initial
    begin
        M0 = 16'b0000000000000000;
        M1 = 16'b0000000000000000;
        M2 = 16'b0000000000000000;
        M3 = 16'b0000000000000000;
        M4 = 16'b0000000000000000;
        M5 = 16'b0000000000000000;
    end
    
    always @ (posedge clk)
    begin
        if(cs == 1'b1)
        begin
            if (we == 1'b1 && Outenab == 1'b0) RAM[Address] = Dio;
            else if(Outenab == 1'b1)
            begin
                //Dio = RAM[Address];
                M0 = RAM[0];
                M1 = RAM[1];
                M2 = RAM[2];
                M3 = RAM[3];
                M4 = RAM[4];
                M5 = RAM[5];
             end
        end
    end
                     
endmodule
