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

sll $t4, $t2, 2
sra $t5, $t1, 1

lui $1, 0x1001
sw $t4, 64($1)

lui $1, 0x1001
sw $t5, 68($1)

j main

