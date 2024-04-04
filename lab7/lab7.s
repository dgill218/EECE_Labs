addi s0, s0, 2 # multiplicand
addi s1, s1, 3 # miltiplier / downcounter
add a1, a1, s1 # upcounter
beqz s1, done # If multiplier is 0, return 0 
beqz s0, done # If multiplicand is 0, return 0

start: 
  add a0, a0, s0 # add multiplicand to accumulator 
  addi s1, s1, -1 # increment counters
  addi a1, a1, 1 
  beqz s1, done # If downcounter = 0, return 
  beqz a1, flip # If upcounter = 0, flip sign
  bnez a0, start # loop

flip: 
  addi a1, a1, -1 # a1 = ffffffff
  xor a0, a0, a1 # use a1 to invert a0
  addi a0, a0, 1 # add one to finish two's complement

done: 
