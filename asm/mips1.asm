.data 
in1 : .word 12
in2 : .word 12
val1: .word 1
val2: .word 13
assert: .word 15

.text

main:

lw $t1, in1
lw $t2, in2

sub $t4, $t2, $t1
add $t5, $t2, $t1

beq $t1,$t2,equal

unequal:
lui $1, 0x1001
sw $t4, 64($1)

lui $1, 0x1001
sw $t5, 68($1)
j exit

equal:
 lw $t6, val1
 lui $1, 0x1001
 sw $t6, 64($1)
 
 lw $t7, val2
 lui $1, 0x1001
 sw $t7, 68($1)
 
exit:

j main

