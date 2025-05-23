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

    // COLOR_EDIFICIO_SOMBRA4 (la sombra del pilar que sobresale pero la de que mira para abajo)
    movz w10, 0x60, lsl 16
    movk w10, 0x5E48, lsl 00

    mov x1, 198
    mov x2, 132
    mov x3, 274
    mov x4, 163
    mov x5, 8
    bl dibujar_lineas_repetidasy

    mov x1,288
    mov x2,170
    mov x3,342
    mov x4,192
    mov x5,6
    bl dibujar_lineas_repetidasy

    mov x1,351
    mov x2,194
    mov x3,392
    mov x4,211
    mov x5,6
    bl dibujar_lineas_repetidasy

    // COLOR_EDIFICIO_SOMBRA3 (la sombra del pilar que sobresale)
    movz w10, 0x86, lsl 16
    movk w10, 0x8A89, lsl 00

    mov x1,169
    mov x2,84
    mov x3,142
    mov x4,403
    mov x5,10
    bl dibujar_lineas_repetidasx

    mov x1,168
    mov x2,84
    mov x3,176
    mov x4,81
    mov x5,8

    bl dibujar_lineas_repetidasy

    mov x1,263
    mov x2,166
    mov x3,251
    mov x4,402
    mov x5,11

    bl dibujar_lineas_repetidasx

    mov x1,337
    mov x2,192
    mov x3,331
    mov x4,395
    mov x5,4
    bl dibujar_lineas_repetidasx

    // COLOR_EDIFICIO_BASE
    movz w10, 0xCF, lsl 16
    movk w10, 0xCFCE, lsl 00



    mov x1,152
    mov x2,403
    mov x3,177
    mov x4,96
    mov x5,35

    bl dibujar_lineas_repetidasx

    mov x1,208
    mov x2,94
    mov x3,406
    mov x4,180
    mov x5,42
    bl dibujar_lineas_repetidasy

    mov x1,179
    mov x2,81
    mov x3,212
    mov x4,96
    mov x5,40
    bl dibujar_lineas_repetidasy

    mov x1,177
    mov x2,96
    mov x3,178
    mov x4,81
    mov x5,35

    bl dibujar_lineas_repetidasy

    mov x1,273
    mov x2,163
    mov x3,261
    mov x4,402

    bl dibujar_lineas_repetidasx

    mov x1, 163
    mov x2, 267
    mov x3, 395
    mov x4, 309
    mov x5, 31

    bl dibujar_lineas_repetidasy

    mov x1, 341
    mov x2, 192
    mov x3, 335
    mov x4, 395
    mov x5, 10
    bl dibujar_lineas_repetidasx

    mov x1, 278
    mov x2, 378
    mov x3, 330
    mov x4, 378
    mov x5, 18
    bl dibujar_lineas_repetidasy

    movz w10, 0x60, lsl 16
    movk w10, 0x5E48, lsl 00

    mov x1,337
    mov x2,192
    mov x3,331
    mov x4,395
    mov x5,4
    bl dibujar_lineas_repetidasx

    mov x1,351
    mov x2,199
    mov x3,394
    mov x4,216
    mov x5,5
    bl dibujar_lineas_repetidasy


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
