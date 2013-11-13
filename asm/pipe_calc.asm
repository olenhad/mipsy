.data 
in1 : .word 16
in2 : .word 0x0000ffff

.text

main:

lw $t1, in1
lw $t2, in2

lui $1,0x1001
lw $s0, 72($1)

lui $1,0x1001
lw $s1, 76($1)

#use sra for dividing by 2
add $t3,$s0, $s1
sll $t3,$t3, 0x10
#t3 = s0 + s1\

sub $t4, $s1, $s0
and $t4, $t4, $t2
or $t3, $t3, $t4
#t4 = s1 - s0 

mult $s1,$s0
mflo $t5

sllv $t5,$t5, $t1

div $s1, $s0
mflo $t6
and $t6, $t6, $t2
or $t5, $t5, $t6
#add $t4, $s0, $s1

lui $1, 0x1001
sw $t5, 68($1)

lui $1, 0x1001
sw $t3, 64($1)

j main

