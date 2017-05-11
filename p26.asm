.386  ; type of processor

.model flat, stdcall ; for windows - flat

include kernel32.inc
includelib kernel32.lib
includelib msvcrt.lib

scanf proto c
printf proto c

.data
	frmtstr		byte	"%d", 0
	
	dividentStr	byte	"Divident (Exit: Ctrl+Z): ", 0
	divisorStr	byte	"Divisor (Exit: Ctrl+Z): ", 0
	divisorErr	byte	"Divisor can not be zero", 13, 10, 0
	
	quotStr		byte	"Quotient: %d", 13, 10, 0
	remStr		byte	"Remainder: %d", 13, 10, 0
	
.code
start:
	push esi
	sub esp, 8
	
lblInf:

	push offset dividentStr
	call printf
	add esp, 4
	
	; read a
	push esp
	push offset frmtstr
	call scanf
	add esp, 8
	
	; if ctrl + z, break
	cmp eax, -1
	je lblEnd
	
	push offset divisorStr
	call printf
	add esp, 4
	
	; read b
	lea eax, [esp + 4]	
	push eax
	push offset frmtstr
	call scanf
	add esp, 8
	
	; if ctrl + z, break
	cmp eax, -1
	je lblEnd
	
	; if b == 0
	mov eax, [esp + 4]
	cmp eax, 0
	jne labDiv
	
	push offset divisorErr
	call printf
	add esp, 4	
	
	jmp lblInf
	
labDiv:
	mov edx, 0
	mov eax, [esp]
	idiv dword ptr[esp + 4] ; deli na b 
	
	; eax = result quotient
	; edx = reminder - printf might change value
	
	mov esi, edx
	
	push eax 
	push offset quotStr
	call printf; 
	add esp, 8
		
	push esi
	push offset remStr
	call printf
	add esp, 8
	
	jmp lblInf
	
lblEnd:

	add esp, 8
	pop esi
	push 0
	call ExitProcess
end start
