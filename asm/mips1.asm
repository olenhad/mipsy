.data 
val1: .word 10
val2: .word 12
.text

main:

lw $t1, val1
lw $t2, val2

add $t3, $t2, $t1
# 22

sub $t4, $t2, $t1
# 2

and $t5, $t2, $t1
# 8

or $t6, $t2, $t1
# 14

ori $t7, $t2, 10
# 14

nor $s0, $t1, $t2
#  

slt $s1, $t1, $t2
# 1
slt $s2, $t2, $1
# 0

# output 
lui $1, 0x1001
sw $t3, 60($1)

exit:

j exit

