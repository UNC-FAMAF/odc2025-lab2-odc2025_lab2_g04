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

    // COLOR_PISO #b1a8a8
    movz w10, 0xb1, lsl 16
    movk w10, 0xa8a8, lsl 00

    mov x1, 0
    mov x2, 480
    mov x3, 204
    mov x4, 480
    mov x5, 407
    mov x6, 425
    mov x7, 344
    mov x8, 419
    bl dibujar_cuadrilatero

    mov x1, 407
    mov x2, 425
    mov x3, 19
    mov x4, 389
    mov x5, 451
    mov x6, 354
    mov x7, 556
    mov x8, 379
    bl dibujar_cuadrilatero

    // COLOR_EDIFICIO_BASE #CFCFCE
    movz w10, 0xCF, lsl 16
    movk w10, 0xCFCE, lsl 00

    mov x1, 288
    mov x2, 177
    mov x3, 390
    mov x4, 213
    mov x5, 387
    mov x6, 397
    mov x7, 278
    mov x8, 403
    bl dibujar_cuadrilatero

    mov x1, 538
    mov x2, 177
    mov x3, 548
    mov x4, 238
    mov x5, 551
    mov x6, 401
    mov x7, 543
    mov x8, 409
    bl dibujar_cuadrilatero


    mov x1, 401
    mov x2, 339
    mov x3, 401
    mov x4, 397
    mov x5, 444
    mov x6, 396
    mov x7, 443
    mov x8, 343
    bl dibujar_cuadrilatero

    // COLOR_EDIFICIO_SOMBRA3 #a8a7ac(la sombra del pilar que sobresale)
    movz w10, 0xa8, lsl 16
    movk w10, 0xa7ac, lsl 00

    mov x1, 469
    mov x2, 181
    mov x3, 538
    mov x4, 177
    mov x5, 543
    mov x6, 409
    mov x7, 471
    mov x8, 407
    bl dibujar_cuadrilatero

    mov x1, 548
    mov x2, 238
    mov x3, 640
    mov x4, 230
    mov x5, 640
    mov x6, 400
    mov x7, 551
    mov x8, 397
    bl dibujar_cuadrilatero

    // COLOR_ventanas #314259
    movz w10, 0x31, lsl 16
    movk w10, 0x4259, lsl 00

    mov x1, 288
    mov x2, 177
    mov x3, 390
    mov x4, 213
    mov x5, 390
    mov x6, 240
    mov x7, 287
    mov x8, 209
    bl dibujar_cuadrilatero

    mov x1, 284
    mov x2, 254
    mov x3, 389
    mov x4, 279
    mov x5, 388
    mov x6, 307
    mov x7, 283
    mov x8, 289
    bl dibujar_cuadrilatero

    mov x1, 279
    mov x2, 378
    mov x3, 431
    mov x4, 381
    mov x5, 431
    mov x6, 352
    mov x7, 281
    mov x8, 334
    bl dibujar_cuadrilatero

    mov x1, 548
    mov x2, 260
    mov x3, 640
    mov x4, 254
    mov x5, 640
    mov x6, 283
    mov x7, 549
    mov x8, 288
    bl dibujar_cuadrilatero

    mov x1, 549
    mov x2, 308
    mov x3, 640
    mov x4, 309
    mov x5, 640
    mov x6, 334
    mov x7, 550
    mov x8, 333
    bl dibujar_cuadrilatero

    mov x1, 550
    mov x2, 357
    mov x3, 640
    mov x4, 357
    mov x5, 640
    mov x6, 383
    mov x7, 551
    mov x8, 382
    bl dibujar_cuadrilatero

    mov x1, 489
    mov x2, 207
    mov x3, 489
    mov x4, 238
    mov x5, 522
    mov x6, 237
    mov x7, 522
    mov x8, 205
    bl dibujar_cuadrilatero

    mov x1, 489
    mov x2, 276
    mov x3, 489
    mov x4, 309
    mov x5, 523
    mov x6, 309
    mov x7, 523
    mov x8, 276
    bl dibujar_cuadrilatero
   
    mov x1, 489
    mov x2, 348
    mov x3, 489
    mov x4, 383
    mov x5, 524
    mov x6, 383
    mov x7, 524
    mov x8, 348
    bl dibujar_cuadrilatero

    mov x1, 404
    mov x2, 212
    mov x3, 404
    mov x4, 242
    mov x5, 468
    mov x6, 240
    mov x7, 468
    mov x8, 208
    bl dibujar_cuadrilatero

    mov x1, 404
    mov x2, 280
    mov x3, 404
    mov x4, 309
    mov x5, 469
    mov x6, 309
    mov x7, 469
    mov x8, 280
    bl dibujar_cuadrilatero
    
    mov x1, 443
    mov x2, 343
    mov x3, 469
    mov x4, 343
    mov x5, 470
    mov x6, 397
    mov x7, 444
    mov x8, 396
    bl dibujar_cuadrilatero

    // COLOR_EDIFICIO_BASE #CFCFCE
    movz w10, 0xCF, lsl 16
    movk w10, 0xCFCE, lsl 00

    mov x1, 395
    mov x2, 213
    mov x3, 404
    mov x4, 212
    mov x5, 401
    mov x6, 397
    mov x7, 392
    mov x8, 397
    bl dibujar_cuadrilatero

    // COLOR_EDIFICIO_BASE2 #a8a7a0
    movz w10, 0xa8, lsl 16
    movk w10, 0xa7a0, lsl 00

    mov x1, 442
    mov x2, 363
    mov x3, 443
    mov x4, 396
    mov x5, 447
    mov x6, 396
    mov x7, 447
    mov x8, 363
    bl dibujar_cuadrilatero

    mov x1, 446
    mov x2, 363
    mov x3, 446
    mov x4, 366
    mov x5, 470
    mov x6, 366
    mov x7, 470
    mov x8, 363
    bl dibujar_cuadrilatero

    mov x1, 447
    mov x2, 391
    mov x3, 447
    mov x4, 396
    mov x5, 470
    mov x6, 397
    mov x7, 470
    mov x8, 392
    bl dibujar_cuadrilatero

    mov x1, 461
    mov x2, 366
    mov x3, 461
    mov x4, 391
    mov x5, 466
    mov x6, 392
    mov x7, 466
    mov x8, 366
    bl dibujar_cuadrilatero

    // COLOR_EDIFICIO_BASE2 #a8a7a0
    movz w10, 0xa8, lsl 16
    movk w10, 0xa7a0, lsl 00

    mov x1, 73
    mov x2, 164
    mov x3, 273
    mov x4, 142
    mov x5, 262
    mov x6, 407
    mov x7, 50
    mov x8, 389
    bl dibujar_cuadrilatero

    
    // COLOR_CARTEL #7d8288
    movz w10, 0x7d, lsl 16
    movk w10, 0x8288, lsl 00

    mov x1, 397
    mov x2, 310
    mov x3, 397
    mov x4, 338
    mov x5, 469
    mov x6, 338
    mov x7, 469
    mov x8, 310
    bl dibujar_cuadrilatero
    
    // COLOR_EDIFICIO_SOMBRA4  #5d5f5e (la sombra del pilar que sobresale pero la de que mira para abajo)
    movz w10, 0x5d, lsl 16
    movk w10, 0x5f5e, lsl 00

    mov x1, 212
    mov x2, 140
    mov x3, 212
    mov x4, 147
    mov x5, 386
    mov x6, 213
    mov x7, 395
    mov x8, 213
    bl dibujar_cuadrilatero

    mov x1, 402
    mov x2, 339
    mov x3, 432
    mov x4, 342
    mov x5, 469
    mov x6, 342
    mov x7, 469
    mov x8, 339
    bl dibujar_cuadrilatero

    // COLOR_EDIFICIO_SOMBRA3 #a8a7ac(la sombra del pilar que sobresale)
    movz w10, 0xa8, lsl 16
    movk w10, 0xa7ac, lsl 00

    mov x1, 179
    mov x2, 81
    mov x3, 169
    mov x4, 84
    mov x5, 142
    mov x6, 412
    mov x7, 151
    mov x8, 414
    bl dibujar_cuadrilatero

    mov x1, 274
    mov x2, 164
    mov x3, 263
    mov x4, 166
    mov x5, 251
    mov x6, 406
    mov x7, 262
    mov x8, 407
    bl dibujar_cuadrilatero

    mov x1, 342
    mov x2, 191
    mov x3, 336
    mov x4, 194
    mov x5, 330
    mov x6, 399
    mov x7, 337
    mov x8, 399
    bl dibujar_cuadrilatero

    mov x1, 395
    mov x2, 213
    mov x3, 390
    mov x4, 213
    mov x5, 387
    mov x6, 397
    mov x7, 392
    mov x8, 397
    bl dibujar_cuadrilatero

    mov x1, 432
    mov x2, 343
    mov x3, 437
    mov x4, 343
    mov x5, 437
    mov x6, 396
    mov x7, 432
    mov x8, 396
    bl dibujar_cuadrilatero

    mov x1, 586
    mov x2, 235
    mov x3, 592
    mov x4, 234
    mov x5, 596
    mov x6, 399
    mov x7, 591
    mov x8, 398
    bl dibujar_cuadrilatero

    //COLOR_EDIFICIO_SOMBRA5 #756d57
    movz w10, 0x75, lsl 16
    movk w10, 0x6d57, lsl 00    

    // COLOR_ventanas #314259
    movz w10, 0x31, lsl 16
    movk w10, 0x4259, lsl 00

    mov x1, 85
    mov x2, 185
    mov x3, 109
    mov x4, 183
    mov x5, 106
    mov x6, 215
    mov x7, 82
    mov x8, 216
    bl dibujar_cuadrilatero

    mov x1, 121
    mov x2, 181
    mov x3, 147
    mov x4, 179
    mov x5, 145
    mov x6, 214
    mov x7, 118
    mov x8, 215
    bl dibujar_cuadrilatero

    mov x1, 77
    mov x2, 255
    mov x3, 102
    mov x4, 255
    mov x5, 99
    mov x6, 289
    mov x7, 74
    mov x8, 289
    bl dibujar_cuadrilatero

    mov x1, 115
    mov x2, 254
    mov x3, 140
    mov x4, 254
    mov x5, 137
    mov x6, 289
    mov x7, 112
    mov x8, 289
    bl dibujar_cuadrilatero

    mov x1, 210
    mov x2, 174
    mov x3, 231
    mov x4, 172
    mov x5, 229
    mov x6, 208
    mov x7, 208
    mov x8, 209
    bl dibujar_cuadrilatero

    mov x1, 205
    mov x2, 251
    mov x3, 226
    mov x4, 251
    mov x5, 225
    mov x6, 279
    mov x7, 204
    mov x8, 275
    bl dibujar_cuadrilatero

    mov x1, 246
    mov x2, 172
    mov x3, 262
    mov x4, 172
    mov x5, 256
    mov x6, 284
    mov x7, 241
    mov x8, 281
    bl dibujar_cuadrilatero

    mov x1, 234
    mov x2, 332
    mov x3, 254
    mov x4, 332
    mov x5, 252
    mov x6, 390
    mov x7, 232
    mov x8, 390
    bl dibujar_cuadrilatero

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

    mov x1, 244
    mov x2, 207
    mov x3, 260
    mov x4, 207
    mov x5, 258
    mov x6, 252
    mov x7, 242
    mov x8, 252
    bl dibujar_cuadrilatero

    // COLOR_EDIFICIO_SOMBRA3 #a8a7ac(la sombra del pilar que sobresale)
    movz w10, 0xa8, lsl 16
    movk w10, 0xa7ac, lsl 00
    
    mov x1, 394
    mov x2, 185
    mov x3, 394
    mov x4, 191
    mov x5, 539
    mov x6, 182
    mov x7, 538
    mov x8, 177
    bl dibujar_cuadrilatero

    // COLOR_EDIFICIO_BASE2 #a8a7a0
    movz w10, 0xa8, lsl 16
    movk w10, 0xa7a0, lsl 00

    mov x1, 404
    mov x2, 242
    mov x3, 404
    mov x4, 280
    mov x5, 469
    mov x6, 279
    mov x7, 469
    mov x8, 240
    bl dibujar_cuadrilatero

    // COLOR_EDIFICIO_SOMBRA4  #5d5f5e (la sombra del pilar que sobresale pero la de que mira para abajo)
    movz w10, 0x5d, lsl 16
    movk w10, 0x5f5e, lsl 00

    mov x1, 389
    mov x2, 192
    mov x3, 395
    mov x4, 213
    mov x5, 539
    mov x6, 204
    mov x7, 546
    mov x8, 183
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
