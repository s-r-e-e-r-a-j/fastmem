; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strlcat
section .text
fm_strlcat:
    xor rcx, rcx
.find_dst_len:
    cmp rcx, rdx
    je .dst_full
    cmp byte [rdi+rcx], 0
    je .dst_found
    inc rcx
    jmp .find_dst_len

.dst_full:
    xor r8, r8
.count_src1:
    cmp byte [rsi+r8], 0
    je .ret_full
    inc r8
    jmp .count_src1
.ret_full:
    lea rax, [rdx+r8]
    ret

.dst_found:
    mov r8, rcx
    xor r9, r9
.count_src_len:
    cmp byte [rsi+r9], 0
    je .copy_start
    inc r9
    jmp .count_src_len

.copy_start:
    mov rax, r8
    add rax, r9
    mov r10, rdx
    sub r10, r8
    cmp r10, 1
    jbe .ret_no_copy
    dec r10

.copy_loop:
    test r10, r10
    jz .terminate
    mov dl, [rsi]
    test dl, dl
    jz .terminate
    mov [rdi+r8], dl
    inc r8
    inc rsi
    dec r10
    jmp .copy_loop

.terminate:
    mov byte [rdi+r8], 0

.ret_no_copy:
    ret

section .note.GNU-stack noalloc noexec nowrite
