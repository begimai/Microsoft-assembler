.386

.model flat, stdcall

include kernel32.inc
includelib kernel32.lib
includelib msvcrt.lib

scanf proto c
printf proto c

.data
	frmtstr1	byte	"%d", 0
	frmtstr2	byte	"sum: %d", 13, 10, 0
	
.code
start:
	call sumOfGrades
	
	push 0
	call ExitProcess
	
sumOfGrades proc
	sub esp, 4
	push esi
	mov esi, 0
	
labWhileLoop:
	lea eax, [esp+4] ; [esp+4] - address of g
	push eax
	push OFFSET frmtstr1
	call scanf
	add esp, 8
	
	mov ecx, [esp+4]
	cmp ecx, 0
	je labWhileEnd
	
	add esi, ecx
	jmp labWhileLoop

labWhileEnd:	
	push esi		
	push OFFSET frmtstr2
	call printf
	add esp, 8
	
	pop esi
	add esp, 4
	ret

sumOfGrades endp
end start
