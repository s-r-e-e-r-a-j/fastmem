; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strreverse_words
section .text
fm_strreverse_words:
.next_word:
    mov r8, rdi
.find_end:
    mov al, [r8]
    test al, al
    jz .reverse_last
    cmp al, ' '
    je .reverse_word
    inc r8
    jmp .find_end
.reverse_word:
    mov r9, rdi
    lea r10, [r8 - 1]
.rev_loop:
    cmp r9, r10
    jge .next_start
    mov al, [r9]
    mov dl, [r10]
    mov [r9], dl
    mov [r10], al
    inc r9
    dec r10
    jmp .rev_loop
.next_start:
    inc r8
    mov rdi, r8
    jmp .next_word
.reverse_last:
    mov r9, rdi
    lea r10, [r8 - 1]
.rev_last_loop:
    cmp r9, r10
    jge .done
    mov al, [r9]
    mov dl, [r10]
    mov [r9], dl
    mov [r10], al
    inc r9
    dec r10
    jmp .rev_last_loop
.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
