; **********************************
; Ejercicio 7
; Multiplicación mediante sumas sucesivas
; ****

section .data

    ; Números a multiplicar
    multiplicando db 4
    multiplicador db 3

    mensaje db "Resultado = "
    lenMensaje equ $ - mensaje

    salto db 10

section .bss

    resultado resb 1
    decena resb 1
    unidad resb 1

section .text
global _start

_start:

    ; Resultado inicial = 0
    mov al, 0

    ; Cargar contador
    mov cl, [multiplicador]

ciclo:

    ; Si contador = 0 terminar
    cmp cl, 0
    je mostrar

    ; resultado += multiplicando
    add al, [multiplicando]

    ; contador--
    dec cl

    jmp ciclo

mostrar:

    ; Guardar resultado
    mov [resultado], al

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

    ; Salir
    mov eax, 1
    xor ebx, ebx
    int 0x80