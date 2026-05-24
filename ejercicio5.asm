; ==========================================
; Ejercicio 5
; Encontrar el mayor de tres números
; ==========================================

section .data

    ; Definición de los números
    A db 10
    B db 25
    C db 17

    ; Mensajes a mostrar
    msgA db "El mayor es A", 10
    lenA equ $ - msgA

    msgB db "El mayor es B", 10
    lenB equ $ - msgB

    msgC db "El mayor es C", 10
    lenC equ $ - msgC

section .text
global _start

_start:

    ; Suponemos que A es el mayor
    mov al, [A]

    ; Comparar con B
    cmp al, [B]
    jge compararC

    ; B es mayor que A
    mov al, [B]
    mov bl, 2
    jmp compararC

compararC:

    ; Si no se asignó B, asumir A
    cmp bl, 2
    je seguir
    mov bl, 1

seguir:

    ; Comparar con C
    cmp al, [C]
    jge mostrarMayor

    ; C es el mayor
    mov bl, 3

mostrarMayor:

    cmp bl, 1
    je imprimirA

    cmp bl, 2
    je imprimirB

    jmp imprimirC

imprimirA:

    mov eax, 4
    mov ebx, 1
    mov ecx, msgA
    mov edx, lenA
    int 0x80
    jmp salir

imprimirB:

    mov eax, 4
    mov ebx, 1
    mov ecx, msgB
    mov edx, lenB
    int 0x80
    jmp salir

imprimirC:

    mov eax, 4
    mov ebx, 1
    mov ecx, msgC
    mov edx, lenC
    int 0x80

salir:

    mov eax, 1
    xor ebx, ebx
    int 0x80