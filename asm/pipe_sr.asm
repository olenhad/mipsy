.data 
in1 : .word 8
in2 : .word 1

.text

main:

lw $t1, in1
lw $t2, in2

lui $1,0x1001
lw $s0, 72($1)

lui $1,0x1001
lw $s1, 76($1)

#use sra for dividing by 2
sra $t3,$s0,1

#use srav for dividing by 2 again
# Expected : t3 = s0 /4
srav $t3,$t3,$t2

#use sra for dividing by 2
srl $t4,$s1,1

#use srav for dividing by 2 again
# Expected : t3 = s0 /4
srlv $t4,$t4,$t2


lui $1, 0x1001
sw $t4, 68($1)

lui $1, 0x1001
sw $t3, 64($1)

j main