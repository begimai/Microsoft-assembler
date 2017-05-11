.386  ; type of processor

.model flat, stdcall ; for windows - flat

include kernel32.inc
includelib kernel32.lib
includelib msvcrt.lib

scanf proto c
printf proto c

.data
	msgWinter		byte	"Winter", 0
	msgSpring		byte	"Spring", 0
	msgSummer		byte	"Summer", 0
	msgAutumn		byte	"Autumn", 0
	strFrmt1		byte	"%d", 0
	strFrmt2 		byte	"%s", 13, 10, 0
	msgError 		byte	"Wrong number of month", 13, 10, 0
	
	auxArray		byte	0, 0, 1, 1, 1, 2, 2, 2, 3, 3, 3, 0
	
	; eax, ecx, edx					 - used by system
	; esi, edi, ebp, esp, ebx		 - not used
	
.code
start:
	
	sub esp, 4

	; read n
	push esp
	push offset strFrmt1
	call scanf
	add esp, 8
	
	push [esp]
	call getSeason
	
	push eax 
	push offset strFrmt2
	call printf
	
	add esp, 12
	
	push 0
	call ExitProcess
	
getSeason proc
	mov eax, [esp + 4]
	dec eax
	cmp eax, 11
	ja lblWrong
	
	movzx eax, byte ptr auxArray[eax]
	jmp arrayLabels[eax * 4]

lblWinter:
	mov eax, offset msgWinter
	ret
	
lblSpring:
	mov eax, offset msgSpring
	ret
	
lblSummer:
	mov eax, offset msgSummer
	ret
	
lblAutumn:
	mov eax, offset msgAutumn
	ret
	
lblWrong:
	mov eax, offset msgError
	ret
	
arrayLabels dword lblWinter, lblSpring, lblSummer, lblAutumn
	
getSeason endp

end start
