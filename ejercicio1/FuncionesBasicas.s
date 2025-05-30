.data
    array_p0_p1: .space 1280  // Reserva 640 * 2 = 1280 bytes para el arreglo
    array_p1_p2: .space 1280  // Reserva 640 * 2 = 1280 bytes para el arreglo
    array_p0_p2: .space 1280  // Reserva 640 * 2 = 1280 bytes para el arreglo
    array_p0_p1_p2: .space 1280  // Reserva 640 * 2 = 1280 bytes para el arreglo

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
    // w10 = color (no necesita preservarse)
    
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
// igual que las anteriores en todo excepto que va saltando una linea y pinta y asi seguidamente
.globl dibujar_lineas_intercaladasx
dibujar_lineas_intercaladasx:
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

draw_repeat_loop_xs:
    cmp x24, 0
    beq done_repeat_xs   // Si z == 0, termina

    mov x1, x20
    mov x2, x21
    mov x3, x22
    mov x4, x23
    bl dibujar_linea

    // Mover a la derecha: x1-- y x2--
    add x20, x20, 2
    add x22, x22, 2

    // Decrementar contador
    sub x24, x24, 2
    b draw_repeat_loop_xs

done_repeat_xs:
    // Restaurar registros
    ldp x25, x30, [sp], 16
    ldp x23, x24, [sp], 16
    ldp x21, x22, [sp], 16
    ldp x19, x20, [sp], 16
    ret


/* funcion para dibujar un rectangulo relleno
Parametros:

x1 = x_inicio
x2 = y_inicio
x3 = x_fin
x4 = y_fin
*/
.globl dibujar_rectangulo_relleno
dibujar_rectangulo_relleno:
    // Preservar registros
    stp x19, x20, [sp, -16]!
    stp x21, x22, [sp, -16]!
    stp x23, x30, [sp, -16]!

    // 2 Guardar parámetros
    mov x20, x1          // x_inicio
    mov x21, x2          // y_inicio
    mov x22, x3          // x_fin
    mov x23, x4          // y_fin

    // Funcion
    mov x2, x21         // y_inicio
height_rec_loop:
    mov x1, x20         // x_inicio
width_rec_loop:
    bl pintar_pixel
    add x1, x1, 1
    cmp x1, x22
    b.le width_rec_loop
    add x2, x2, 1
    cmp x2, x23
    b.le height_rec_loop

done_rec:
    // Restaurar registros
    ldp x23, x30, [sp], 16
    ldp x21, x22, [sp], 16
    ldp x19, x20, [sp], 16
    ret

/* funcion para guardar linea

Parametros:
x0 = dirección base del framebuffer
x1 = x_inicio
x2 = y_inicio
x3 = x_fin
x4 = y_fin
x5 = direccion de array 
*/
.globl guardar_linea
guardar_linea:
    // 1. Preservar registros
    stp x19, x20, [sp, -16]!
    stp x21, x22, [sp, -16]!
    stp x23, x24, [sp, -16]!
    stp x25, x26, [sp, -16]!
    stp x27, x28, [sp, -16]!
    stp x29, x30, [sp, -16]!  // Guardar también LR (x30)
    
    // 2. Guardar parámetros en registros preservados
    mov x19, x0                // Dirección base del framebuffer
    mov x20, x1                // x0 (x_inicio)
    mov x21, x2                // y0 (y_inicio)
    mov x22, x3                // x1 (x_fin)
    mov x23, x4                // y1 (y_fin)
    mov x13, x2                // y0 (y_inicio)
    mov x14, x5                // direccion de array 

//dx = Diferencia absoluta entre las x y dy = Diferencia absoluta entra las y

    // 3. Calcular dx = abs(x1 - x0)
    sub x6, x22, x20           // dx = x1 - x0
    cmp x6, 0
    b.ge dx_positive_2
    neg x6, x6                 // dx = abs(dx)
dx_positive_2:             
    
    // 4. Calcular dy = abs(y1 - y0)
    sub x7, x23, x21           // dy = y1 - y0
    cmp x7, 0
    b.ge dy_positive_2
    neg x7, x7                 // dy = abs(dy)
dy_positive_2:
    
    // 5. Determinar en que dirección X se debe mover(sx)
    mov x24, 1                 // sx = 1 (por defecto a la derecha)
    cmp x22, x20
    b.ge sx_done_2
    mov x24, -1                // sx = -1 si x1 < x0 (a la izquierda)
sx_done_2:
    
    // 6. Determinar en que dirección Y se debe mover (sy)
    mov x25, 1                 // sy = 1 (por defecto sube)
    cmp x23, x21
    b.ge sy_done_2
    mov x25, -1                // sy = -1 si y1 < y0 (baja)
sy_done_2:
    
    // 7. Inicializar error
    mov x26, x6                // err = dx
    sub x26, x26, x7           // err = dx - dy
    
    // 8. Bucle principal
line_loop_2:
    // Dibujar píxel actual
    mov x0, x19                // dirección framebuffer
    mov x1, x20                // x actual
    mov x2, x21                // y actual
    bl pintar_pixel
    // guarga píxel actual
    mov x1, x20               
    sub x15, x13, x21
    lsl x15, x15, 1
    add x15, x14, x15
    sturh w1, [x15]
    
    // Verificar si ya se llego
    cmp x20, x22               // x0 == x1?
    b.ne not_end_2
    cmp x21, x23               // y0 == y1?
    b.eq line_end_2
    
not_end_2:
    // Calcular e2 = 2*err
    add x11, x26, x26          // e2 = err * 2
    
    // Decisión si mover X
    neg x12, x7                // -dy
    cmp x11, x12               // -dy <= e2?
    b.le check_dx_2
    sub x26, x26, x7           // err -= dy
    add x20, x20, x24          // x0 += sx
    
check_dx_2:
    // Decisión si mover Y
    cmp x11, x6                // dx >= e2
    b.ge update_2
    add x26, x26, x6           // err += dx
    add x21, x21, x25          // y0 += sy
    
update_2:
    b line_loop_2
    
line_end_2:
    // Restaurar registros
    ldp x29, x30, [sp], 16     // Restaurar LR
    ldp x27, x28, [sp], 16
    ldp x25, x26, [sp], 16
    ldp x23, x24, [sp], 16
    ldp x21, x22, [sp], 16
    ldp x19, x20, [sp], 16
    ret

/* funcion para dibujar un triangulo

https://www.gabrielgambetta.com/computer-graphics-from-scratch/07-filled-triangles.html

Parametros:

x1 = p0.x
x2 = p0.y
x3 = p1.x
x4 = p1.y
x5 = p2.x
x6 = p2.y
*/
.globl dibujar_triangulo
dibujar_triangulo:
    // Preservar registros TODO
    stp x19, x20, [sp, -16]!
    stp x21, x22, [sp, -16]!
    stp x23, x24, [sp, -16]!
    stp x25, x30, [sp, -16]!

    // Guardar parámetros
    mov x19, x1     // p0.x
    mov x20, x2     // p0.y
    mov x21, x3     // p1.x
    mov x22, x4     // p1.y
    mov x23, x5     // p2.x
    mov x24, x6     // p2.y

    // Funcion

    // get_array_p0_p1
    mov x1, x19
    mov x2, x20
    mov x3, x21
    mov x4, x22
    ldr x5, =array_p0_p1
    bl guardar_linea

    // get_array_p1_p2
    mov x1, x21
    mov x2, x22
    mov x3, x23
    mov x4, x24
    ldr x5, =array_p1_p2
    bl guardar_linea

    // get_array_p0_p2
    mov x1, x19
    mov x2, x20
    mov x3, x23
    mov x4, x24
    ldr x5, =array_p0_p2
    bl guardar_linea

    //
    // Concatenate the short sides
    //
    sub x1, x20, x22             // p1.y - p2.y
    sub x1, x1, 1

    ldr x2, =array_p0_p1        // posicion de memoria de array_p0_p1
    ldr x3, =array_p0_p1_p2     // posicion de memoria de array_p0_p1_p2
add_array_p0_p1_loop:
    ldurh w4, [x2]
    sturh w4, [x3]
    add x2, x2, 2
    add x3, x3, 2
    subs x1, x1, 1
    b.ge add_array_p0_p1_loop

    sub x1, x22, x24            //  p0.y - p1.y

    ldr x2, =array_p1_p2        // posicion de memoria de array_p1_p2
add_array_p1_p2_loop:
    ldurh w4, [x2]
    sturh w4, [x3]
    add x2, x2, 2
    add x3, x3, 2
    subs x1, x1, 1
    b.ge add_array_p1_p2_loop

    //
    // Determine which is left and which is right
    //
    sub x1, x20, x24
    mov x2, 2
    udiv x1, x1, x2
    lsl x1, x1, 1

    ldr x2, =array_p0_p2        // posicion de memoria de array_p0_p1
    ldr x3, =array_p0_p1_p2     // posicion de memoria de array_p0_p1_p2

    add x2, x2, x1
    add x3, x3, x1

    ldurh w2, [x2]
    ldurh w3, [x3]

    cmp x2, x3
    b.ge side_else
side_if:
    ldr x4, =array_p0_p2        // x_left 
    ldr x5, =array_p0_p1_p2     // x_right 
    b done_side_if
side_else:
    ldr x4, =array_p0_p1_p2     // x_left 
    ldr x5, =array_p0_p2        // x_right 
done_side_if:

    //
    // Draw the horizontal segments
    //
    mov x3, x24        // p2.y
loop_hor_seg_y:
    sub x6, x3, x24     // y - y0
    lsl x6, x6, 1       // (y - y0) * 2
    add x7, x5, x6      // &x_right[y - y0]
    add x6, x4, x6      // &x_left[y - y0]
    ldurh w6, [x6]      // x_left[y - y0]
    ldurh w7, [x7]      // x_left[y - y0]
loop_hor_seg_x:
    mov x1, x6
    sub x2, x3, x24
    sub x2, x20, x2
    bl pintar_pixel

    add x6, x6, 1
    cmp x6, x7          // x6 - x_right[y - y0]
    b.lt loop_hor_seg_x

    add x3, x3, 1
    cmp x3, x20         // x3 - p2.y
    b.lt loop_hor_seg_y

done_triangulo:
    ldp x25, x30, [sp], 16
    ldp x23, x24, [sp], 16
    ldp x21, x22, [sp], 16
    ldp x19, x20, [sp], 16
    ret
