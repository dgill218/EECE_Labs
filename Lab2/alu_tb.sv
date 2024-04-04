modiule alu_tb(); 

   logic [15:0] a, 
   logic [15:0] b, 
   logic [3:0] s, 
   logic [15:0] f, 
   logic ovf, 
   logic take_branch

  alu UUT(.a(a), .b(b), .s(s), .f(f), .ovf(ovf), .take_branch(take_branch)); 

  initial begin 
    a=16'b0000000000001001; b=16'b0000000000111110; s=4'b0000;
    #100 a=16'b1010010000010101; b=16'b1010010101010101; s=4'b0000;
    #100 a=16'b0000000101111101; b=16'b0000001010100110; s=4'b0001;
    #100 a=16'b0000000000000111; b=16'b1111110101111101; s=4'b0010;
    #100 a=16'b0000000101111101; b=16'b1111110101011001; s=4'b0011;
    #100 a=16'b1111111111101001; b=16'b0000000000000010; s=4'b0100;
    #100 a=16'b0000000101111101; b=16'b0000000000000101; s=4'b0101;
    #100 a=16'b0100000000111000; b=16'b0000001010100110; s=4'b0110;
    #100 a=16'b0100000000111000; b=16'b0000001010100110; s=4'b0111;
    #100 a=16'b0000001111011011; b=16'b0000001010100110; s=4'b1000;
  end 
endmodule 



