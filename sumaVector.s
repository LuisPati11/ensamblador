.data
	v: .word 7,8,3,4,5,6
    valor: .word 1
    
.text
	.globl main
	main:
    	#Movemos variables y invocamos metodo sumarValor
    	la $a0 v
        lw $a2 valor #Cargamos PALABRA, no direccion de memoria que es con la a ten cuidado
        jal sumarValor
        
     	#Despues de sumar los valores, hacemos otro bucle para recorrer el vector y imprimirlo
      	li $t3 0 #Contador del bucle
        li $t5 6 #Longitud del vector
        move $t0 $a0
        
        bucle:  bge $t3 $t5 finPrograma
                
                lw $a0 ($t0) #Volvemos a cargar en  $a0 para imprimir, y imprimimos  ------------------------------------------------IMPRIMIR VECTOR
		li $v0 1
                syscall
                
                add $t3 $t3 1 #Incrementamos i del bucle (el contador de salida)
                addi $t0 $t0 4 #Se incrementa el byte en 4 para pasar al siguiente elemento del vector
                j bucle
                
        finPrograma: li $v0 10
        	     syscall
        
        
        
    sumarValor:
    	#Movemos variables a temporales
    	move $t0 $a0
        move $t2 $a2
        
        #Creamos variable i del bucle que es t3 y tambien variable para ir sumando que es t4
        li $t3 0 #Contador del bucle
        #li $t4 0 #Variable temporal para sumarle el valorSuma al vector
        li $t5 6 #Longitud del vector
        
        bucleSumar: bge $t3 $t5 finBucleSumar
    		    lw $t4 0($t0) #El byte que hay en t0 se carga en t4 --> t4 = 7 por ejemplo
        	    add $t4 $t4 $t2 #Se le suma al valor sacado del vector, el valorSuma del principio
                    sw $t4 0($t0) #metemos el valor nuevo sumado en el vector otra vez ---PROBLEMA
                    
                    #PARA IMPRIMIR
                    #lw $a0 ($t0) #Volvemos a cargar en  $a0 para imprimir, y imprimimos  ------------------------------------------------IMPRIMIR VECTOR
					#li $v0 1
                    #syscall
                    
                    add $t3 $t3 1 #Incrementamos i del bucle (el contador de salida)
                    addi $t0 $t0 4 #Se incrementa el byte en 4 para pasar al siguiente elemento del vector
                    j bucleSumar #Para que siga con el bucle
        
        finBucleSumar: jr $ra #Salto a seguir despues del "jal sumarValor"