; ==========================================
; Ejercicio 9
; Inversión de una Cadena de Texto
; ==========================================

section .data

    ; Cadena original
    cadena db 'UES-FMO',0

section .text
global _start

_start:

    ; Buscar el final de la cadena
    mov esi, cadena

buscar_fin:
    cmp byte [esi], 0
    je invertir

    inc esi
    jmp buscar_fin

invertir:

    ; Retroceder al último carácter válido
    dec esi

imprimir:

    ; Si ya llegamos antes del inicio, terminar
    cmp esi, cadena
    jb salir

    ; Imprimir un carácter
    mov eax, 4
    mov ebx, 1
    mov ecx, esi
    mov edx, 1
    int 0x80

    ; Retroceder al carácter anterior
    dec esi
    jmp imprimir

salir:

    ; Salto de línea
    push byte 10

    mov eax, 4
    mov ebx, 1
    mov ecx, esp
    mov edx, 1
    int 0x80

    add esp, 4

    ; Finalizar programa
    mov eax, 1
    xor ebx, ebx
    int 0x80