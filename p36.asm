.386

.model flat, stdcall

include kernel32.inc
includelib kernel32.lib
includelib msvcrt.lib

scanf proto c
puts proto c

.data
	frmtstr			byte	"%u", 0
	
	charS			byte 	33 dup(?) ; or 32 dup(?), 0
	;charS			byte 	"00000000000000000000000000000000", 0
.code
start:
	sub esp, 4
	
	push esp
	push OFFSET frmtstr
	call scanf
	add esp, 8
	
	push OFFSET charS
	push [esp+4]
	call convertUintToStr
	add esp, 4 					;4 instead of 8, will use line 30 for calling puts
	
	call puts
	add esp, 8
	
	push 0
	call ExitProcess	
	
convertUintToStr proc
	push esi
	
	mov eax, [esp+8]			; eax - argument u
	mov esi, [esp+12]			; esi - the address of the array
	
	add esi, 32					; now esi points to the end of the array
	mov byte ptr[esi], 0
	dec esi
	
	mov ecx, 32					; ecx is used in loop, in each iteration it is decreased
	
labFor:
	mov dl, '0'					; dl is the last 8 bits of edx
	shr eax, 1					; shifted bit is stored in flag register
	jnc labNext					; check if flag register has changed
	inc dl

labNext:
	mov byte ptr[esi], dl
	dec esi
	loop labFor
	
; labFor:
	; mov byte ptr[esi], '0'
	; mov edx, eax
	; and edx, 1
	; cmp edx, 0
	; je labNext
	
	; inc byte ptr[esi]
		
; labNext:	
	; shr eax, 1
	; dec esi
	; loop labFor
	
	pop esi
	ret
convertUintToStr endp	
	
end start
