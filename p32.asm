.386

.model flat, stdcall

include kernel32.inc
includelib kernel32.lib
includelib msvcrt.lib

scanf proto c
printf proto c

.data
	msgOut			byte	"%6d%20d", 13, 10, 0
	msgLine			byte	"------------------------", 13, 10, 0
	frmtstr			byte	"%d", 0	

.code
start:
	push 5
	push OFFSET square
	call printTable
	
	push OFFSET msgLine
	call printf
	
	push 7
	push OFFSET cube
	call printTable
	
	add esp, 20
	
	push 0
	call ExitProcess

printTable proc
	push ebx
	push esi
	push edi

	mov esi, 0			; i
	mov edi, [esp+16]	; edi - pointer to function
	mov ebx, [esp+20]	; ebx - variable n
	
labLoop:
	cmp esi, ebx
	jge loopEnd
	
	push esi
	call edi
	add esp, 4
	
	push eax
	push esi
	push OFFSET msgOut
	call printf
	
	add esp, 12
	
	inc esi
	jmp labLoop
	
loopEnd:
	pop edi
	pop esi
	pop ebx
	
	ret
printTable endp
	
	
square proc
	mov eax, [esp+4]
	imul eax
	ret
square endp

cube proc
	mov eax, [esp+4]
	imul eax
	imul dword ptr[esp+4]
	ret
cube endp
	
	
end start
