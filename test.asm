.text
.globl main
main:
move $fp,$sp
jal _main
li $v0,10
syscall
_main:
sw $fp, -4($sp)
sw $ra, -8($sp)
move $fp,$sp
li $t9,0
sw $t9,-12($fp)
lw $t9,-12($fp)
beq $t9,0,_etiq2
b _etiq3
_etiq2:
lw $t9,-12($fp)
bne $t9,5,_etiq4
b _etiq3
_etiq4:
li $v0, 4
la $a0,_msg0
syscall
li $v0,4
la $a0,_nextLine
syscall
b _etiq1
_etiq3:
_etiq1:
li $v0,1
b _mainSalida
_mainSalida:
move $sp,$fp
lw $ra, -8($sp)
lw $fp, -4($sp)
jr $ra
_suma:
sw $fp, -4($sp)
sw $ra, -8($sp)
move $s0,$a0
sw $s0,-12($sp)
move $fp,$sp
lw $v0,-12($fp)
b _sumaSalida
_sumaSalida:
move $sp,$fp
lw $fp, -4($sp)
lw $ra, -8($sp)
lw $s0,-12($sp)
jr $ra
.data
_nextLine: .asciiz "\n"
_msg0: .asciiz "Entro"

