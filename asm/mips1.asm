.data 
in1 : .word 0
in2 : .word 2
val1: .word 10
val2: .word 12
assert: .word 15

.text

main:

lw $t1, in1
lw $t2, in2

sub $t4, $t2, $t1

lui $1, 0x1001
sw $t4, 56($1)

j main

