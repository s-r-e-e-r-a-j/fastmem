; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strrev
section .text
fm_strrev:
    push rbx
    test rdi, rdi
    jz .done

    mov r8, rdi
    mov rsi, rdi

.find_end:
    cmp byte [rsi], 0
    je .check_empty
    inc rsi
    jmp .find_end

.check_empty:
    cmp rsi, rdi
    je .return_original

    dec rsi

.reverse_loop:
    cmp rdi, rsi
    jge .return_original
    mov al, [rdi]
    mov bl, [rsi]
    mov [rdi], bl
    mov [rsi], al
    inc rdi
    dec rsi
    jmp .reverse_loop

.return_original:
    mov rax, r8
    pop rbx
    ret

.done:
    xor rax, rax
    pop rbx
    ret

section .note.GNU-stack noalloc noexec nowrite
