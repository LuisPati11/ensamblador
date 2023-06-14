#A partir de un vector que contenga el dni mostraremos por pantalla el mismo dni en elq eu los números mayores que 5 se les reste dos,
#y a parte la multiplicaión de todos los números del dni excepto el de la primera posición

.data
	dni: .word 0,5,7,1,5,1,5,7
    str: .ascii "; "
.text
	.globl main
    	main:
        la $a1 dni #caragamos la dirección del vector 
        move $a2 $a1 #la volvemos a cargar en otro regidtro que no modificaremos
        li $t0 0 #inicializar contador
        li $t1 8 #tamaño vector
        li $t3 5 #constante 5
        li $t4 2 #constante 2
        li $t5 1 #constante 1
        bucle:
        bge $t0 $t1 fin #bucle
        lw $t2 ($a1) #cargamos valor primera posición vector en un temporal
        beq $a1 $a2 salto #if para comprobar que es la primera posición del vector
        mul $t5 $t5 $t2 #multiplicación de los vaores del vector
        salto:
        bgt $t2 $t3 resta # if para comprobar si el nº es mayor que 5
        imprime:
        move $a0 $t2 #imprime el dni modificado
        li $v0 1
        syscall
        incrementos:
        addi $t0 $t0 1 #incrementa el contador
        addi $a1 $a1 4 #incrementa la posicion del vector
        j bucle
        resta:
        sub $t2 $t2 $t4 #resta dos al valor del vector
        j imprime
        fin:
        la $a0 str #imprime ;
        li $v0 4
        syscall
        move $a0 $t5 #imprime valor multiplicacion
        li $v0 1
        syscall
        li $v0 10 #salir
        syscall
        