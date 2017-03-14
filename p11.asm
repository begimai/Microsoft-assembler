.386  ; type of processor

.model flat, stdcall ; for windows - flat

include kernel32.inc  ; for exit
includelib kernel32.lib ; where libs are

.code
start:
	push 2
	push 3
	call addTwoNums
	add esp, 8
	
	push 1
	push 5
	call addTwoNums
	add esp, 8
	
	push 0
	call ExitProcess
addTwoNums proc
	mov eax, [esp + 4]
	add eax, [esp + 8]
	ret
addTwoNums endp
end start

; to compile    ml /c /coff p00.asm
; to link 		link /subsystem:console p00.obj
; to debug 		ollydbg p00   + f9
; EIP - extended instruction Pointer 