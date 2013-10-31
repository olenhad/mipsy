.data 
val1: .word 10
val2: .word 12
assert: .word 15

.text

main:

lw $t1, val1
lw $t2, val2

add $t3, $t2, $t1
# 22

sub $t4, $t3, $t1
# 12

and $t5, $t2, $t4
# 12

or $t6, $t5, $t1
# 14

ori $t7, $t6, 1
# 15

#nor $s0, $t1, $t7
#  FFFF shit

#slt $s1, $t1, $s0

# 1
#slt $s2, $t2, $t1
# 0

# output 
lw $t1, assert
beq $t7, $t1, out

exit:

j exit

out:
lui $1, 0x1001
sw $t7, 60($1)
j exit