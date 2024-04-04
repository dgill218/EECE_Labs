module program_counter (
  input clk, 
  input rst, 
  input take_branch,
  input logic signed [8:0] offset,
  output logic [8:0] pc, 
); 

  always@(posedge clk, posedge rst)
   begin 
      if (rst == 1'b1) 
        begin 
          pc = 9'b00000_0000;
        end 
      else if (take_branch == 1'b1) 
        begin
          pc = pc + offset; 
        end
      else 
        begin 
          pc = pc + 1 
        end 
   end 
endmodule 
        