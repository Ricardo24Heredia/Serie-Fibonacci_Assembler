_EXIT  equ 1
_READ  equ 3
_WRITE equ 4
STDIN  equ 0
STDOUT equ 1

section .data
  msg1 db "Ingresa la cantidad de números de la serie Fibonacci del 0 al 9: ",0xA, 0xD
  len1 equ $- msg1
  msg2 db "El resultado de la serie Fibonacci es: ",
  len2 equ $- msg2
  msg3 db "Solo son válidos números del 0 al 9", 0xA, 0xD
  len3 equ $- msg3
  msg4 db "¿Desea ver otro resultado de la serie Fibonacci? Ingrese 'S' para continuar: ", 0xA, 0xD
  len4 equ $- msg4
  espacio db ', ',
  lin_break db 0xA     ;salto de linea
  result db 0

section .bss
  num resb 5
  res  resb 2

section .text
  global _start

_start:

fibonaccie:

   mov eax, _WRITE    ; Solicitar el número
   mov ebx, STDOUT
   mov ecx, msg1
   mov edx, len1
   int 80h

   mov eax, _READ    ; Leer el número ingresado
   mov ebx, STDIN
   mov ecx, num
   mov edx, 5
   int 80h

   movzx eax, byte [num] ; Convertir carácter leído a número
   sub eax, '0'

   cmp eax, 0   ; Verificar que el número está entre 0 y 9
   jl default_case
   cmp eax, 9
   jg default_case

   movzx edx, byte [num+1]  ; Verificar que el segundo carácter sea un salto de línea
   cmp edx, 0xA
   jne default_case

   mov ebx, eax ; Asignar número al registro ebx para comparación

   cmp ebx, 0   ; Comparar con cada caso, salta al caso que corresponde
   je caso0
   cmp ebx, 1
   je caso1
   cmp ebx, 2
   je caso2
   cmp ebx, 3
   je caso3
   cmp ebx, 4
   je caso4
   cmp ebx, 5
   je caso5
   cmp ebx, 6
   je caso6
   cmp ebx, 7
   je caso7
   cmp ebx, 8
   je caso8
   cmp ebx, 9
   je caso9

; Casos para cada número de 0 a 9
caso0:
    call number_cero     ; Llama a la etiqueta number_cero
    call line_break      ; Llama a la etiqueta line_break
    jmp ask_to_continue  ; Salta a la etiqueta ask_to_continue

caso1:
    call number_cero
    call number_one
    call line_break
    jmp ask_to_continue

caso2:
    call number_cero
    call number_one
    call number_two
    call line_break
    jmp ask_to_continue

caso3:
    call number_cero
    call number_one
    call number_two
    call number_three
    call line_break
    jmp ask_to_continue

caso4:
    call number_cero
    call number_one
    call number_two
    call number_three
    call number_four
    call line_break
    jmp ask_to_continue

caso5:
    call number_cero
    call number_one
    call number_two
    call number_three
    call number_four
    call number_five
    call line_break
    jmp ask_to_continue

caso6:
    call number_cero
    call number_one
    call number_two
    call number_three
    call number_four
    call number_five
    call number_six
    call line_break
    jmp ask_to_continue

caso7:
    call number_cero
    call number_one
    call number_two
    call number_three
    call number_four
    call number_five
    call number_six
    call number_seven
    call line_break
    jmp ask_to_continue

caso8:
    call number_cero
    call number_one
    call number_two
    call number_three
    call number_four
    call number_five
    call number_six
    call number_seven
    call number_eight
    call line_break
    jmp ask_to_continue

caso9:
    call number_cero
    call number_one
    call number_two
    call number_three
    call number_four
    call number_five
    call number_six
    call number_seven
    call number_eight
    call number_nine
    call line_break
    jmp ask_to_continue

default_case:       ; Manejar caso por defecto para números no válidos
    mov eax, _WRITE
    mov ebx, STDOUT
    mov ecx, msg3
    mov edx, len3
    int 80h
    jmp fibonaccie

; imprimir números de la serie Fibonacci

number_cero:
    call print_msg          ; llama a la etiqueta print_msg para imprimir el mensaje correspodiente
    mov eax, 0              ; Mueve el valor 0 a eax
    call convert_and_print  ; llama a la etiqueta convert_and_print para convertir y mostrar el número
    ret                     ; Retorna a donde se estaba llamando

number_one:
    mov eax, 1
    call convert_and_print
    ret

number_two:
    mov eax, 0                   ; mueve el valor 0 a eax
    mov ebx, 1                   ; mueve el valor 1 a ebx
    add eax, ebx                 ; suma ebx a eax, resultado en eax
    call convert_and_print       ; llama a la etiqueta convert_and_print para convertir y mostrar el número
    ret                          ; retorna al llamador

number_three:
    mov eax, 1
    mov ebx, 1
    add eax, ebx
    call convert_and_print
    ret

number_four:
    mov eax, 1
    mov ebx, 2
    add eax, ebx
    call convert_and_print
    ret

number_five:
    mov eax, 2
    mov ebx, 3
    add eax, ebx
    call convert_and_print
    ret

number_six:
    mov eax, 3
    mov ebx, 5
    add eax, ebx
    call convert_and_print
    ret

number_seven:
    mov eax, 5
    mov ebx, 8
    add eax, ebx
    call convert_and_print_2
    ret

number_eight:
    mov eax, 8
    mov ebx, 13
    add eax, ebx
    call convert_and_print_2
    ret

number_nine:
    mov eax, 13
    mov ebx, 21
    add eax, ebx
    call convert_and_print_2
    ret

print_msg:           ; Imprimir msg2
    mov eax, _WRITE
    mov ebx, STDOUT
    mov ecx, msg2
    mov edx, len2
    int 80h
    ret

convert_and_print:
    add eax, 48        ; Convertir a carácter ASCII
    mov [result], eax
    call print_number
    ret

print_number:           ; Imprimir numero de un digito
    mov eax, _WRITE
    mov ebx, STDOUT
    mov ecx, result
    mov edx, 1
    int 80h
    call print_espacio
    ret

convert_and_print_2:    ; imprimir numero de dos digitos

    mov ecx, result
    mov ebx, 10
    xor edx, edx
    div ebx

    add dl, '0'       ; Convertir el primer dígito
    mov [ecx + 1], dl

    mov dl, al        ; Convertir el segundo dígito
    add dl, '0'
    mov [ecx], dl

    mov eax, _WRITE  ; Imprimir 2 dígitos
    mov ebx, STDOUT
    mov ecx, result
    mov edx, 2  ; Ajustamos el tamaño a 2 bytes
    int 80h
    call print_espacio
    ret

print_espacio:
    mov eax, _WRITE    ; Imprimir un espacio
    mov ebx, STDOUT
    mov ecx, espacio
    mov edx, 2
    int 80h
    ret

line_break:
   mov eax, _WRITE
   mov ebx, STDOUT
   mov ecx, lin_break
   mov edx, 1
   int 80h
   ret

ask_to_continue: ; Preguntar si desea continuar

   mov eax, _WRITE
   mov ebx, STDOUT
   mov ecx, msg4
   mov edx, len4
   int 80h

   mov eax, _READ    ; Leer respuesta del usuario
   mov ebx, STDIN
   mov ecx, res
   mov edx, 2
   int 80h

   cmp byte [res], 'S'  ; Comparar la respuesta con 'S' para continuar
   je fibonaccie
   jmp exit

exit:
    mov eax, _EXIT  ; Salir del programa
    mov ebx, 0
    int 80h
