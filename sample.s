# Practica 3a
#

.data
    mensaje: .asciiz "Introduce un numero del 0 al 4 "
    Galicia: .asciiz "Galicia "
    Madrid:  .asciiz "Madrid "
    Andalucia: .asciiz "Andalucia "
    Extremadura: .asciiz "Extremadura "
    Otra:    .asciiz "Otra "

.text
.globl main

main:
    la $a0, mensaje     # Mensaje
    lw $a1, 0($a0)
    addi $v0, $0, 4
    syscall
    addi $v0, $0, 5
    syscall
    addi $t0, $0, 0
    bne $v0, $t0, valor1
    la $a0, Galicia
    j terminar

  valor1:
    addi $t0, $0, 1
    bne $v0, $t0, valor2
    la $a0, Madrid
  j terminar

  valor2:
    addi $t0, $0, 2
    bne $v0,$t0, valor3
    la $a0, Andalucia
  j terminar

  valor3:
    addi $t0, $0, 3
    bne $v0, $t0, valor4
    la $a0, Extremadura
  j terminar

valor4:
    la $a0, Otra

terminar:
    addi $v0, $0, 4
    syscall
    addi $v0, $0, 10
    syscall
