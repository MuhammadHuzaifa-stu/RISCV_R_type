module controller(input logic [6:0] func7,input logic [2:0] func3,input logic [6:0] opcode,
	output logic [3:0] alu_control,output logic regwrite_control);
    always_comb
    begin
        if (opcode == 7'b0110011) begin 
            regwrite_control = 1;
            case (func3)
                3'd0: begin
                    if (func7 == 7'd0) alu_control = 4'b0000; // ADD
                    else if (func7 == 7'd32) alu_control = 4'b0001; // SUB
					end
                3'd1: alu_control = 4'b0010; // SLL
                3'd2: alu_control = 4'b0011; // SLT
                3'd3: alu_control = 4'b0100; // SLTU
                3'd4: alu_control = 4'b0101; // XOR
				3'd5: begin 
					if (func7 == 7'd0) alu_control = 4'b0110; // SRL
					else if (func7 == 7'd32) alu_control = 4'b0111; // SRA
					end
				3'd6: alu_control = 4'b1000; // OR
				3'd7: alu_control = 4'b1001; // AND
			endcase
      end
    end
endmodule