.386  ; type of processor

.model flat, stdcall ; for windows - flat

include kernel32.inc  ; for exit
includelib kernel32.lib ; where libs are
includelib msvcrt.lib

printf proto c
scanf proto c

.data
	strFrmt1		byte		"%d", 0
	strFrmt2		byte		"%d %d %d %d %d", 13, 10, 0
	
.code
start:
	sub esp, 4
	
	push esp
	push offset strFrmt1
	call scanf
	
	push [esp + 8]  ; [] for registers to get address
	;push offset  strFrmt2
	;call printf
	call printNums
	add esp, 16
	
	push 0
	call ExitProcess
	
printNums proc
	push ebp
	mov ebp, esp
	
	sub esp, 16 ; 4 pushes
	
	mov eax, [ebp + 8]
	sub eax, 2
	mov [ebp - 16], eax
	
	mov eax, [ebp + 8]
	sub eax, 1
	mov [ebp - 12], eax
	
	mov eax, [ebp + 8]
	add eax, 1
	mov [ebp - 8], eax
	
	mov eax, [ebp + 8]
	add eax, 2
	mov [ebp - 4], eax
	
	push [ebp - 4]	;local var next2
	push [ebp - 8]	;local var next1
	push [ebp + 8]	; num itself
	push [ebp - 12]	;local var prev1
	push [ebp - 16]	;local var prev2
	
	push offset strFrmt2
	call printf
	
	mov esp, ebp
	pop ebp
	
	ret
printNums endp
end start
