.386

.model flat, stdcall

include kernel32.inc
includelib kernel32.lib
includelib msvcrt.lib

scanf proto c
printf proto c

.data
	mainstr		byte	"User's choice: %d", 13, 10, 0
	frmtstr		byte	"%d", 0
	frmtstr1	byte	"1. Game", 13, 10, 0
	frmtstr2	byte	"2. Exit", 13, 10, 0
	frmtstr3	byte	"Your choice: ", 0
	
.code
start:
	call getUserChoice
	
	push eax
	push OFFSET mainstr
	call printf
	
	add esp, 8	
	
	push 0
	call ExitProcess
	
getUserChoice proc
	sub esp, 4				; space for local variable r

doWhileLoop:
	push OFFSET frmtstr1
	call printf
		
	push OFFSET frmtstr2
	call printf
	
	push OFFSET frmtstr3
	call printf
	
	add esp, 12
	
	push esp				; esp points to local variable r
	push OFFSET frmtstr
	call scanf
	add esp, 8
	
	mov eax, [esp]
	
	cmp eax, 1
	je doWhileLoopEnd
	cmp eax, 2	
	je doWhileLoopEnd
	jmp doWhileLoop
	
doWhileLoopEnd:
	add esp, 4
	ret
	
getUserChoice endp

end start
