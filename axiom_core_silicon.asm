; ----------------------------------------------------------------------------------------
; AXIOM SYSTEMS - SILICON CORE ENGINE v1.0
; Architecture: x86_64 (Linux Syscalls)
; Philosophy: Sovereign Engineering - Zero standard library dependencies.
; ----------------------------------------------------------------------------------------

global _start

section .data
    ; Mensaje de inicialización del motor en el silicio
    axiom_msg db "AXIOM CORE: Running directly on bare silicon. Sovereign Engineering initialized.", 10
    axiom_len equ $ - axiom_msg

section .text

_start:
    ; --- TRÁFICO DIRECTO AL KERNEL: sys_write (rax = 1) ---
    mov rax, 1          ; ID de llamada al sistema para escribir (sys_write)
    mov rdi, 1          ; File descriptor: stdout (pantalla)
    mov rsi, axiom_msg  ; Puntero al inicio del mensaje en memoria física
    mov rdx, axiom_len  ; Longitud exacta en bytes del string
    syscall             ; Invocación directa al procesador / kernel

    ; --- BUCLE DE OPTIMIZACIÓN NATIVA (Operación de registro pura) ---
    mov rcx, 1000       ; Contador de ciclos del micro-motor
.loop_core:
    xor rax, rax        ; Limpieza del registro RAX a latencia cero
    inc rax             ; Operación directa sobre el bit
    loop .loop_core     ; Bucle directo por hardware (decrementa RCX de forma nativa)

    ; --- SALIDA LIMPIA DEL ENTORNO: sys_exit (rax = 60) ---
    mov rax, 60         ; ID de llamada al sistema para salir (sys_exit)
    xor rdi, rdi        ; Código de salida 0 (sin errores) - xor es más rápido que mov
    syscall             ; Cierre del hilo en el silicio
