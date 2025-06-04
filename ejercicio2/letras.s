.data
.section .text

.equ SCREEN_WIDTH, 640
.equ SCREEN_HEIGH, 480

.globl dibujar_letras
dibujar_letras:
    // Preservar registros que modificaremos
    stp x19, x30, [sp, -16]!

// =========== LETRA O ============

    // COLOR_EDIFICIO_BASE #CFCFCE
    movz w10, 0xCF, lsl 16
    movk w10, 0xCFCE, lsl 00

    mov x1, 403
    mov x2, 324
    mov x3, 5
    mov x4, 8
    bl dibujar_elipse

    // COLOR_CARTEL #7d8288
    movz w10, 0x7d, lsl 16
    movk w10, 0x8288, lsl 00

    mov x1, 403
    mov x2, 324
    mov x3, 2
    mov x4, 4
    bl dibujar_elipse

// =========== LETRA d ============

    // COLOR_EDIFICIO_BASE #CFCFCE
    movz w10, 0xCF, lsl 16
    movk w10, 0xCFCE, lsl 00

    mov x1, 413
    mov x2, 328
    mov x3, 3
    mov x4, 4
    bl dibujar_elipse

    mov x1, 415
    mov x2, 318
    mov x3, 416
    mov x4, 318
    mov x5, 416
    mov x6, 327
    mov x7, 415
    mov x8, 327
    bl dibujar_cuadrilatero

    // COLOR_CARTEL #7d8288
    movz w10, 0x7d, lsl 16
    movk w10, 0x8288, lsl 00

    mov x1, 413
    mov x2, 328
    mov x3, 1
    mov x4, 1
    bl dibujar_elipse

// =========== LETRA C ============

    // COLOR_EDIFICIO_BASE #CFCFCE
    movz w10, 0xCF, lsl 16
    movk w10, 0xCFCE, lsl 00

    mov x1, 423
    mov x2, 324
    mov x3, 5
    mov x4, 8
    bl dibujar_elipse

    // COLOR_CARTEL #7d8288
    movz w10, 0x7d, lsl 16
    movk w10, 0x8288, lsl 00

    mov x1, 423
    mov x2, 324
    mov x3, 2
    mov x4, 4
    bl dibujar_elipse

    mov x1, 425
    mov x2, 322
    mov x3, 428
    mov x4, 322
    mov x5, 428
    mov x6, 326
    mov x7, 425
    mov x8, 326
    bl dibujar_cuadrilatero

// =========== LETRA 2 ============

    // COLOR_EDIFICIO_BASE #CFCFCE
    movz w10, 0xCF, lsl 16
    movk w10, 0xCFCE, lsl 00

    mov x1, 434
    mov x2, 324
    mov x3, 4
    mov x4, 9
    bl dibujar_elipse

    mov x1, 431
    mov x2, 329
    mov x3, 437
    mov x4, 329
    mov x5, 437
    mov x6, 332
    mov x7, 431
    mov x8, 332
    bl dibujar_cuadrilatero

    // COLOR_CARTEL #7d8288
    movz w10, 0x7d, lsl 16
    movk w10, 0x8288, lsl 00

    mov x1, 434
    mov x2, 324
    mov x3, 1
    mov x4, 4
    bl dibujar_elipse

    mov x1, 430
    mov x2, 323
    mov x3, 438
    mov x4, 323
    mov x5, 438
    mov x6, 328
    mov x7, 430
    mov x8, 328
    bl dibujar_cuadrilatero

    // COLOR_EDIFICIO_BASE #CFCFCE
    movz w10, 0xCF, lsl 16
    movk w10, 0xCFCE, lsl 00

    mov x1, 435
    mov x2, 323
    mov x3, 437
    mov x4, 323
    mov x5, 434
    mov x6, 328
    mov x7, 431
    mov x8, 328
    bl dibujar_cuadrilatero

// =========== LETRA 0 ============

    // COLOR_EDIFICIO_BASE #CFCFCE
    movz w10, 0xCF, lsl 16
    movk w10, 0xCFCE, lsl 00

    mov x1, 444
    mov x2, 324
    mov x3, 4
    mov x4, 9
    bl dibujar_elipse

    // COLOR_CARTEL #7d8288
    movz w10, 0x7d, lsl 16
    movk w10, 0x8288, lsl 00

    mov x1, 444
    mov x2, 324
    mov x3, 1
    mov x4, 4
    bl dibujar_elipse

// =========== LETRA 2 ============

    // COLOR_EDIFICIO_BASE #CFCFCE
    movz w10, 0xCF, lsl 16
    movk w10, 0xCFCE, lsl 00

    mov x1, 454
    mov x2, 324
    mov x3, 4
    mov x4, 9
    bl dibujar_elipse

    mov x1, 451
    mov x2, 329
    mov x3, 457
    mov x4, 329
    mov x5, 457
    mov x6, 332
    mov x7, 451
    mov x8, 332
    bl dibujar_cuadrilatero

    // COLOR_CARTEL #7d8288
    movz w10, 0x7d, lsl 16
    movk w10, 0x8288, lsl 00

    mov x1, 454
    mov x2, 324
    mov x3, 1
    mov x4, 4
    bl dibujar_elipse

    mov x1, 450
    mov x2, 323
    mov x3, 458
    mov x4, 323
    mov x5, 458
    mov x6, 328
    mov x7, 450
    mov x8, 328
    bl dibujar_cuadrilatero

    // COLOR_EDIFICIO_BASE #CFCFCE
    movz w10, 0xCF, lsl 16
    movk w10, 0xCFCE, lsl 00

    mov x1, 455
    mov x2, 323
    mov x3, 457
    mov x4, 323
    mov x5, 454
    mov x6, 328
    mov x7, 451
    mov x8, 328
    bl dibujar_cuadrilatero

// =========== LETRA 5 ============

  // COLOR_EDIFICIO_BASE #CFCFCE
    movz w10, 0xCF, lsl 16
    movk w10, 0xCFCE, lsl 00

    mov x1, 464
    mov x2, 327
    mov x3, 4
    mov x4, 5
    bl dibujar_elipse

    mov x1, 461
    mov x2, 316
    mov x3, 467
    mov x4, 316
    mov x5, 467
    mov x6, 319
    mov x7, 461
    mov x8, 319
    bl dibujar_cuadrilatero

    mov x1, 461
    mov x2, 320
    mov x3, 462
    mov x4, 320
    mov x5, 462
    mov x6, 323
    mov x7, 461
    mov x8, 323
    bl dibujar_cuadrilatero

    // COLOR_CARTEL #7d8288
    movz w10, 0x7d, lsl 16
    movk w10, 0x8288, lsl 00

    mov x1, 464
    mov x2, 327
    mov x3, 2
    mov x4, 2
    bl dibujar_elipse

    mov x1, 460
    mov x2, 326
    mov x3, 462
    mov x4, 326
    mov x5, 462
    mov x6, 327
    mov x7, 460
    mov x8, 327
    bl dibujar_cuadrilatero

done_dibujar_letras:
    // Restaurar registros
    ldp x19, x30, [sp], 16

    ret  // Volver al llamador

 .globl dibujar_letras_noche
dibujar_letras_noche:
    // Preservar registros que modificaremos
    stp x19, x30, [sp, -16]!

// =========== LETRA O ============

    // COLOR_letras_noche #dabf62
    movz w10, 0xda, lsl 16
    movk w10, 0xbf62, lsl 00

    mov x1, 403
    mov x2, 324
    mov x3, 5
    mov x4, 8
    bl dibujar_elipse
    
    // COLOR_CARTEL_NOCHE #0b131c
    movz w10, 0x0b, lsl 16
    movk w10, 0x131c, lsl 00

    mov x1, 403
    mov x2, 324
    mov x3, 2
    mov x4, 4
    bl dibujar_elipse

// =========== LETRA d ============

    // COLOR_letras_noche #dabf62
    movz w10, 0xda, lsl 16
    movk w10, 0xbf62, lsl 00

    mov x1, 413
    mov x2, 328
    mov x3, 3
    mov x4, 4
    bl dibujar_elipse

    mov x1, 415
    mov x2, 318
    mov x3, 416
    mov x4, 318
    mov x5, 416
    mov x6, 327
    mov x7, 415
    mov x8, 327
    bl dibujar_cuadrilatero

    // COLOR_CARTEL_NOCHE #0b131c
    movz w10, 0x0b, lsl 16
    movk w10, 0x131c, lsl 00

    mov x1, 413
    mov x2, 328
    mov x3, 1
    mov x4, 1
    bl dibujar_elipse

// =========== LETRA C ============

    // COLOR_letras_noche #dabf62
    movz w10, 0xda, lsl 16
    movk w10, 0xbf62, lsl 00

    mov x1, 423
    mov x2, 324
    mov x3, 5
    mov x4, 8
    bl dibujar_elipse

    // COLOR_CARTEL_NOCHE #0b131c
    movz w10, 0x0b, lsl 16
    movk w10, 0x131c, lsl 00

    mov x1, 423
    mov x2, 324
    mov x3, 2
    mov x4, 4
    bl dibujar_elipse

    mov x1, 425
    mov x2, 322
    mov x3, 428
    mov x4, 322
    mov x5, 428
    mov x6, 326
    mov x7, 425
    mov x8, 326
    bl dibujar_cuadrilatero

// =========== LETRA 2 ============

    // COLOR_letras_noche #dabf62
    movz w10, 0xda, lsl 16
    movk w10, 0xbf62, lsl 00

    mov x1, 434
    mov x2, 324
    mov x3, 4
    mov x4, 9
    bl dibujar_elipse

    mov x1, 431
    mov x2, 329
    mov x3, 437
    mov x4, 329
    mov x5, 437
    mov x6, 332
    mov x7, 431
    mov x8, 332
    bl dibujar_cuadrilatero

    // COLOR_CARTEL_NOCHE #0b131c
    movz w10, 0x0b, lsl 16
    movk w10, 0x131c, lsl 00

    mov x1, 434
    mov x2, 324
    mov x3, 1
    mov x4, 4
    bl dibujar_elipse

    mov x1, 430
    mov x2, 323
    mov x3, 438
    mov x4, 323
    mov x5, 438
    mov x6, 328
    mov x7, 430
    mov x8, 328
    bl dibujar_cuadrilatero

    // COLOR_letras_noche #dabf62
    movz w10, 0xda, lsl 16
    movk w10, 0xbf62, lsl 00

    mov x1, 435
    mov x2, 323
    mov x3, 437
    mov x4, 323
    mov x5, 434
    mov x6, 328
    mov x7, 431
    mov x8, 328
    bl dibujar_cuadrilatero

// =========== LETRA 0 ============

    // COLOR_letras_noche #dabf62
    movz w10, 0xda, lsl 16
    movk w10, 0xbf62, lsl 00

    mov x1, 444
    mov x2, 324
    mov x3, 4
    mov x4, 9
    bl dibujar_elipse

    // COLOR_CARTEL_NOCHE #0b131c
    movz w10, 0x0b, lsl 16
    movk w10, 0x131c, lsl 00

    mov x1, 444
    mov x2, 324
    mov x3, 1
    mov x4, 4
    bl dibujar_elipse

// =========== LETRA 2 ============

    // COLOR_letras_noche #dabf62
    movz w10, 0xda, lsl 16
    movk w10, 0xbf62, lsl 00

    mov x1, 454
    mov x2, 324
    mov x3, 4
    mov x4, 9
    bl dibujar_elipse

    mov x1, 451
    mov x2, 329
    mov x3, 457
    mov x4, 329
    mov x5, 457
    mov x6, 332
    mov x7, 451
    mov x8, 332
    bl dibujar_cuadrilatero

    // COLOR_CARTEL_NOCHE #0b131c
    movz w10, 0x0b, lsl 16
    movk w10, 0x131c, lsl 00


    mov x1, 454
    mov x2, 324
    mov x3, 1
    mov x4, 4
    bl dibujar_elipse

    mov x1, 450
    mov x2, 323
    mov x3, 458
    mov x4, 323
    mov x5, 458
    mov x6, 328
    mov x7, 450
    mov x8, 328
    bl dibujar_cuadrilatero

    // COLOR_letras_noche #dabf62
    movz w10, 0xda, lsl 16
    movk w10, 0xbf62, lsl 00

    mov x1, 455
    mov x2, 323
    mov x3, 457
    mov x4, 323
    mov x5, 454
    mov x6, 328
    mov x7, 451
    mov x8, 328
    bl dibujar_cuadrilatero

// =========== LETRA 5 ============

    // COLOR_letras_noche #dabf62
    movz w10, 0xda, lsl 16
    movk w10, 0xbf62, lsl 00

    mov x1, 464
    mov x2, 327
    mov x3, 4
    mov x4, 5
    bl dibujar_elipse

    mov x1, 461
    mov x2, 316
    mov x3, 467
    mov x4, 316
    mov x5, 467
    mov x6, 319
    mov x7, 461
    mov x8, 319
    bl dibujar_cuadrilatero

    mov x1, 461
    mov x2, 320
    mov x3, 462
    mov x4, 320
    mov x5, 462
    mov x6, 323
    mov x7, 461
    mov x8, 323
    bl dibujar_cuadrilatero

    // COLOR_CARTEL_NOCHE #0b131c
    movz w10, 0x0b, lsl 16
    movk w10, 0x131c, lsl 00

    mov x1, 464
    mov x2, 327
    mov x3, 2
    mov x4, 2
    bl dibujar_elipse

    mov x1, 460
    mov x2, 326
    mov x3, 462
    mov x4, 326
    mov x5, 462
    mov x6, 327
    mov x7, 460
    mov x8, 327
    bl dibujar_cuadrilatero

done_dibujar_letras_noche:
    // Restaurar registros
    ldp x19, x30, [sp], 16

    ret  // Volver al llamador

 