.data
val: .word 10,7,5

.text
li $t1,0x10010000
lw $t2,1($t1)
add $t3, $t2, $t1
sub $t3, $t2, $t1

