.data
.section .text

.equ SCREEN_WIDTH, 640
.equ SCREEN_HEIGH, 480

.globl dibujar_arbol_0
dibujar_arbol_0: 
    // Preservar registros que modificaremos
    stp x19, x30, [sp, -16]!

    // Tronco

    // COLOR_TRONCO #51291E
    movz w10, 0x51, lsl 16
    movk w10, 0x291E, lsl 00

    mov x1, 25
    mov x2, 376
    mov x3, 24
    mov x4, 300
    mov x5, 30
    mov x6, 376
    bl dibujar_triangulo

    // Hojas

    // COLOR_VERDE_OSCURO #344323
    movz w10, 0x34, lsl 16
    movk w10, 0x4323, lsl 00

    mov x1, 28
    mov x2, 300
    mov x3, 61
    mov x4, 70
    bl dibujar_elipse

done_dibujar_arbol_0:
    // Restaurar registros
    ldp x19, x30, [sp], 16

    ret  // Volver al llamador


.globl dibujar_arboles
dibujar_arboles:
    // Preservar registros que modificaremos
    stp x19, x30, [sp, -16]!    
    
    // =========== Arbol 1 ===========

    // Tronco

    // COLOR_TRONCO #51291E
    movz w10, 0x51, lsl 16
    movk w10, 0x291E, lsl 00

    mov x1, 234
    mov x2, 361
    mov x3, 233
    mov x4, 432
    mov x5, 239
    mov x6, 431
    bl dibujar_triangulo

    mov x1, 237
    mov x2, 334
    mov x3, 237
    mov x4, 401
    mov x5, 244
    mov x6, 337
    bl dibujar_triangulo

    mov x1, 243
    mov x2, 361
    mov x3, 241
    mov x4, 369
    mov x5, 266
    mov x6, 331
    bl dibujar_triangulo

    mov x1, 209
    mov x2, 329
    mov x3, 236
    mov x4, 348
    mov x5, 237
    mov x6, 345
    bl dibujar_triangulo

    // Hojas arbol 1

    // COLOR_VERDE_OSCURO #344323
    movz w10, 0x34, lsl 16
    movk w10, 0x4323, lsl 00

    mov x1, 260
    mov x2, 324
    mov x3, 54
    mov x4, 48
    bl dibujar_elipse
    
    mov x1, 216
    mov x2, 342
    mov x3, 35
    mov x4, 24
    bl dibujar_elipse

    // COLOR_VERDE #56703b
    movz w10, 0x56, lsl 16
    movk w10, 0x703b, lsl 00

    // dibujados de izquierda a derecha
    mov x1, 215
    mov x2, 306
    mov x3, 29
    mov x4, 20
    bl dibujar_elipse

    mov x1, 232
    mov x2, 285
    mov x3, 17
    mov x4, 18
    bl dibujar_elipse

    mov x1, 260
    mov x2, 273
    mov x3, 21
    mov x4, 19
    bl dibujar_elipse
    
    mov x1, 289
    mov x2, 291
    mov x3, 20
    mov x4, 19
    bl dibujar_elipse

    mov x1, 306
    mov x2, 321
    mov x3, 19
    mov x4, 19
    bl dibujar_elipse

    mov x1, 307
    mov x2, 355
    mov x3, 23
    mov x4, 21
    bl dibujar_elipse

    // Elipse centro derecha
    mov x1, 254
    mov x2, 322
    mov x3, 31
    mov x4, 14
    bl dibujar_elipse

    // Elipse centro izquierda
    mov x1, 232
    mov x2, 335
    mov x3, 14
    mov x4, 12
    bl dibujar_elipse

    // elipse abajo derecha
    mov x1, 265
    mov x2, 352
    mov x3, 13
    mov x4, 12
    bl dibujar_elipse

    // Elipse abajo izquierda
    mov x1, 200
    mov x2, 350
    mov x3, 13
    mov x4, 12
    bl dibujar_elipse

    // =========== Arbol 2 ===========

    // Tronco

    // COLOR_TRONCO #51291E
    movz w10, 0x51, lsl 16
    movk w10, 0x291E, lsl 00

    mov x1, 111
    mov x2, 361
    mov x3, 107
    mov x4, 432
    mov x5, 113
    mov x6, 431
    bl dibujar_triangulo

    mov x1, 111
    mov x2, 334
    mov x3, 111
    mov x4, 401
    mov x5, 118
    mov x6, 337
    bl dibujar_triangulo

    // Hojas arbol 2

    // COLOR_VERDE_OSCURO #344323
    movz w10, 0x34, lsl 16
    movk w10, 0x4323, lsl 00

    mov x1, 110
    mov x2, 324
    mov x3, 54
    mov x4, 48
    bl dibujar_elipse
    
    mov x1, 66
    mov x2, 352
    mov x3, 28
    mov x4, 24
    bl dibujar_elipse

    // COLOR_VERDE #56703b
    movz w10, 0x56, lsl 16
    movk w10, 0x703b, lsl 00

    mov x1, 110
    mov x2, 273
    mov x3, 21
    mov x4, 19
    bl dibujar_elipse
    
    mov x1, 139
    mov x2, 291
    mov x3, 20
    mov x4, 19
    bl dibujar_elipse

    mov x1, 156
    mov x2, 321
    mov x3, 19
    mov x4, 19
    bl dibujar_elipse

    mov x1, 157
    mov x2, 355
    mov x3, 23
    mov x4, 21
    bl dibujar_elipse

    mov x1, 104
    mov x2, 322
    mov x3, 31
    mov x4, 14
    bl dibujar_elipse

    mov x1, 120
    mov x2, 357
    mov x3, 13
    mov x4, 12
    bl dibujar_elipse

    mov x1, 82
    mov x2, 285
    mov x3, 17
    mov x4, 18
    bl dibujar_elipse

    mov x1, 65
    mov x2, 306
    mov x3, 17
    mov x4, 15
    bl dibujar_elipse
    
    mov x1, 82
    mov x2, 335
    mov x3, 14
    mov x4, 12
    bl dibujar_elipse

    // ============= Ramas ===============

    // Rama

    // COLOR_TRONCO #51291E
    movz w10, 0x51, lsl 16
    movk w10, 0x291E, lsl 00

    mov x1, 639
    mov x2, 370
    mov x3, 569
    mov x4, 347
    mov x5, 639
    mov x6, 367
    bl dibujar_triangulo

    mov x1, 592
    mov x2, 354
    mov x3, 549
    mov x4, 364
    mov x5, 595
    mov x6, 356
    bl dibujar_triangulo

    // Hojas


done_dibujar_arboles:
    // Restaurar registros
    ldp x19, x30, [sp], 16

    ret  // Volver al llamador
