.386  ; type of processor

.model flat, stdcall ; for windows - flat

include kernel32.inc  ; for exit
includelib kernel32.lib ; where libs are

.data
	x dword 2
	y dword 3
	
.code
start:
	push y
	push x
	call badSwap
	add esp, 8
	
	push 0
	call ExitProcess
	
badSwap proc
	mov eax, [esp + 4]
	mov ebx, [esp + 8]
	mov [esp + 4], ebx
	mov [esp + 8], eax
	ret
badSwap endp
end start

; to compile    ml /c /coff p00.asm
; to link 		link /subsystem:console p00.obj
; to debug 		ollydbg p00   + f9
; EIP - extended instruction Pointer 