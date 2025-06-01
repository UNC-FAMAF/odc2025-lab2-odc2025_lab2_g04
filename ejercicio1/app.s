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

    // COLOR_CIELO #2F59A1
    movz w10, 0x2F, lsl 16 
    movk w10, 0x59A1, lsl 00

    mov x1, 0
    mov x2, 0
    mov x3, 640
    mov x4, 340
    bl dibujar_rectangulo_relleno

    // COLOR_PASTO #56703b
    movz w10, 0x56, lsl 16
    movk w10, 0x703b, lsl 00

    mov x1, 0
    mov x2, 340
    mov x3, 640
    mov x4, 480
    bl dibujar_rectangulo_relleno

    // =========== Arboles de Fondo ============

    // COLOR_TRONCO #51291E
    movz w10, 0x51, lsl 16
    movk w10, 0x291E, lsl 00

    // Tronco Fondo 1
    mov x1, 25
    mov x2, 376
    mov x3, 24
    mov x4, 300
    mov x5, 30
    mov x6, 376
    bl dibujar_triangulo

    // COLOR_VERDE_OSCURO #344323
    movz w10, 0x34, lsl 16
    movk w10, 0x4323, lsl 00
    
    // Hojas Fondo 1
    mov x1, 28
    mov x2, 300
    mov x3, 61
    mov x4, 70
    bl dibujar_elipse

    // =========== FAMAF =======================

    bl dibujar_famaf

    // ============= DIBUJAR ARBOLES ================

    // Dibujar Troncos
    // COLOR_TRONCO #51291E
    movz w10, 0x51, lsl 16
    movk w10, 0x291E, lsl 00

    // Arbol 1

    mov x1, 271
    mov x2, 361
    mov x3, 267
    mov x4, 432
    mov x5, 273
    mov x6, 431
    bl dibujar_triangulo

    mov x1, 271
    mov x2, 334
    mov x3, 271
    mov x4, 401
    mov x5, 278
    mov x6, 337
    bl dibujar_triangulo

    mov x1, 277
    mov x2, 361
    mov x3, 275
    mov x4, 369
    mov x5, 300
    mov x6, 331
    bl dibujar_triangulo

    mov x1, 243
    mov x2, 329
    mov x3, 270
    mov x4, 348
    mov x5, 271
    mov x6, 345
    bl dibujar_triangulo

    // Arbol 2

    mov x1, 271
    mov x2, 361
    mov x3, 267
    mov x4, 432
    mov x5, 273
    mov x6, 431
    bl dibujar_triangulo

    mov x1, 271
    mov x2, 334
    mov x3, 271
    mov x4, 401
    mov x5, 278
    mov x6, 337
    bl dibujar_triangulo


    // COLOR #605E48
    movz w10, 0x60, lsl 16
    movk w10, 0x5E48, lsl 00

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
