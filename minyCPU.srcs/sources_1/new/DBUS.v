`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/11 10:28:06
// Design Name: 
// Module Name: DBUS
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


module DBUS(
    input [15:0] ALU_out,
    input [15:0] B_out,
    input [15:0] Dmem_out,
    input [15:0] IR_data,
    input ALU_out_en,
    input B_out_en,
    input Dmem_out_en,
    input IR_data_en,
    input [15:0] DBUS_out
    );
    
    assign DBUS_out = (ALU_out_en == 1)?ALU_out:16'bzzzzzzzzzzzzzzzz;
    assign DBUS_out = (B_out_en == 1)?B_out:16'bzzzzzzzzzzzzzzzz;
    assign DBUS_out = (Dmem_out_en == 1)?Dmem_out:16'bzzzzzzzzzzzzzzzz;
    assign DBUS_out = (IR_data_en == 1)?IR_data_en:16'bzzzzzzzzzzzzzzzz;
//    if(ALU_out_en == 1'b1)assign DBUS_out = ALU_out;
//    else assign DBUS_out = {16{Z}};
//    if(B_out_en == 1'b1)assign DBUS_out = B_out;
//    else assign DBUS_out = {16{Z}};
//    if(Dmem_out_en)assign DBUS_out = Dmem_out;
//    else assign DBUS_out = {16{Z}};
//    if(IR_data_en == 1'b1)assign DUBS_out = IR_data_en;
//    else assign DUBS_out = {16{Z}};
    
endmodule
