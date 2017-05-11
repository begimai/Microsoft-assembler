.386  

.model flat, stdcall 

include kernel32.inc  
includelib kernel32.lib 
includelib msvcrt.lib

printf proto c

.data
	strFrmt		byte	"%d", 13, 10, 0
	a			dword 	9, -1, 7, 0, 10
	
.code
start:
	push offset cmpInts
	push 5							; number of elements
	push 4							; size of integer
	push offset a
	call minElement
	
	push [eax]
	push offset strFrmt
	call printf
	
	add esp, 24
	
	push 0
	call ExitProcess
	
minElement proc
	push esi						; address of current min
	push edi 						; address of current element
	push ebx						; adress of cmp function
	
	mov ebx, [esp + 28]
	; ebx now has the address of the comparison function
	mov eax, [esp + 20]				;elemSize
	; eax - size of integer = 4
	mov esi, [esp + 16]				;pMin 
	; esi now is the address of the first element of array
	mov edi, esi					;pCur
	add edi, eax
	; edi is the element after esi
	
	mov ecx, 1						;1
	; ecx - variable i
	mov edx, [esp + 24]				;len
	; edx - number of elements in array
	
lblFor:
	cmp ecx, edx
	jge lblEnd
	
	push eax
	push ecx
	push edx
	
	push esi
	push edi
	call ebx
	; call comparison function, the result is stored in eax
	add esp, 8 	
	
	pop edx
	pop ecx
	pop eax

	cmp eax, 0
	jge lblNext
	;else
	mov esi, edi
	
lblNext:
	
	inc ecx
	add edi, eax
	jmp lblFor
	
lblEnd:
	mov eax, esi
	;min stored in EAX after function call
	pop ebx
	pop edi
	pop esi
	ret
minElement endp

cmpInts proc
	mov ecx, [esp + 4] ;pCur
	mov edx, [esp + 8] ;pMin
	mov eax, [ecx]
	sub eax, [edx]
	; the result of comparison is stored in eax
	ret
cmpInts endp
end start
