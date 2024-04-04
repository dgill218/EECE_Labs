module alu(
  input logic signed [15:0] a, 
  input logic signed [15:0] b, 
  input logic [3:0] s, 
  output logic [15:0] f, 
  output logic ovf, 
  output logic take_branch
); 

  assign ovf = 0; 
  assign take_branch = 0; 

  always_comb 
    begin 
      case(s) 
        4'b0000 : 
        begin 
            f = a + b; 
            ovf = (a[15] & b[15] & ~f[15]) | (~a[15] & ~b[15] & f[15]);
        end
        4'b0001 : f = ~b; 
        4'b0010 : f = a & b; 
        4'b0011 : f = a | b; 
        4'b0100 : f = a >>> b; 
        4'b0101 : f = a << b; 
        4'b0110 : 
            begin
                take_branch = (a == 0);
                f=0;
            end
        4'b0111 : 
            begin 
                take_branch = (a != 0);
                f=0;
            end
        4'b1000 : f = a ^ b; 
        default : f = 0;
      endcase
  end
  endmodule
