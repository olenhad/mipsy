.data 
val1: .word 10
val2: .word 12
.text
#lw test
main:
j jtest
lui $t1, 1
lui $t2, 1
#beq $t1,$t2, jtest

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





