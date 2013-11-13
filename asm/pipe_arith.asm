.data 
in1 : .word 1
in2 : .word 6

.text

main:

lw $t1, in1
lw $t2, in2

lui $1,0x1001
lw $s0, 72($1)

lui $1,0x1001
lw $s1, 76($1)

#use sra for dividing by 2
addi $t3,$s0,10

add $t3,$t3, $s1
#t3 = s0 + s1 + 10
sub $t4, $s1, $s0
#t4 = s1 - s0 

#add $t4, $s0, $s1

lui $1, 0x1001
sw $t4, 68($1)

lui $1, 0x1001
sw $t3, 64($1)

j main

