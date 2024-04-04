module regfile(
  input clk,
  input rst,
  input wr_en,
  input [2:0] rd0_addr,
  input [2:0] rd1_addr,
  input [2:0] wr_addr,
  input [15:0] wr_data,
  output logic [15:0] rd0_data,
  output logic [15:0] rd1_data
); 

reg [15:0] reg_file [0:7];

always@(posedge clk, posedge rst) begin
  if (rst == 1'b1) begin
    for (int i = 0; i < 8; i++) reg_file[i] = 16'b00000000_00000000;
  end
  else if (wr_en == 1'b1) begin
    reg_file[wr_addr] = wr_data;
  end
end
assign rd0_data = reg_file[rd0_addr];
assign rd1_data = reg_file[rd1_addr];

endmodule
