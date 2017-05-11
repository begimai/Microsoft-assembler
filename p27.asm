.386 

.model flat, stdcall 

include kernel32.inc
includelib kernel32.lib
includelib msvcrt.lib

scanf proto c
printf proto c

.data 

	printRow	byte	"%6d ", 0
	scanNum		byte	"%d", 0	
	frmtStr2	byte	 13, 10, 0

.code
start:	
	sub esp, 4 ;reserve place for n
	
	mov esi, 1 ;int i = 1
	mov edi, 1 ;int j = 1
	
	;read an integer n
	push esp
	push offset scanNum 
	call scanf
	add esp, 8
labBeg:	
	;multiplication
	mov eax, esi	
	imul edi
	
	;output the product
	push eax
	push offset printRow
	call printf
	add esp, 8
	
	;j++
	inc edi
	cmp edi, [esp]
	jg labInc
	jmp labBeg
	
labInc:
	;end of line 
	push offset frmtStr2
	call printf
	add esp, 4
	
	;i++
	inc esi
	cmp esi, [esp]
	jg labEnd
	mov edi, 1 ; j = 1
	jmp labBeg
	
labEnd:	
	push 0 
	call ExitProcess ;вызов функции

end start
