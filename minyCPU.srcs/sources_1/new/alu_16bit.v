`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/10 20:11:31
// Design Name: 
// Module Name: alu_16bit
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


module alu_16bit(
    (*mark_debug = "true"*)input [15:0] A,
    (*mark_debug = "true"*)input [15:0] B,
    input [3:0] S,
    input M,
    input C_n,
    output [15:0] F,
    output ZF,
    output CF
    );
    
    (*mark_debug = "true"*)reg [15:0] data_o_logic;
    (*mark_debug = "true"*)reg [16:0] data_o_arith;
    reg [16:0] data_sub_tmp;
    reg [15:0] C_n_arith;
    
    assign F = (M == 1)?data_o_logic:data_o_arith[15:0];
    assign CF = (M == 0)?~data_o_arith[16]:1;
    assign ZF = (data_o_arith[15:0] == 16'b0000000000000000)?1:0;
    
//    if(M == 1)assign F = data_o_logic;
//    else assign F = data_o_arith[15:0];
//    if(M == 0)assign CF = ~data_o_arith[16];
//    else assign CF = 1;
//    if(data_o_arith[15:0] == 16'b0000000000000000)assign ZF = 1;
//    else assign ZF = 0;
    always @(C_n)
    begin
        C_n_arith[15:1] = 15'b000000000000000;
        C_n_arith[0] = ~C_n;
    end
    
    always @ (A,B,S,M)
    begin
        case(S)
        4'b0000:data_o_logic <= ~A;
        4'b0001:data_o_logic <= ~(A|B);
        4'b0010:data_o_logic <= (~A) & B;
        4'b0011:data_o_logic <= {16{1'b0}};
        4'b0100:data_o_logic <= ~(A&B);
        4'b0101:data_o_logic <= ~B;
        4'b0110:data_o_logic <= (A ^ B);
        4'b0111:data_o_logic <= A & (~B);
        4'b1000:data_o_logic <= (~A)|B;
        4'b1001:data_o_logic <= (A ~^ B);
        4'b1010:data_o_logic <= B;
        4'b1011:data_o_logic <= A & B;
        4'b1100:data_o_logic <= 16'b0000000000000001;
        4'b1101:data_o_logic <= A | (~B);
        4'b1110:data_o_logic <= A|B;
        4'b1111:data_o_logic <= A;
        default:data_o_logic <= {16{1'b0}};
        endcase
    end
    
    always @ (A,B,S,M,C_n_arith)
    begin
        case(S)
        4'b0000:data_o_arith <= {1'b0, A} + C_n_arith;
        4'b0001:data_o_arith <= {1'b0, (A|B)} + C_n_arith;
        4'b0010:data_o_arith <= {1'b0, (A | ~B)} + C_n_arith;
        4'b0011:data_o_arith <= 17'b01111111111111111+C_n_arith;
        4'b0100:data_o_arith <= {1'b0, A}+{1'b0,(A&~B)}+C_n_arith;
        4'b0101:data_o_arith <= {1'b0,(A|B)}+{1'b0,(A&~B)}+C_n_arith;
        4'b0110:
            begin
            data_sub_tmp <= {1'b0,A} - {1'b0,B}+C_n_arith;
            data_o_arith <= {data_sub_tmp[16],data_sub_tmp[15:0]};
            end
        4'b0111:
            begin
            data_sub_tmp <= {1'b0, (A&~B)} - 1 + C_n_arith;
            data_o_arith <= {~data_sub_tmp[16],data_sub_tmp[15:0]};
            end
        4'b1000:data_o_arith <= {1'b0,A} + 1 + C_n_arith;
        4'b1001:data_o_arith <= {1'b0, A}+{1'b0, B} + C_n_arith;
        4'b1010:data_o_arith <= {1'b0, (A|~B)}+{1'b0, (A&B)} + C_n_arith;
        4'b1011:
            begin
            data_sub_tmp <= {1'b0, (A&B)} - 1 + C_n_arith;
            data_o_arith <= ~data_sub_tmp[16] & data_sub_tmp[15:0];
            end
        4'b1100:data_o_arith <= {1'b0, A}+{1'b0, A} + C_n_arith;
        4'b1101:data_o_arith <= {1'b0, (A|B)}+{1'b0, A} + C_n_arith;
        4'b1110:data_o_arith <= {1'b0, (A|~B)} + {1'b0, A} + C_n_arith;
        4'b1111:
            begin
            data_sub_tmp <= {1'b0, A} - 1 + C_n_arith;
            data_o_arith <= {~data_sub_tmp[16],data_sub_tmp[15:0]}; 
            end
        default:data_o_arith <= {16{1'b0}};
        endcase
    end
endmodule
