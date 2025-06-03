.data
.section .text

.equ SCREEN_WIDTH, 640
.equ SCREEN_HEIGH, 480

.globl dibujar_nube
dibujar_nube: 
    // Preservar registros que modificaremos
    stp x19, x30, [sp, -16]!

    // COLOR_EDIFICIO_SOMBRA3 #a8a7ac
    movz w10, 0xa8, lsl 16
    movk w10, 0xa7ac, lsl 00

    mov x1, 394
    mov x2, 82
    mov x3, 38
    mov x4, 23
    bl dibujar_elipse
    
    mov x1, 426
    mov x2, 86
    mov x3, 20
    mov x4, 22
    bl dibujar_elipse

    mov x1, 359
    mov x2, 87
    mov x3, 23
    mov x4, 16
    bl dibujar_elipse

    // COLOR_EDIFICIO_BASE #CFCFCE
    movz w10, 0xCF, lsl 16
    movk w10, 0xCFCE, lsl 00

    mov x1, 401
    mov x2, 54
    mov x3, 19
    mov x4, 15
    bl dibujar_elipse

    mov x1, 417
    mov x2, 70
    mov x3, 25
    mov x4, 19
    bl dibujar_elipse

    mov x1, 445
    mov x2, 86
    mov x3, 15
    mov x4, 13
    bl dibujar_elipse
    
    mov x1, 380
    mov x2, 58
    mov x3, 19
    mov x4, 13
    bl dibujar_elipse

    mov x1, 358
    mov x2, 73
    mov x3, 19
    mov x4, 14
    bl dibujar_elipse

done_dibujar_nube:
    // Restaurar registros
    ldp x19, x30, [sp], 16

    ret  // Volver al llamador
