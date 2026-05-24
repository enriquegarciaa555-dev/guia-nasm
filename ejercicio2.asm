; ==========================================
; Ejercicio 2
; Multiplicación y División
; ==========================================

section .data

    ; Números de 8 bits
    num1 db 6
    num2 db 4

    mensaje db "Resultado = "
    lenMensaje equ $ - mensaje

    salto db 10

section .bss

    decena resb 1
    unidad resb 1

section .text
global _start

_start:

    ; Cargar primer número
    mov al, [num1]

    ; Multiplicar por el segundo
    mul byte [num2]

    ; AX = resultado de la multiplicación

    ; Dividir entre 2
    mov bl, 2
    div bl

    ; AL contiene el resultado final

    ; Separar decenas y unidades
    mov ah, 0
    mov bl, 10
    div bl

    ; AL = decena
    ; AH = unidad

    add al, '0'
    mov [decena], al

    mov al, ah
    add al, '0'
    mov [unidad], al

    ; Mostrar mensaje
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje
    mov edx, lenMensaje
    int 0x80

    ; Mostrar decena
    mov eax, 4
    mov ebx, 1
    mov ecx, decena
    mov edx, 1
    int 0x80

    ; Mostrar unidad
    mov eax, 4
    mov ebx, 1
    mov ecx, unidad
    mov edx, 1
    int 0x80

    ; Salto de línea
    mov eax, 4
    mov ebx, 1
    mov ecx, salto
    mov edx, 1
    int 0x80

    ; Finalizar programa
    mov eax, 1
    xor ebx, ebx
    int 0x80