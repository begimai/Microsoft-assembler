.386  ; type of processor

.model flat, stdcall ; for windows - flat

include kernel32.inc  ; for exit
includelib kernel32.lib ; where libs are

.data
	x dword 2
	y dword 3
	
	a dword 5
	b dword 6
	
.code
start:
	push OFFSET y
	push OFFSET x
	call goodSwap
	add esp, 8
	
	push OFFSET b
	push OFFSET a
	call goodSwap
	add esp, 8
	
	push 0
	call ExitProcess
	
goodSwap proc
	mov eax, [esp + 4]
	mov ebx, [esp + 8]
	
	mov ecx, [eax]
	xchg ecx, [ebx]
	mov [eax], ecx
	
	;mov edx, [ebx]
	
	;mov [eax], edx
	;mov [ebx], ecx
	ret
goodSwap endp
end start
