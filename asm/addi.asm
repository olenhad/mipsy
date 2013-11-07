.data 
in1 : .word 5
in2 : .word 16

.text

main:

lw $t1, in1
lw $t2, in2

sub $t4, $t1, $t2
#sllv $t5, $t1, $t2


lui $1, 0x1001
sw $t4, 64($1)

lui $1, 0x1001
sw $t5, 68($1)

j main
