; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strtrim
section .text
fm_strtrim:
    mov rax, rdi

; skip leading spaces
.lskip:
    mov cl, [rax]
    test cl, cl
    jz .done
    cmp cl, 32
    jbe .inc_l
    jmp .find_end
.inc_l:
    inc rax
    jmp .lskip

.find_end:
    mov rdx, rax
.scan:
    mov cl, [rdx]
    test cl, cl
    jz .back
    inc rdx
    jmp .scan

.back:
    dec rdx
.rtrim:
    cmp rdx, rax
    jb .done
    mov cl, [rdx]
    cmp cl, 32
    ja .done
    mov byte [rdx], 0
    dec rdx
    jmp .rtrim

.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
