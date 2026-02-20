; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strreplace_char
section .text
fm_strreplace_char:
.loop:
    mov al, [rdi]
    test al, al
    jz .done
    cmp al, sil
    jne .next
    mov [rdi], dl
.next:
    inc rdi
    jmp .loop
.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
