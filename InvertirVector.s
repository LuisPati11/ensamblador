.data
	dni: .word 0,5,7,1,5,1,5,7
    str: .ascii "; "
.text
	.globl main
    	main:
        la $a1 dni #caragamos la dirección del vector 
        li $t0 0 #inicializar contador
        li $t1 8 #tamaño vector
        addi $a1 $a1 28 #sumamos 28 a la direccion del vector para irnos a la ultima posicion
        bucle:
        bge $t0 $t1 fin #bucle
        lw $t2 ($a1) #cargamos en t2 el valor de la última posición del vector
        move $a0 $t2 #imprimimos la posición del vector
        li $v0 1
        syscall
        incrementos:
        addi $t0 $t0 1 #incrementa el contador
        sub $a1 $a1 4 #decrementa la posición del vector
        j bucle
        fin:
        la $a0 str #imprime ;
        li $v0 4
        syscall
        li $v0 10 #salir
        syscall
        