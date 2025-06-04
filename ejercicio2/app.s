	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGH, 		480
	.equ BITS_PER_PIXEL,  	32

	.equ GPIO_BASE,      0x3f200000
	.equ GPIO_GPFSEL0,   0x00
	.equ GPIO_GPLEV0,    0x34



.globl delay                                        // ¡Pseudocódigo para entender cómo van trabajando las instrucciones!
delay:
    // Inicialización del contador y registro tope
    MOV X13,#0                                      

    MOVZ X14,#0x00,LSL #16                           
    MOVK X14,#0xf000,LSL #0                         
    LSL X14,X14,5                                   
    // Bucle de delay
    mantener_delay:
        CMP X13,X14                                // Comparar X16 (contador) con X17 (tope)
        B.EQ finalizar_delay                       // Si X16 = X17, el delay finaliza
        ADD X13, X13, #1                           // Si X16 != X17, incrementa X16 en 1
        B mantener_delay                           // Salta de nuevo a mantener_delay para continuar el bucle

    finalizar_delay:
RET

// AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
.globl main
main:
total_loop:
    mov x16, 30
    mov x17, 100
    bl dibujar_cielo
    bl dibujar_pasto
    bl dibujar_arbol_0
    bl dibujar_famaf
    bl dibujar_letras
    bl dibujar_nube

    bl dibujar_arboles

loop0:
    

    movz w10, 0x2F, lsl 16 
    movk w10, 0x59A1, lsl 00
    sub x1, x16, 3
    add x2, x17, 1
    mov x3, 30
    mov x4, 30
    bl dibujar_elipse



    movz w10, 0xff, lsl 16 
    movk w10, 0xdf22, lsl 00

    mov x1, x16
    mov x2, x17
    mov x3, 30
    mov x4, 30
    bl dibujar_elipse


    bl delay
    add x16,x16,3
    sub x17,x17,1
    mov x5, 0
    cmp x17, x5 
    b.gt loop0

    movz w10, 0x2F, lsl 16 
    movk w10, 0x59A1, lsl 00
    sub x1, x16, 3
    add x2, x17, 1
    mov x3, 30
    mov x4, 30
    bl dibujar_elipse
loop1:

    movz w10, 0x2F, lsl 16 
    movk w10, 0x59A1, lsl 00
    sub x1, x16, 3
    sub x2, x17, 1
    mov x3, 30
    mov x4, 30
    bl dibujar_elipse



    movz w10, 0xff, lsl 16 
    movk w10, 0xdf22, lsl 00

    mov x1, x16
    mov x2, x17
    mov x3, 30
    mov x4, 30
    bl dibujar_elipse

    bl dibujar_nube
    bl delay
    

    add x16,x16,3
    add x17,x17,1
    mov x6, SCREEN_WIDTH
    sub x5, x6, 30
    cmp x16, x5
    b.lt loop1

    mov x16, 30
    mov x17, 100
    bl dibujar_cielo_noche
    bl dibujar_pasto_noche
    bl dibujar_arbol_0_noche

    bl dibujar_famaf_noche
    bl dibujar_letras_noche
    bl dibujar_arboles_noche


loopnoche1:

    movz w10, 0x02, lsl 16 
    movk w10, 0x0712, lsl 00
    sub x1, x16, 3
    add x2, x17, 1
    mov x3, 30
    mov x4, 30
    bl dibujar_elipse

    bl dibujar_estrellas
    bl dibujar_nube_noche

    movz w10, 0xFF, lsl 16 
    movk w10, 0xFFFF, lsl 00

    mov x1, x16
    mov x2, x17
    mov x3, 30
    mov x4, 30
    bl dibujar_elipse

    bl delay
    
    add x16,x16,3
    sub x17,x17,1
    mov x5, -7
    cmp x17, x5
    b.gt loopnoche1

    movz w10, 0x02, lsl 16 
    movk w10, 0x0712, lsl 00
    sub x1, x16, 3
    add x2, x17, 1
    mov x3, 30
    mov x4, 30
    bl dibujar_elipse

loopnoche2:
    
    movz w10, 0x02, lsl 16 
    movk w10, 0x0712, lsl 00
    sub x1, x16, 3
    sub x2, x17, 1
    mov x3, 30
    mov x4, 30
    bl dibujar_elipse

    bl dibujar_estrellas
    bl dibujar_nube_noche

    movz w10, 0xFF, lsl 16 
    movk w10, 0xFFFF, lsl 00

    mov x1, x16
    mov x2, x17
    mov x3, 30
    mov x4, 30
    bl dibujar_elipse

    bl delay
    
    add x16,x16,3
    add x17,x17,1
    mov x5, SCREEN_WIDTH
    cmp x16, x5
    b.lt loopnoche2

    bl total_loop

	// Ejemplo de uso de gpios
	mov x9, GPIO_BASE

	// Atención: se utilizan registros w porque la documentación de broadcom
	// indica que los registros que estamos leyendo y escribiendo son de 32 bits

	// Setea gpios 0 - 9 como lectura
	str wzr, [x9, GPIO_GPFSEL0]

	// Lee el estado de los GPIO 0 - 31
	ldr w10, [x9, GPIO_GPLEV0]

	// And bit a bit mantiene el resultado del bit 2 en w10
	and w11, w10, 0b10

	// w11 será 1 si había un 1 en la posición 2 de w10, si no será 0
	// efectivamente, su valor representará si GPIO 2 está activo
	lsr w11, w11, 1

	//---------------------------------------------------------------
	// Infinite Loop

InfLoop:
	b InfLoop
