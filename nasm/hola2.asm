global _main    ;declara el metodo main()
extern _printf  ;link to external library

segment .data
message: db 'Hola mundo', 0xA, 0    ;text message
            ;0xA (10) is hex for (NL) carrier return
            ;0 terminate the line

; code is put in the .text section
section .text
_main:              ;the entry point void main()
    push message    ;save message to the stack
    call _printf    ;display the first value on the stack
    add esp,4       ;clear the stack
    ret             ;return
    