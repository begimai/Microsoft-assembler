.386  ; type of processor

.model flat, stdcall ; for windows - flat

include kernel32.inc  ; for exit
includelib kernel32.lib ; where libs are

.code
start:
	mov eax, 2
	mov edx, 3
	
	push eax
	push edx
	
	pop eax
	pop edx
	
	push 0
	call ExitProcess
end start

; to compile    ml /c /coff p00.asm
; to link 		link /subsystem:console p00.obj
; to debug 		ollydbg p00   + f9
; EIP - extended instruction Pointer 
; 	push 1
;	push 2
;	push 3
;	push 4
	
;	pop eax
;	pop ebx   
;	pop ecx   
;	pop edx