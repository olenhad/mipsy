.data 
in1 : .word 1
in2 : .word 6

.text

main:

lw $t1, in1
lw $t2, in2

addi $t3,$t1,10  
mult $t2,$t3
mfhi $t5
mflo $t4

lui $1, 0x1001
sw $t5, 64($1)

lui $1, 0x1001
sw $t4, 68($1)

j main

