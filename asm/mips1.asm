.data 
in1 : .word 1
in2 : .word 6

.text

main:

lw $t1, in1
lw $t2, in2

sub $t4, $t2, $t1
add $t5, $t2, $t1


lui $1, 0x1001
sw $t4, 64($1)

add $s3,$s2,$s1
add $s3,$s2,$s1

lw $t6, 64($1)
addi $t6, $t6, 1
 
lui $1, 0x1001
add $s3,$s2,$s1
add $s3,$s2,$s1


sw $t6, 68($1)

#add $s3,$s2,$s1
#add $s3,$s2,$s1
#add $s3,$s2,$s1
#add $s3,$s2,$s1
#add $s3,$s2,$s1

j main

