`timescale 1 ps / 100 fs
module alu(Output, CarryOut, zero, overflow, negative, BussA, BussB, ALUControl);
output CarryOut,overflow,negative,zero;
output reg [31:0] Output;
input [31:0] BussA,BussB;
input [2:0] ALUControl;
wire lessthan;
wire [31:0] crrout;
wire [31:0] out_old;
alu1bit alu0(out_old[0],crrout[0],BussA[0],BussB[0],ALUControl[1],lessthan,ALUControl);
alu1bit alu1(out_old[1],crrout[1],BussA[1],BussB[1],crrout[0],1'b0,ALUControl);
alu1bit alu2(out_old[2],crrout[2],BussA[2],BussB[2],crrout[1],1'b0,ALUControl);
alu1bit alu3(out_old[3],crrout[3],BussA[3],BussB[3],crrout[2],1'b0,ALUControl);
alu1bit alu4(out_old[4],crrout[4],BussA[4],BussB[4],crrout[3],1'b0,ALUControl);
alu1bit alu5(out_old[5],crrout[5],BussA[5],BussB[5],crrout[4],1'b0,ALUControl);
alu1bit alu6(out_old[6],crrout[6],BussA[6],BussB[6],crrout[5],1'b0,ALUControl);
alu1bit alu7(out_old[7],crrout[7],BussA[7],BussB[7],crrout[6],1'b0,ALUControl);
alu1bit alu8(out_old[8],crrout[8],BussA[8],BussB[8],crrout[7],1'b0,ALUControl);
alu1bit alu9(out_old[9],crrout[9],BussA[9],BussB[9],crrout[8],1'b0,ALUControl);
alu1bit alu10(out_old[10],crrout[10],BussA[10],BussB[10],crrout[9],1'b0,ALUControl);
alu1bit alu11(out_old[11],crrout[11],BussA[11],BussB[11],crrout[10],1'b0,ALUControl);
alu1bit alu12(out_old[12],crrout[12],BussA[12],BussB[12],crrout[11],1'b0,ALUControl);
alu1bit alu13(out_old[13],crrout[13],BussA[13],BussB[13],crrout[12],1'b0,ALUControl);
alu1bit alu14(out_old[14],crrout[14],BussA[14],BussB[14],crrout[13],1'b0,ALUControl);
alu1bit alu15(out_old[15],crrout[15],BussA[15],BussB[15],crrout[14],1'b0,ALUControl);
alu1bit alu16(out_old[16],crrout[16],BussA[16],BussB[16],crrout[15],1'b0,ALUControl);
alu1bit alu17(out_old[17],crrout[17],BussA[17],BussB[17],crrout[16],1'b0,ALUControl);
alu1bit alu18(out_old[18],crrout[18],BussA[18],BussB[18],crrout[17],1'b0,ALUControl);
alu1bit alu19(out_old[19],crrout[19],BussA[19],BussB[19],crrout[18],1'b0,ALUControl);
alu1bit alu20(out_old[20],crrout[20],BussA[20],BussB[20],crrout[19],1'b0,ALUControl);
alu1bit alu21(out_old[21],crrout[21],BussA[21],BussB[21],crrout[20],1'b0,ALUControl);
alu1bit alu22(out_old[22],crrout[22],BussA[22],BussB[22],crrout[21],1'b0,ALUControl);
alu1bit alu23(out_old[23],crrout[23],BussA[23],BussB[23],crrout[22],1'b0,ALUControl);
alu1bit alu24(out_old[24],crrout[24],BussA[24],BussB[24],crrout[23],1'b0,ALUControl);
alu1bit alu25(out_old[25],crrout[25],BussA[25],BussB[25],crrout[24],1'b0,ALUControl);
alu1bit alu26(out_old[26],crrout[26],BussA[26],BussB[26],crrout[25],1'b0,ALUControl);
alu1bit alu27(out_old[27],crrout[27],BussA[27],BussB[26],crrout[26],1'b0,ALUControl);
alu1bit alu28(out_old[28],crrout[28],BussA[28],BussB[28],crrout[27],1'b0,ALUControl);
alu1bit alu29(out_old[29],crrout[29],BussA[29],BussB[29],crrout[28],1'b0,ALUControl);
alu1bit alu30(out_old[30],crrout[30],BussA[30],BussB[30],crrout[29],1'b0,ALUControl);
alu1bit alu31(out_old[31],crrout[31],BussA[31],BussB[31],crrout[30],1'b0,ALUControl);
not #(50) notcarry(notcr31,crrout[31]);
// Carryout = Not carry out 31 if it is subtraction
mux21 muxcarry31(CarryOut,crrout[31],notcr31,ALUControl[1]);
xor #(50) xor5(overflow,crrout[30],crrout[31]);
// SLT
addsub add2(addsub31Out,crrout31,BussA[31],BussB[31],crrout[30],ALUControl[1]);
xor #(50) xor6(lessthan,overflow,addsub31Out);
assign negative =out_old[31];
or #(50) or1(o1,out_old[0],out_old[1],out_old[2],out_old[3]);
or #(50) or2(o2,out_old[4],out_old[5],out_old[6],out_old[7]);
or #(50) or3(o3,out_old[8],out_old[9],out_old[10],out_old[11]);
or #(50) or4(o4,out_old[12],out_old[13],out_old[14],out_old[15]);
or #(50) or5(o5,out_old[16],out_old[17],out_old[18],out_old[19]);
or #(50) or6(o6,out_old[20],out_old[21],out_old[22],out_old[23]);
or #(50) or7(o7,out_old[24],out_old[25],out_old[26],out_old[27]);
or #(50) or8(o8,out_old[28],out_old[29],out_old[30],out_old[31]);
or #(50) or9(o9,o1,o2,o3,o4);
or #(50) or10(o10,o5,o6,o7,o8);
nor #(50) nor1(zero,o9,o10);
always @(*) begin 
casex(ALUControl)
3'b100: Output=  BussB << BussA[4:0];
3'b101: Output= BussB >> BussA[4:0];
default:Output=out_old;
endcase
end
endmodule