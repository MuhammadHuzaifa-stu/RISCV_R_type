module regfile(input logic [4:0] raddr1,raddr2,waddr, 
			   input logic [31:0] wdata,
			   input logic RegWrite, Clk, 
			   output logic [31:0] rdata1, rdata2);

	//reg [31:0] Reg = new reg[32];
	logic [31:0] Reg [0:31];
	initial
	begin
		Reg[0] = 32'h0;
        Reg[1] = 32'h0;
        Reg[2] = 32'h0;
        Reg[3] = 32'h0;
        Reg[4] = 32'h0;
        Reg[5] = 32'd20;
        Reg[6] = 32'd25;
        Reg[7] = 32'd15;
        Reg[8] = 32'h0;
        Reg[9] = 32'h0;
        Reg[10] = 32'h0;
        Reg[11] = 32'h0;
        Reg[12] = 32'h0;
        Reg[13] = 32'h0;
        Reg[14] = 32'h0;
        Reg[15] = 32'h0;
        Reg[16] = 32'h0;
        Reg[17] = 32'h0;
        Reg[18] = 32'h0;
        Reg[19] = 32'h0;
        Reg[20] = 32'h0;
        Reg[21] = 32'h0;
        Reg[22] = 32'h0;
        Reg[23] = 32'h0;
        Reg[24] = 32'h0;
        Reg[25] = 32'h0;
		Reg[26] = 32'h0;
        Reg[27] = 32'h0;
        Reg[28] = 32'd50;
        Reg[29] = 32'd5;
        Reg[30] = 32'd2;
        Reg[31] = 32'd9;
	end
		
	always @(negedge Clk)
	begin
		if (RegWrite & waddr[0]) 	Reg[waddr] <= wdata;
	end
	assign rdata1 = Reg[raddr1];
	assign rdata2 = Reg[raddr2];

endmodule