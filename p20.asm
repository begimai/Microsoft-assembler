.386  ; type of processor

.model flat, stdcall ; for windows - flat

include kernel32.inc  ; for exit
includelib kernel32.lib ; where libs are
includelib msvcrt.lib

printf proto c
scanf proto c

.data 
	StrFrmt1		byte	"%d", 0
	StrFrmt2		byte	"%d", 13, 10, 0

.code
start:
	sub esp, 4
	
	push esp
	push offset StrFrmt1
	call scanf
	
	push [esp + 8]
	call asmAbs
	
	push eax
	push offset StrFrmt2
	call printf
	
	add esp, 24
	
	push 0
	call ExitProcess
	
asmAbs proc
	mov eax, [esp + 4]
	cmp eax, 0
	jge lblEnd
	neg eax
lblEnd:
	ret
asmAbs endp

end start

; to compile    ml /c /coff p00.asm
; to link 		link /subsystem:console p00.obj
; to debug 		ollydbg p00   + f9
; EIP - extended instruction Pointer 