.data 
val1: .word 10
val2: .word 12
.text

main:
lw $t1, val1
lw $t2, val2
add $t3, $t2, $t1
# output 
lui $1, 0x1001
sw $t3, 60($1)


exit:

j exit

