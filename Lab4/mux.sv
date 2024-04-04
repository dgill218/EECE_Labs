module TwoToOneMux(
  input logic [15:0] a,
  input logic [15:0] b,
  input logic sel_mux,
  output logic [15:0] out
);

assign out = sel_mux ? b : a;

endmodule
