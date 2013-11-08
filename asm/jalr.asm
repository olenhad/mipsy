.data 
in1 : .word 0
in2 : .word 1

.text

main:

lw $t1, in1
lw $t2, in2

addi $t5,$t1,0

jal ifzero
#div $t1, $t2
#sllv $t5, $t1, $t2

lui $1, 0x1001
sw $31, 64($1)

j main

ifzero:

addi $t3, $31, 0
add $s0,$s1, $s2  
jalr $t3

lui $1, 0x1001
sw $t5, 68($1)