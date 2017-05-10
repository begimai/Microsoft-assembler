.386  ; type of processor

.model flat, stdcall ; for windows - flat

include kernel32.inc  ; for exit
includelib kernel32.lib ; where libs are
includelib msvcrt.lib

puts proto c
scanf proto c

.data 
	StrFrmt1		byte	"%d%d%d", 0
	inRange			byte	"in range", 0
	outRange		byte	"out of range", 0

.code
start:
	push ebp
	mov ebp, esp
	sub esp, 12
	
	lea eax, [esp - 4]  ;a
	push eax
	lea eax, [esp - 8]  ;b
	push eax
	lea eax, [ebp - 12] ;c
	push eax
	push offset StrFrmt1
	call scanf
	
	push [ebp - 8]  ;b
	push [ebp - 12] ;a
	push [ebp - 4]  ;c
	call msgInRange
	
	push eax
	call puts
	
	mov esp, ebp
	pop ebp
	
	push 0
	call ExitProcess
	
	;ebp, esp
	;esi, edi, ebp, esp
msgInRange proc
	mov eax, offset inRange
	mov edx, [esp + 4] ; edx = c, [esp + 8] = a, [esp + 12]
	cmp edx, [esp + 8] ;
	jl lblIf
	cmp [esp + 12], edx
	jl lblIf
	ret
lblIf:
	mov eax, offset outRange
	ret
msgInRange endp

end start 
