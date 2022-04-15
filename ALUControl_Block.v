`timescale 1 ps / 100 fs
// fpga4student.com: FPGA projects, Verilog Projects, VHDL projects
// Verilog project: 32-bit 5-stage Pipelined MIPS Processor in Verilog 
// ALU Control unit
module ALUControl_Block( ALUControl, ALUOp, Function);
output [2:0] ALUControl;
reg [2:0] ALUControl;
input [1:0] ALUOp;
input [5:0] Function;
wire [7:0] ALUControlIn;
assign ALUControlIn = {ALUOp,Function};
always @(ALUControlIn)
casex (ALUControlIn)
 8'b11xxxxxx: ALUControl=3'b001;
 8'b00xxxxxx: ALUControl=3'b000;
 8'b01xxxxxx: ALUControl=3'b010;
 8'b10100000: ALUControl=3'b000;
 8'b10100010: ALUControl=3'b010;
 8'b10101010: ALUControl=3'b011;
 8'b10000100: ALUControl=3'b100;
 8'b10000110: ALUControl=3'b101;
 default: ALUControl=3'b000;
 endcase
endmodule