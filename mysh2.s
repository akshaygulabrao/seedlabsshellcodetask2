section .text
  global _start
    _start:
	BITS 32
	jmp short two
    one:
 	pop ebx
 	xor eax, eax

 	mov [ebx+0xc], al ;terminating character
 	mov [ebx+0xd], ebx;address of string 
 	mov [ebx+0x11], eax;terminating word
 	lea ecx, [ebx+0xd]; address of address of string 

        mov [ebx + 0x19],al ;terminating character
        lea edi, [ebx + 0x15]; start of string
        mov [ebx + 0x1a], edi; address of string
        mov [ebx + 0x1e],eax ; terminating word
                             ; address of address of string
        
	mov [ebx + 0x26],al ;terminating character
        lea esi,[ebx + 0x22]; start of string
        mov [ebx + 0x27],esi; address of string
	mov [ebx + 0x2b],eax; terminating word 

	;assembling env arr
        mov [ebx + 0x2c],edi
        mov [ebx + 0x30],esi
        mov [ebx + 0x34],eax
       
       lea edx, [ebx + 0x2c]        
	
 	;xor edx, edx
 	mov al,  0x0b
 	int 0x80
     two:
 	call one
 	db '/usr/bin/env*AAAABBBBa=11*AAAABBBBb=22*AAAABBBBBAAAABBBBCCCC' 
