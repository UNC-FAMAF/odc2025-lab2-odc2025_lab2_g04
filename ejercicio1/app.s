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

    // COLOR_EDIFICIO_BASE2 #8b8d81
    movz w10, 0x8b, lsl 16
    movk w10, 0x8d81, lsl 00

    mov x1, 73
    mov x2, 164
    mov x3, 273
    mov x4, 142
    mov x5, 262
    mov x6, 407
    mov x7, 50
    mov x8, 389
    bl dibujar_cuadrilatero
    
    // COLOR_EDIFICIO_SOMBRA4  #605E48 (la sombra del pilar que sobresale pero la de que mira para abajo)
    movz w10, 0x60, lsl 16
    movk w10, 0x5E48, lsl 00


    // COLOR_EDIFICIO_SOMBRA3 #868A89(la sombra del pilar que sobresale)
    movz w10, 0x86, lsl 16
    movk w10, 0x8A89, lsl 00

    //COLOR_EDIFICIO_SOMBRA5 #756d57
    movz w10, 0x75, lsl 16
    movk w10, 0x6d57, lsl 00    

    // Ventanas cerradas en EDIFICIO_BASE2 #9CAEC8(color de rejas 9caec8,segundo color de rejas #7a8393, color de la parte de abajo 4f565f)

    movz w10, 0x9C, lsl 16
    movk w10, 0xAEC8, lsl 00

    // COLOR_EDIFICIO_BASE #CFCFCE
    movz w10, 0xCF, lsl 16
    movk w10, 0xCFCE, lsl 00

    mov x1, 179
    mov x2, 81
    mov x3, 215
    mov x4, 97
    mov x5, 196
    mov x6, 412
    mov x7, 151
    mov x8, 414
    bl dibujar_cuadrilatero

    mov x1, 393
    mov x2, 211
    mov x3, 407
    mov x4, 184
    mov x5, 215
    mov x6, 97
    mov x7, 212
    mov x8, 140
    bl dibujar_cuadrilatero

    mov x1, 273
    mov x2, 164
    mov x3, 288
    mov x4, 170
    mov x5, 278
    mov x6, 406
    mov x7, 262
    mov x8, 407
    bl dibujar_cuadrilatero

    mov x1, 204
    mov x2, 276
    mov x3, 397
    mov x4, 309
    mov x5, 397
    mov x6, 338
    mov x7, 202
    mov x8, 313
    bl dibujar_cuadrilatero

    mov x1, 342
    mov x2, 191
    mov x3, 352
    mov x4, 195
    mov x5, 348
    mov x6, 398
    mov x7, 337
    mov x8, 399
    bl dibujar_cuadrilatero
    
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
