.386

.model flat, stdcall

include kernel32.inc
includelib kernel32.lib
includelib msvcrt.lib

scanf proto c
puts proto c

.data
	frmtstr			byte	"%u", 0
	digitS			byte 	"0123456789ABCDEF", 0
	charS			byte	8 dup(?), 0
	; 0 not necessary, since we are not using this array for puts
.code
start:
	sub esp, 4
	
	push esp
	push OFFSET frmtstr
	call scanf
	add esp, 8
	
	push OFFSET charS
	push [esp+4]
	call convertUintToHex
	add esp, 4 					;4 instead of 8, will use line 30 for calling puts
	
	call puts
	add esp, 8
	
	push 0
	call ExitProcess	
	
convertUintToHex proc
	push esi
	
	mov eax, [esp+8]			; eax - argument u
	mov esi, [esp+12]			; esi - the address of the array
	
	add esi, 8					; now esi points to the end of the array
	mov byte ptr[esi], 0
	dec esi
	
	mov ecx, 8					; ecx is used in loop, in each iteration it is decreased
	
labFor:
	mov edx, eax
	shr eax, 4
	
	and edx, 15					; edx
	mov bl, byte ptr digitS[edx]
	
	mov byte ptr[esi], bl
	dec esi
	
	loop labFor
	
	pop esi
	ret
convertUintToHex endp	
	
end start
