include(`/home/jaime1/Programas/mips-parser/bin/../lib/mips-count-pc.m4')dnl
divert(-1)
BEGIN_ALLOCATIONS_HERE__()
ALLOCATE_ASCIIZ(mensaje, "Introduce un numero del 0 al 4 ")
ALLOCATE_ASCIIZ(Galicia, "Galicia ")
ALLOCATE_ASCIIZ(Madrid, "Madrid ")
ALLOCATE_ASCIIZ(Andalucia, "Andalucia ")
ALLOCATE_ASCIIZ(Extremadura, "Extremadura ")
ALLOCATE_ASCIIZ(Otra, "Otra ")
BEGIN_CODE_HERE__()
GLOBAL_STARTING_POINT__(main)
DEFINE_TAG__(main)
LA(REGISTER_NUMBER__(4),mensaje)
LW(REGISTER_NUMBER__(5),REGISTER_NUMBER__(4),0)
ADDI(REGISTER_NUMBER__(2),REGISTER_NUMBER__(0),4)
SYSCALL()
ADDI(REGISTER_NUMBER__(2),REGISTER_NUMBER__(0),5)
SYSCALL()
ADDI(REGISTER_NUMBER__(8),REGISTER_NUMBER__(0),0)
BNE(REGISTER_NUMBER__(2),REGISTER_NUMBER__(8),valor1)
LA(REGISTER_NUMBER__(4),Galicia)
J(terminar)
DEFINE_TAG__(valor1)
ADDI(REGISTER_NUMBER__(8),REGISTER_NUMBER__(0),1)
BNE(REGISTER_NUMBER__(2),REGISTER_NUMBER__(8),valor2)
LA(REGISTER_NUMBER__(4),Madrid)
J(terminar)
DEFINE_TAG__(valor2)
ADDI(REGISTER_NUMBER__(8),REGISTER_NUMBER__(0),2)
BNE(REGISTER_NUMBER__(2),REGISTER_NUMBER__(8),valor3)
LA(REGISTER_NUMBER__(4),Andalucia)
J(terminar)
DEFINE_TAG__(valor3)
ADDI(REGISTER_NUMBER__(8),REGISTER_NUMBER__(0),3)
BNE(REGISTER_NUMBER__(2),REGISTER_NUMBER__(8),valor4)
LA(REGISTER_NUMBER__(4),Extremadura)
J(terminar)
DEFINE_TAG__(valor4)
LA(REGISTER_NUMBER__(4),Otra)
DEFINE_TAG__(terminar)
ADDI(REGISTER_NUMBER__(2),REGISTER_NUMBER__(0),4)
SYSCALL()
ADDI(REGISTER_NUMBER__(2),REGISTER_NUMBER__(0),10)
SYSCALL()
divert(0)dnl
include(`_sample.m4')dnl
