module RISCV_R(input logic clk, reset);
	
	logic [31:0] inst,rdata1,rdata2,wdata,pc;
	logic write;
	logic [4:0] aluop;
	//PC
	counter c1 (clk, reset, pc);
	//Intruction memory
	Instmem I1 (.Address(pc), .Instruction(inst));
	//register file
	regfile r1 (.raddr1(inst[19:15]),.raddr2(inst[24:20]),.waddr(inst[11:7]), 
	.wdata(wdata),.RegWrite(write),.Clk(clk), 
	.rdata1(rdata1),.rdata2(rdata2));
	//controller
	controller co1 (.func7(inst[31:25]),.func3(inst[14:12]),.opcode(inst[6:0]),
	.alu_control(aluop),.regwrite_control(write));
	//ALU
	ALU A1 (.a(rdata1),.b(rdata2),.alu(aluop),.result(wdata));
endmodule