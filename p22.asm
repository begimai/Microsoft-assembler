.386  ; type of processor

.model flat, stdcall ; for windows - flat

include kernel32.inc  ; for exit
includelib kernel32.lib ; where libs are
includelib msvcrt.lib

puts proto c
scanf proto c

.data 
	StrFrmt1		byte	"%d", 0
	positive		byte	"positive", 0
	negative		byte	"negative", 0
	zero			byte	"zero", 0

.code
start:
	sub esp, 4
	
	push esp
	push offset StrFrmt1
	call scanf
	
	push [esp + 8]
	call msgSign
	
	push eax
	call puts
	
	add esp, 20
	
	push 0
	call ExitProcess
	
	; ebp, esp					 - used by system
	; esi, edi, ebp, esp 		 - not used
	; mov cannot work from memory to memory
msgSign proc
	mov eax, offset zero
	mov edx, [esp + 4] 
	
	cmp edx, 0
	jl lblNeg
	jg lblPos
	ret
lblNeg:
	mov eax, offset negative
	ret
lblPos:
	mov eax, offset positive
	ret
msgSign endp

end start
