module inst_decoder_tb(); 

  logic [6:0] immediate;
  logic [5:0] nzimm;
  logic [8:0] offset;
  logic [3:0] opcode;
  logic RegWrite;
  logic RegDst;
  logic [15:0] instr_i;
  logic ALUSrc1;
  logic ALUSrc2; 
  logic [3:0] ALUOp; 
  logic MemWrite;
  logic MemToReg; 
  logic Regsrc;

  instruction_decoder inst(.immediate(immediate), .nzimm(nzimm), .offset(offset), .opcode(opcode), 
  .RegWrite(RegWrite), .RegDst(RegDst), .instr_i(instr_i), .ALUSrc1(ALUSrc1), .ALUSrc2(ALUSrc2), 
  .ALUOp(ALUOp), .MemWrite(MemWrite), .MemToReg(MemToReg), .Regsrc(Regsrc)); 

  initial begin
    #0 opcode = 4'b0000; immediate = 12; 
    #50 opcode = 4'b0001; immediate = 7; 
    #50 opcode = 4'b0010; 
    #50 opcode = 4'b0011; nzimm = 14; 
    #50 opcode = 4'b0100; 
    #50 opcode = 4'b0101; immediate = 15; 
    #50 opcode = 4'b0110; 
    #50 opcode = 4'b0111;  
    #50 opcode = 4'b1000; nzimm = 16; 
    #50 opcode = 4'b1001; nzimm = 13; 
    #50 opcode = 4'b1010; offset = 0; 
    #50 opcode = 4'b1011; offset = 0; 
    
  end

endmodule