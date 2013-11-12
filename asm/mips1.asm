.data 
in1 : .word 2
in2 : .word 3

.text

main:

lw $t1, in1
lw $t2, in2

sub $t4, $t2, $t1
add $t5, $t2, $t1


lui $1, 0x1001
sw $t4, 64($1)

lui $1, 0x1001
sw $t5, 68($1)

#add $s3,$s2,$s1
#add $s3,$s2,$s1
#add $s3,$s2,$s1
#add $s3,$s2,$s1
#add $s3,$s2,$s1

j main

