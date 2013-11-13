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
nop
nop
nop
nop
nop

beq $s1, $s0, equal
nop
nop
nop
nop
nop

add $t6, $t1, $t2
j out
equal:
sub $t6, $t2, $t1

out:
add $t4, $s0, $s1

lui $1, 0x1001
sw $t6, 68($1)

lui $1, 0x1001
sw $t4, 64($1)

j main

