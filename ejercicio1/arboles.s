.data
    array_p0_p1: .space 1280  // Reserva 640 * 2 = 1280 bytes para el arreglo
    array_p1_p2: .space 1280  // Reserva 640 * 2 = 1280 bytes para el arreglo
    array_p0_p2: .space 1280  // Reserva 640 * 2 = 1280 bytes para el arreglo
    array_p0_p1_p2: .space 1280  // Reserva 640 * 2 = 1280 bytes para el arreglo

.section .text

.equ SCREEN_WIDTH, 640
.equ SCREEN_HEIGH, 480

.globl dibujar_arboles
dibujar_arboles:
    // Preservar registros que modificaremos
    stp x19, x30, [sp, -16]!    
    // Dibujar Troncos
    // COLOR_TRONCO #51291E
    movz w10, 0x51, lsl 16
    movk w10, 0x291E, lsl 00

    // Arbol 1

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

    // Arbol 2

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

done_dibujar_arboles:
    // Restaurar registros
    ldp x19, x30, [sp], 16

    ret  // Volver al llamador
