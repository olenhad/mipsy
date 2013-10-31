.data 
val1: .word 0xFFF00000
val2: .word 12
.text
#lw test
main:

lw $t3, val2
lui $1, 0x1001
sw $t3, 60($1)

lw $t1, val1
ori $t3, $t1, 0xF0F0
lui $t2, 1
#beq $t1, $t2, main
beq $t1,$t2, main

jtest2:

lui $t2, 5
lui $t4, 6

lw $t1, val1
#t1 = 0x000a
lw $t2, val2
#t2 = 0x0014
# r type
add $t3, $t2, $t1
#t3 = 0x001e
# sw
sub $t4, $t3, $t1
#t4 = 0x00014
jtest:
j jtest2 
sw $t4, val1





