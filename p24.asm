.386  ; type of processor

.model flat, stdcall ; for windows - flat

include kernel32.inc  ; for exit
includelib kernel32.lib ; where libs are
includelib msvcrt.lib

printf proto c
scanf proto c

.data 
	StrFrmt1		byte	"%d", 0
	StrFrmt2		byte	"Hello #%d", 13, 10, 0

.code
start:
	sub esp, 4
	
	push esp
	push offset StrFrmt1
	call scanf
	
	push [esp + 8]
	call sayHello
	
	add esp, 16
	
	push 0
	call ExitProcess
  
sayHello proc
	
	push edi
	mov edi, 0
	
	push esi
	mov esi, [esp + 12] 
	
LabForBeg:
	cmp esi, edi
	je LabForEnd
	
	push edi
	push offset StrFrmt2
	call printf
	add esp, 8
	
	inc edi
	jmp LabForBeg
LabForEnd:
	
	pop esi
	pop edi

	ret
sayHello endp

end start
