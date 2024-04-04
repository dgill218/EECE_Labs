module instruction_decoder(
  input [6:0] immediate,
  input [5:0] nzimm,
  input [8:0] offset,
  input [3:0] opcode,
  output logic RegWrite, 
  output logic RegDst, 
  output logic [15:0] instr_i, 
  output logic ALUSrc1, 
  output logic ALUSrc2, 
  output logic [3:0] ALUOp, 
  output logic MemWrite, 
  output logic MemToReg, 
  output logic Regsrc
);

always @(opcode) 
begin 
  case(opcode)
    4'b0000:
      begin 
        RegWrite = 1; 
        RegDst = 1; 
        instr_i = immediate; 
        ALUSrc1 = 0; 
        ALUSrc2 = 1; 
        ALUOp = 0; 
        MemWrite = 0; 
        MemToReg = 1; 
        Regsrc = 0; 
      end 
      4'b0001:
      begin 
        RegWrite = 0; 
        RegDst = 0; 
        instr_i = immediate; 
        ALUSrc1 = 0; 
        ALUSrc2 = 1; 
        ALUOp = 0; 
        MemWrite = 1; 
        MemToReg = 0; 
        Regsrc = 0; 
      end 
      4'b0010:
      begin 
        RegWrite = 1; 
        RegDst = 1; 
        ALUSrc1 = 0; 
        ALUSrc2 = 0; 
        ALUOp = 0; 
        MemWrite = 0; 
        MemToReg = 0; 
        Regsrc = 1; 
      end 
      4'b0011:
      begin 
        RegWrite = 1; 
        RegDst = 1; 
        instr_i = nzimm; 
        ALUSrc1 = 0; 
        ALUSrc2 = 1; 
        ALUOp = 0; 
        MemWrite = 0; 
        MemToReg = 0; 
        Regsrc = 1; 
      end 
      4'b0100:
      begin 
        RegWrite = 1; 
        RegDst = 1; 
        ALUSrc1 = 0; 
        ALUSrc2 = 0; 
        ALUOp = 2; 
        MemWrite = 0; 
        MemToReg = 0; 
        Regsrc = 1; 
      end 
      4'b0101:
      begin 
        RegWrite = 1; 
        RegDst = 1; 
        instr_i = immediate; 
        ALUSrc1 = 0; 
        ALUSrc2 = 1; 
        ALUOp = 2; 
        MemWrite = 0; 
        MemToReg = 0; 
        Regsrc = 1; 
      end 
      4'b0110:
      begin 
        RegWrite = 1; 
        RegDst = 1; 
        ALUSrc1 = 0; 
        ALUSrc2 = 0; 
        ALUOp = 3; 
        MemWrite = 0; 
        MemToReg = 0; 
        Regsrc = 1; 
      end 
      4'b0111:
      begin 
        RegWrite = 1; 
        RegDst = 1; 
        ALUSrc1 = 0; 
        ALUSrc2 = 0; 
        ALUOp = 8; 
        MemWrite = 0; 
        MemToReg = 0; 
        Regsrc = 1; 
      end 
      4'b1000:
      begin 
        RegWrite = 1; 
        RegDst = 1; 
        instr_i = nzimm; 
        ALUSrc1 = 0; 
        ALUSrc2 = 1; 
        ALUOp = 4; 
        MemWrite = 0; 
        MemToReg = 0; 
        Regsrc = 1; 
      end 
      4'b1001:
      begin 
        RegWrite = 1; 
        RegDst = 1; 
        instr_i = nzimm; 
        ALUSrc1 = 0; 
        ALUSrc2 = 1; 
        ALUOp = 5; 
        MemWrite = 0; 
        MemToReg = 0; 
        Regsrc = 1; 
      end 
      4'b1010:
      begin 
        RegWrite = 0; 
        RegDst = 0; 
        instr_i = offset; 
        ALUSrc1 = 0; 
        ALUSrc2 = 1; 
        ALUOp = 6; 
        MemWrite = 0; 
        MemToReg = 0; 
        Regsrc = 0; 
      end 
      4'b1011:
      begin 
        RegWrite = 0; 
        RegDst = 0; 
        instr_i = offset; 
        ALUSrc1 = 0; 
        ALUSrc2 = 1; 
        ALUOp = 7; 
        MemWrite = 0; 
        MemToReg = 0; 
        Regsrc = 0; 
      end 
      // Default can be used for debugging 
      default: instr_i = 16'b00000000_00000000; 
  endcase
end

endmodule 

