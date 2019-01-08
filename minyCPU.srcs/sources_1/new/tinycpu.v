`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/06 16:37:07
// Design Name: 
// Module Name: tinycpu
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


module tinycpu(
    input rst,
    input clk,
    output [15:0]DBUSout,
    output reg [15:0]PCout,
    //output reg [15:0] PC_out,
    output [15:0]IRout,
    output [15:0]Aout,
    output [15:0]Bout
    //output Condout,
//    output m0_out,
//    output m1_out,
//    output m2_out,
//    output m3_out,
//    output m4_out,
//    output m5_out,
//    output m6_out,
//    output m7_out,
//    output RRO,
//    output RR1,
//    output RR2,
//    output RR3,
//    output RR4,
//    output RR5,
//    output RR6,
//    output RR7
    );
    
    wire Rd_used;
    wire RsA_used;
    wire RsB_used;
    wire Jmp;
    wire PC_en;
    wire [1:0]PC_sel;
    wire Imem_en;
    wire MPC_en;
    wire [1:0] MPC_sel;
    wire Dmem_cs;
    wire Dmem_we;
    wire Dmem_outenab;
    wire AR_en;
    wire ALU_out_en;
    wire B_out_en;
    wire Dmem_out_en;
    wire IR_data_en;
    wire DR_en;
    wire R0_en;
    wire R1_en;
    wire R2_en;
    wire R3_en;
    wire R4_en;
    wire R5_en;
    wire R6_en;
    wire R7_en;
    wire [2:0] A_sel;
    wire [2:0] B_sel;
    wire [3:0] S;
    wire M;
    wire CF;
    wire ZF;
    wire CF_en;
    wire ZF_en;
    wire CF_in;
    wire ZF_in;
    wire [4:0] Opcode;
    wire jmp;
    reg [15:0] PC_in;
    wire [15:0] PC_branch;
    wire [15:0] PC_out;
    wire [15:0] IR;
    wire [15:0] CU_entry;
    reg [7:0] AR;
    reg [7:0] AR_in;
    wire [15:0] Next_addr;
    wire [15:0] MPC_out;
    reg [15:0] IR_data;
    wire [15:0] DBUS_out;
    reg [15:0] Dio;
    wire [15:0] Dmem_in;
    wire [15:0] Dmem_out;
    wire [15:0] A;
    wire [15:0] B;
    wire [15:0] F;
    wire [31:0] Micro_ins;
    
    initial
    begin
        PCout = 0;
        //IR = 0;
    end
    
    assign DBUSout = DBUS_out;
    //assign PCout = PC_out;
    assign MPCout = MPC_out;
    assign IRout = IR;
    assign Aout = A;
    assign Bout = B;
    //assign Condout = 15'b000000000000000 & Cond;
//    assign m0_out = mem_out_s_0[7:0];
//    assign m1_out = mem_out_s_1[7:0];
//    assign m2_out = mem_out_s_2[7:0];
//    assign m3_out = mem_out_s_3[7:0];
//    assign m4_out = mem_out_s_4[7:0];
//    assign m5_out = mem_out_s_5[7:0];
//    assign m6_out = mem_out_s_6[7:0];
//    assign m7_out = mem_out_s_7[7:0];
//    assign RR0 = 16'b0000000000000000 & R0_out_s;
//    assign RR1 = 16'b0000000000000000 & R1_out_s;
//    assign RR2 = 16'b0000000000000000 & R2_out_s;
//    assign RR3 = 16'b0000000000000000 & R3_out_s;
//    assign RR4 = 16'b0000000000000000 & R4_out_s;
//    assign RR5 = 16'b0000000000000000 & R5_out_s;
//    assign RR6 = 16'b0000000000000000 & R6_out_s;
//    assign RR7 = 16'b0000000000000000 & R7_out_s;
    
    Program_Counter PC(
                        .clk(clk),
                        .rst(rst),
                        .en(PC_en),
                        .PC_sel(PC_sel),
                        .PC_in(PC_in),
                        .PC_branch(DBUS_out),
                        .PC_out(PC_out));
    Imem ICache(
                .clk(clk),
                .rst(rst),
                .en(Imem_en),
                .Addr(PC_out),
                .IR(IR));
    Decoder ID(
                .Opcode(IR[15:10]),
                .CU_entry(CU_entry));
    
    MPC Microaddr(
                    .clk(clk),
                    .rst(rst),
                    .en(MPC_en),
                    .MPC_sel(MPC_sel),
                    .MPC_in(CU_entry),
                    .Next_addr(Next_addr),
                    .MPC_out(MPC_out));
    
    CUmem CU(
                .MPC_out(MPC_out),
                .Micro_ins(Micro_ins),
                .Next_addr(Next_addr));
   
   psw P(
            .clk(clk),
            .rst(rst),
            .CF_en(CF_en),
            .ZF_en(ZF_en),
            .CF_in(CF_in),
            .ZF_in(ZF_in),
            .Opcode(Opcode),
            .jmp(jmp));
       
     
    assign Opcode = IR[15:11];
    assign CF_in = CF;
    assign ZF_in = ZF;
    
    mem_256x16 Dmem(
                    .clk(clk),
                    .cs(Dmem_cs),
                    .we(Dmem_we),
                    .Outenab(Dmem_outenab),
                    .Address(AR),
                    .Dio(Dmem_out));
                    
    always @(AR_en, DBUS_out)
    begin
        if(AR_en == 1'b1) AR_in <= DBUS_out[7:0];
    end
    assign Dmem_out = Dio;
    
    always @(Dmem_cs, Dmem_we, Dmem_outenab,Dmem_in)
    begin
        if(Dmem_cs == 1'b1 && Dmem_we == 1'b1 && Dmem_outenab == 1'b0) Dio <= Dmem_in;
    end
    
    assign Dmem_in = DBUS_out;
    
    //assign PCout = PC_out;
    
    
    always @(posedge clk)
    begin
        if(rst == 0) AR <= 8'b00000000;
        else 
        begin
            PCout=PC_out;
            if(AR_en == 1) AR <= AR_in;
        end
    end
    
    
    DBUS Databua(
                    .ALU_out(F),
                    .B_out(B),
                    .Dmem_out(Dmem_out),
                    .IR_data(IR_data),
                    .ALU_out_en(ALU_out_en),
                    .B_out_en(B_out_en),
                    .Dmem_out_en(Dmem_out_en),
                    .IR_data_en(IR_data_en),
                    .DBUS_out(DBUS_out));
               
    always @(clk)
    begin
        if(jmp == 1)
        begin
            IR_data[15:10] <= 6'b000000;
            IR_data[9:0] <= IR[9:0];
//            PC_in <= (jmp == 1)?IR_data:PC_out;
            if(jmp == 1) PC_in <= IR_data;
            else PC_in <= PC_out;
        end
        else 
        begin
            IR_data[15:7] <= 9'b000000000;
            IR_data[6:0] <= IR[6:0];
        end
    end
    
    Regsfile General_Registers(
                                .clk(clk),
                                .rst(rst),
                                .DR_in(DBUS_out),
                                .DR_en(1),
                                .R0_en(R0_en),
                                .R1_en(R1_en),
                                .R2_en(R2_en),
                                .R3_en(R3_en),
                                .R4_en(R4_en),
                                .R5_en(R5_en),
                                .R6_en(R6_en),
                                .R7_en(R7_en),
                                .A_sel(A_sel),
                                .B_sel(B_sel),
                                .A_port(A),
                                .B_port(B));
    
    assign R0_en = (Rd_used == 1'b1 && IR[9:7] == 3'b000)?1:0;
    assign R1_en = (Rd_used == 1'b1 && IR[9:7] == 3'b001)?1:0;
    assign R2_en = (Rd_used == 1'b1 && IR[9:7] == 3'b010)?1:0;
    assign R3_en = (Rd_used == 1'b1 && IR[9:7] == 3'b011)?1:0;
    assign R4_en = (Rd_used == 1'b1 && IR[9:7] == 3'b100)?1:0;
    assign R5_en = (Rd_used == 1'b1 && IR[9:7] == 3'b101)?1:0;
    assign R6_en = (Rd_used == 1'b1 && IR[9:7] == 3'b110)?1:0;
    assign R7_en = (Rd_used == 1'b1 && IR[9:7] == 3'b111)?1:0;
//    if(Rd_used == 1'b1 && IR[9:7] == 3'b000) assign R0_en = 1;
//    else assign R0_en = 0;
//    if(Rd_used == 1'b1 && IR[9:7] == 3'b001) assign R1_en = 1;
//    else assign R1_en = 0;
//    if(Rd_used == 1 && IR[9:7] == 3'b010) assign R2_en = 1;
//    else assign R2_en = 0;
//    if(Rd_used == 1 && IR[9:7] == 3'b011) assign R3_en = 1;
//    else assign R3_en = 0;
//    if(Rd_used == 1 && IR[9:7] == 3'b100) assign R4_en = 1;
//    else assign R4_en = 0;
//    if(Rd_used == 1 && IR[9:7] == 3'b101) assign R5_en = 1;
//    else assign R5_en = 0;
//    if(Rd_used == 1 && IR[9:7] == 3'b110) assign R6_en = 1;
//    else assign R6_en = 0;
//    if(Rd_used == 1 && IR[9:7] == 3'b111) assign R7_en = 1;
//    else assign R7_en = 0;
           
//    always @(IR, RsA_used)
//    begin
//        if(RsA_used == 1'b1)A_sel = IR[9:7];
//        else A_sel = 3'b000;
//    end
    assign A_sel = (RsA_used == 1'b1)?IR[9:7]:3'b000;
    assign B_sel = (RsB_used == 1'b1)?IR[6:4]:3'b000;
//    always @(IR, RsB_used)
//    begin
//        if(RsB_used == 1'b1)B_sel = IR[6:4];
//        else B_sel = 3'b000;
//    end
    
    alu_16bit ALU(
                    .A(A),
                    .B(B),
                    .S(S),
                    .M(M),
                    .C_n(1),
                    .F(F),
                    .ZF(ZF),
                    .CF(CF));
    
    assign M = Micro_ins[24];
    assign S = Micro_ins[23:20];
    assign RsB_used = Micro_ins[19];
    assign RsA_used = Micro_ins[18];
    assign Rd_used = Micro_ins[17];
    assign IR_data_en = Micro_ins[16];
    assign Dmem_out_en = Micro_ins[15];
    assign B_out_en = Micro_ins[14];
    assign ALU_out_en = Micro_ins[13];
    assign AR_en = Micro_ins[12];
    assign Dmem_outenab = Micro_ins[11];
    assign Dmem_we = Micro_ins[10];
    assign Dmem_cs = Micro_ins[9];
    assign ZF_en = Micro_ins[8];
    assign CF_en = Micro_ins[7];
    assign MPC_sel = Micro_ins[6:5];
    assign MPC_en = Micro_ins[4];
    assign Imem_en = Micro_ins[3];
    assign PC_sel = Micro_ins[2:1];
    assign PC_en = Micro_ins[0];
                                     
endmodule