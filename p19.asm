.386  

.model flat, stdcall 

include kernel32.inc 
includelib kernel32.lib 
includelib msvcrt.lib

puts proto c

.code
start:
	call printHelloAgain
	
	push 0
	call ExitProcess
	
printHelloAgain proc
	sub esp, 6
	mov byte ptr [esp], 'H'
	mov byte ptr [esp + 1], 'e'
	mov byte ptr [esp + 2], 'l'
	mov byte ptr [esp + 3], 'l'
	mov byte ptr [esp + 4], 'o'
	mov byte ptr [esp + 5], 0
	
	;dword = 4 bytes
	;word = 2 bytes
	
	push esp
	call puts
	add esp, 10
	ret
printHelloAgain endp

end start
