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

#initialize
xor $t3, $t3, $t3
xor $31, $31, $31

nop
nop
nop
nop
nop
beq $s1,$s0, end
nop
nop
nop
nop
nop

sub $t5, $s1, $s0

nop
nop
nop
nop
nop
bgezal $t5, sgreatereq
nop
nop
nop
nop
nop

nor $t3, $t3, $t3
j end

sgreatereq:
ori $t3, $t3, 1
j end

end :

lui $1, 0x1001
sw $31, 68($1)

lui $1, 0x1001
sw $t3, 64($1)

j main