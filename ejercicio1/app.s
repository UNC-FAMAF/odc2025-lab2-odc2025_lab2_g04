	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGH, 		480
	.equ BITS_PER_PIXEL,  	32

	.equ GPIO_BASE,      0x3f200000
	.equ GPIO_GPFSEL0,   0x00
	.equ GPIO_GPLEV0,    0x34

	.globl main

main:
	// x0 contiene la direccion base del framebuffer
 	mov x20, x0	// Guarda la dirección base del framebuffer en x20
	//---------------- CODE HERE ------------------------------------

	movz x10, 0xdb, lsl 16
	movk x10, 0xe2e8, lsl 00
	mov x11, SCREEN_WIDTH
	mov x12, SCREEN_HEIGH

	mov x1, #0      // Y Size
loop1:
	mov x2, #0			// X Size
loop0:
	mul x13, x1, x11			// X13 = Y * N
	add x13, x13, x2			// X13 = (i * N) + j
	lsl x13, x13, 2				// X13 = ((i * N ) + j) * 4
	add x13, x13, x20			// X13 = &vc[0][0] + ((i * N ) + j) * 8
	stur w10,[x13]  			// vc[i][j] = x10
	add x2, x2, 1					// x++
	cmp x2, SCREEN_WIDTH 	
	b.le loop0						// Si no terminó la fila, salto
	add x1, x1, 1					// y++
	cmp x1, SCREEN_HEIGH
	b.le loop1						// Si no es la última fila, salto

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
