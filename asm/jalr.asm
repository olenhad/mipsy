.data 
in1 : .word 0
in2 : .word 0x00400000

.text

main:

lui $1,0x1001
lw $s0, 72($1)
 
lui $1,0x1001
lw $s1, 76($1)

lui $t2, 0x0040
 
#div $t1, $t2
#sllv $t5, $t1, $t2
lui $1, 0x1001
sw $s0, 64($1)

lui $1, 0x1001
sw $31, 68($1)

nop
nop
nop
nop
nop

#jalr $t2

nop
nop
nop
nop
nop


jal main

