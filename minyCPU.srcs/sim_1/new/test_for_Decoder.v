`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/08 19:27:02
// Design Name: 
// Module Name: test_for_Decoder
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


module test_for_Decoder(
        output [15:0]CU_entry
    );
    
    reg [5:0] Opcode;
    Decoder decoder(
                    .Opcode(Opcode),
                    .CU_entry(CU_entry));
    //always#(100) clk = ~clk;
    initial
    begin
    Opcode = 6'b000001;
    #300;
    Opcode = 6'b000011;
    end
    
endmodule
