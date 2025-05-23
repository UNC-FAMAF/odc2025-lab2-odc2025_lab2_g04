.section .text

.equ SCREEN_WIDTH, 640
.equ SCREEN_HEIGH, 480

/* Funcion para Dibujar un pixel*/
.globl pintar_pixel 
pintar_pixel:
    // Preservar registros que modificaremos
    stp x19, x20, [sp, -16]!
    
    // x0 = dirección base del framebuffer (se preserva)
    // x1 = coordenada x (no necesita preservarse)
    // x2 = coordenada y (no necesita preservarse)
    // w5 = color (no necesita preservarse)
    
    MOV X19, SCREEN_WIDTH              // x19 = SCREEN_WIDTH = 640
    MUL X19, X2, X19                   // x19 = y * 640 = y * SCREEN_WIDTH
    ADD X19, X1, X19                   // x19 = x + y * 640
    LSL X19, X19, #2                   // x19 = [4 * (x + (y * 640))]
    ADD X19, X0, X19                   // X19 = Dirección base + offset
    STR W10, [X19]                      // Colorea el pixel
    
    // Restaurar registros
    ldp x19, x20, [sp], 16
    ret

/* Dibujar una linea de punto x1,y1 hasta x2,y2, utilizando el algoritmo de Bresenham
Parametros
x0 = dirección base del framebuffer
x1 = x_inicio
x2 = y_inicio
x3 = x_fin
x4 = y_fin
*/
.globl dibujar_linea
dibujar_linea:
    // 1. Preservar registros
    stp x19, x20, [sp, -16]!
    stp x21, x22, [sp, -16]!
    stp x23, x24, [sp, -16]!
    stp x25, x26, [sp, -16]!
    stp x27, x30, [sp, -16]!  // Guardar también LR (x30)
    
    // 2. Guardar parámetros en registros preservados
    mov x19, x0                // Dirección base del framebuffer
    mov x20, x1                // x0 (x_inicio)
    mov x21, x2                // y0 (y_inicio)
    mov x22, x3                // x1 (x_fin)
    mov x23, x4                // y1 (y_fin)
    // w5 ya contiene el color

//dx = Diferencia absoluta entre las x y dy = Diferencia absoluta entra las y

    // 3. Calcular dx = abs(x1 - x0)
    sub x6, x22, x20           // dx = x1 - x0
    cmp x6, 0
    b.ge dx_positive
    neg x6, x6                 // dx = abs(dx)
dx_positive:             
    
    // 4. Calcular dy = abs(y1 - y0)
    sub x7, x23, x21           // dy = y1 - y0
    cmp x7, 0
    b.ge dy_positive
    neg x7, x7                 // dy = abs(dy)
dy_positive:
    
    // 5. Determinar en que dirección X se debe mover(sx)
    mov x24, 1                 // sx = 1 (por defecto a la derecha)
    cmp x22, x20
    b.ge sx_done
    mov x24, -1                // sx = -1 si x1 < x0 (a la izquierda)
sx_done:
    
    // 6. Determinar en que dirección Y se debe mover (sy)
    mov x25, 1                 // sy = 1 (por defecto sube)
    cmp x23, x21
    b.ge sy_done
    mov x25, -1                // sy = -1 si y1 < y0 (baja)
sy_done:
    
    // 7. Inicializar error
    mov x26, x6                // err = dx
    sub x26, x26, x7           // err = dx - dy
    
    // 8. Bucle principal
line_loop:
    // Dibujar píxel actual
    mov x0, x19                // dirección framebuffer
    mov x1, x20                // x actual
    mov x2, x21                // y actual
    bl pintar_pixel
    
    // Verificar si ya se llego
    cmp x20, x22               // x0 == x1?
    b.ne not_end
    cmp x21, x23               // y0 == y1?
    b.eq line_end
    
not_end:
    // Calcular e2 = 2*err
    add x11, x26, x26          // e2 = err * 2
    
    // Decisión si mover X
    neg x12, x7                // -dy
    cmp x11, x12               // -dy <= e2?
    b.le check_dx
    sub x26, x26, x7           // err -= dy
    add x20, x20, x24          // x0 += sx
    
check_dx:
    // Decisión si mover Y
    cmp x11, x6                // dx >= e2
    b.ge update
    add x26, x26, x6           // err += dx
    add x21, x21, x25          // y0 += sy
    
update:
    b line_loop
    
line_end:
    // Restaurar registros
    ldp x27, x30, [sp], 16     // Restaurar LR
    ldp x25, x26, [sp], 16
    ldp x23, x24, [sp], 16
    ldp x21, x22, [sp], 16
    ldp x19, x20, [sp], 16
    ret

/* funcion para dibujar un rectangulo que no este limitado a los ejes x e y usando dibujar_linea
Parametros:

x1 = x_inicio
x2 = y_inicio
x3 = x_fin
x4 = y_fin
*/
.globl dibujar_rectangulo
dibujar_rectangulo:
    // 1 Preservar registros
    stp x19, x20, [sp, -16]!
    stp x21, x22, [sp, -16]!
    stp x23, x24, [sp, -16]!  // Guardar LR

    // 2 Guardar parámetros

    mov x20, x1          // x_inicio
    mov x21, x2          // y_inicio
    mov x22, x3          // x_fin
    mov x23, x4          // y_fin

    // Lado 1: (x20,y21) -> (x22,y21)
    mov x1, x20
    mov x2, x21
    mov x3, x22
    mov x4, x21
    bl dibujar_linea

    // Lado 2: (x22,y21) -> (x22,y23)
    mov x1, x22
    mov x2, x21
    mov x3, x22
    mov x4, x23
    bl dibujar_linea

    // Lado 3: (x20,y23) -> (x22,y23)
    mov x1, x20
    mov x2, x23
    mov x3, x22
    mov x4, x23
    bl dibujar_linea

    // Lado 4: (x20,y21) -> (x20,y23)
    mov x1, x20
    mov x2, x21
    mov x3, x20
    mov x4, x23
    bl dibujar_linea

fill_done:
    // 5. Restaurar registros
    ldp x23, x24, [sp], 16
    ldp x21, x22, [sp], 16
    ldp x19, x20, [sp], 16
    ret


// Funcion que usa dibujar_linea y la repita x5 veces reduciendo y
.globl dibujar_lineas_repetidasy
dibujar_lineas_repetidasy:
    // Preservar registros
    stp x19, x20, [sp, -16]!
    stp x21, x22, [sp, -16]!
    stp x23, x24, [sp, -16]!
    stp x25, x30, [sp, -16]!

    // Guardar parámetros
    mov x20, x1      // x_inicio original
    mov x21, x2      // y_inicio original
    mov x22, x3      // x_fin original
    mov x23, x4      // y_fin original
    mov x24, x5      // z (contador)

draw_repeat_loop:
    cmp x24, 0
    beq done_repeat   // Si z == 0, termina

    mov x1, x20
    mov x2, x21
    mov x3, x22
    mov x4, x23
    bl dibujar_linea

    // Subir 1 pixel en Y (y1-- y2--)
    add x21, x21, 1
    add x23, x23, 1

    // Decrementar contador
    sub x24, x24, 1
    b draw_repeat_loop

done_repeat:
    // Restaurar registros
    ldp x25, x30, [sp], 16
    ldp x23, x24, [sp], 16
    ldp x21, x22, [sp], 16
    ldp x19, x20, [sp], 16
    ret

// Funcion que usa dibujar_linea y la repita x5 veces reduciendo x
.globl dibujar_lineas_repetidasx
dibujar_lineas_repetidasx:
    // Preservar registros
    stp x19, x20, [sp, -16]!
    stp x21, x22, [sp, -16]!
    stp x23, x24, [sp, -16]!
    stp x25, x30, [sp, -16]!

    // Guardar parámetros
    mov x19, x0      // dirección framebuffer
    mov x20, x1      // x_inicio original
    mov x21, x2      // y_inicio original
    mov x22, x3      // x_fin original
    mov x23, x4      // y_fin original
    mov x24, x5      // z (contador)

draw_repeat_loop_x:
    cmp x24, 0
    beq done_repeat_x   // Si z == 0, termina

    mov x1, x20
    mov x2, x21
    mov x3, x22
    mov x4, x23
    bl dibujar_linea

    // Mover a la derecha: x1-- y x2--
    add x20, x20, 1
    add x22, x22, 1

    // Decrementar contador
    sub x24, x24, 1
    b draw_repeat_loop_x

done_repeat_x:
    // Restaurar registros
    ldp x25, x30, [sp], 16
    ldp x23, x24, [sp], 16
    ldp x21, x22, [sp], 16
    ldp x19, x20, [sp], 16
    ret
