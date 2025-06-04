.section .text

.globl dibujar_cielo
dibujar_cielo:    
    stp x29, x30, [sp, -16]!
    // COLOR_CIELO #2F59A1
    movz w10, 0x2F, lsl 16 
    movk w10, 0x59A1, lsl 00
    mov x1, 0
    mov x2, 0
    mov x3, 640
    mov x4, 340
    bl dibujar_rectangulo_relleno
    ldp x19, x30, [sp], 16
    ret

.globl dibujar_cielo_noche
dibujar_cielo_noche:    
    stp x29, x30, [sp, -16]!
    // COLOR_CIELO_NOCHE #020712
    movz w10, 0x02, lsl 16 
    movk w10, 0x0712, lsl 00
    mov x1, 0
    mov x2, 0
    mov x3, 640
    mov x4, 340
    bl dibujar_rectangulo_relleno
    ldp x19, x30, [sp], 16
    ret
.globl dibujar_estrellas
dibujar_estrellas:
    stp x29, x30, [sp, -16]!
    // COLOR_CIELO_ESTRELLA #3b4c5d
    movz w10, 0x3B, lsl 16 
    movk w10, 0x4C5D, lsl 00
    mov x1, 30
    mov x2, 40
    mov x3, 2
    mov x4, 3
    bl dibujar_elipse
    mov x1, 300
    mov x2, 100
    mov x3, 2
    mov x4, 3
    bl dibujar_elipse
    mov x1, 500
    mov x2, 80
    mov x3, 2
    mov x4, 3
    bl dibujar_elipse
    mov x1, 390
    mov x2, 120
    mov x3, 2
    mov x4, 3
    bl dibujar_elipse
    mov x1, 130
    mov x2, 20
    mov x3, 3
    mov x4, 2
    bl dibujar_elipse
    mov x1, 280
    mov x2, 40
    mov x3, 3
    mov x4, 2
    bl dibujar_elipse
    mov x1, 600
    mov x2, 65
    mov x3, 3
    mov x4, 2
    bl dibujar_elipse

    mov x1, 140
    mov x2, 100
    mov x3, 2
    mov x4, 3
    bl dibujar_elipse

    mov x1, 240
    mov x2, 70
    mov x3, 3
    mov x4, 2
    bl dibujar_elipse

    mov x1, 200
    mov x2, 20
    mov x3, 10
    mov x4, 3
    bl dibujar_elipse

    mov x1, 250
    mov x2, 100
    mov x3, 2
    mov x4, 2
    bl dibujar_elipse

    mov x1, 400
    mov x2, 30
    mov x3, 3
    mov x4, 2
    bl dibujar_elipse

    movz w10, 0x3B, lsl 16 
    movk w10, 0x4C5D, lsl 00

    mov x1, 300
    mov x2, 79
    mov x3, 330
    mov x4, 42
    mov x5, 332
    mov x6, 52
    bl dibujar_triangulo

    //##d1b971
    movz w10, 0x3b, lsl 16 
    movk w10, 0x4c5d, lsl 00

    mov x1, 300
    mov x2, 79
    mov x3, 4
    mov x4, 4
    bl dibujar_elipse

    //
    movz w10, 0x02, lsl 16 
    movk w10, 0x0712, lsl 00
    
    mov x1, 313
    mov x2, 66
    mov x3, 330
    mov x4, 44
    mov x5, 332
    mov x6, 52
    bl dibujar_triangulo


    ldp x19, x30, [sp], 16
    ret

.globl dibujar_pasto
dibujar_pasto:
    stp x29, x30, [sp, -16]!
    // COLOR_PASTO #56703b
    movz w10, 0x56, lsl 16
    movk w10, 0x703b, lsl 00

    mov x1, 0
    mov x2, 340
    mov x3, 640
    mov x4, 480
    bl dibujar_rectangulo_relleno
    ldp x19, x30, [sp], 16
    ret    


.globl dibujar_pasto_noche
dibujar_pasto_noche:
    stp x29, x30, [sp, -16]!
    // COLOR_PASTO_NOCHE #1a2212, #090b06
    movz w10, 0x1a, lsl 16
    movk w10, 0x2212, lsl 00

    mov x1, 0
    mov x2, 340
    mov x3, 640
    mov x4, 480
    bl dibujar_rectangulo_relleno
    ldp x19, x30, [sp], 16
    ret    
