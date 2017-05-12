.686 

.model flat, stdcall 

include kernel32.inc
includelib kernel32.lib
includelib msvcrt.lib

printf proto c

.data 

	frmtStr			byte	"%d", 13, 10, 0
	a				dword	4, 1, 3, 2, -10, 12
	
	
.code
start:
	push offset cmpInts
	push 6
	push 4
	push offset a
	call minElem
	
	push [eax]
	push offset frmtStr
	call printf
	
	add esp, 24
	
	push 0 
	call ExitProcess 

cmpInts proc
	mov ecx, [esp + 4]
	mov edx, [esp + 8]
	mov eax, [ecx]
	sub eax, [edx]
	ret
cmpInts endp

minElem proc
	push esi ;adress of current min 
	push edi ;adress of current element
	push ebx ;adress of cmp function
	
	mov ebx, [esp + 28]
	mov edx, [esp + 24] ;num of elements in array
	mov esi, [esp + 16]
	mov eax, [esp + 20] ; eax - num of bytes in one element
	mov edi, esi 
	add edi, eax
	mov ecx, 1 ;is variable i

labFor:
	cmp ecx, edx
	jge labEnd
	
	push eax
	push ecx
	push edx
	
	push esi
	push edi
	call ebx
	add esp, 8
	cmp eax, 0
	jge labNext
	
	mov esi, edi
	
labNext:	
	pop edx
	pop ecx
	pop eax
	
	add edi, eax
	inc ecx
	jmp labFor
labEnd:	
	mov eax, esi
	pop ebx
	pop edi
	pop esi
	ret
minElem endp
end start
