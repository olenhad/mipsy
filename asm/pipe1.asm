.data 
in1 : .word 1
in2 : .word 6

.text

main:

lw $t1, in1
lw $t2, in2

add $t3, $t2, $t1
add $t4, $t3, $t1
add $t5, $t4, $t1

lui $1, 0x1001
sw $t5, 64($1)

j main

