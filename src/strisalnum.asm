; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strisalnum
section .text
fm_strisalnum:
    mov eax, 1
.loop:
    mov cl, [rdi]
    test cl, cl
    jz .done
    cmp cl, '0'
    jb .fail
    cmp cl, '9'
    jbe .next
    cmp cl, 'A'
    jb .fail
    cmp cl, 'Z'
    jbe .next
    cmp cl, 'a'
    jb .fail
    cmp cl, 'z'
    jbe .next
.fail:
    xor eax, eax
    ret
.next:
    inc rdi
    jmp .loop
.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
