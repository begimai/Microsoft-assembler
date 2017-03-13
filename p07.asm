.386  ; type of processor

.model flat, stdcall ; for windows - flat

include kernel32.inc  ; for exit
includelib kernel32.lib ; where libs are

.code
start:
	mov eax, 1
	mov ebx, 1
	mov ecx, 1
	call incEAX
	
	push 0
	call ExitProcess
	
incEAX proc
	inc eax
	call incEBX
	ret 
incEAX endp
	
incEBX proc
	inc ebx
	call incECX
	ret 
incEBX endp

incECX proc
	inc ecx
	ret 
incECX endp

end start

; to compile    ml /c /coff p00.asm
; to link 		link /subsystem:console p00.obj
; to debug 		ollydbg p00   + f9
; EIP - extended instruction Pointer 