.data

     cadena: .asciiz "hola"
     
 .text
     .globl main
          main:
             li $t3 4
             li $t6 'a'
             li $t2 0
             li $t5 0
             la $a0 cadena
             move $t0 $a0
           vocales:
             beqz $t0 fin1
             bge $t2 $t3 fin2
             lb $t4 ($t0)
             beq $t4 $t6 suma
        	bucle:
             add $t2 $t2 1
             addi $t0 $t0 1
             j vocales
         fin1:
             li $t1 -1
             li $v0 1
             syscall
         suma:
             add $t5 $t5 1
             j bucle
         fin2:
             move $a0 $t5
             li $v0 1
             syscall
             li $v0 10
             syscall