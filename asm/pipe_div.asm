.data 
in1 : .word 16
in2 : .word 6

.text

main:

lw $t1, in1
lw $t2, in2

lui $1,0x1001
lw $s0, 72($1)

lui $1,0x1001
lw $s1, 76($1)

mult $s1, $s0
mflo $t3

div $s1, $s0
mfhi $t5
sllv $t5, $t5, $t1
mflo $t4
add $t5, $t5, $t4

lui $1, 0x1001
sw $t3, 68($1)

lui $1, 0x1001
sw $t5, 64($1)

j main

