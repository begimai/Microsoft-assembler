.386P  ; type of processor

.model flat, stdcall ; for windows - flat

include kernel32.inc
includelib kernel32.lib
includelib msvcrt.lib

scanf proto c
puts proto c

.data
	msgMorning			byte	"Good morning!", 0
	msgAfternoon		byte	"Good afternoon!", 0
	msgEvening			byte	"Good evening!", 0
	
	frmtStr 			byte	"%d", 0
	
.code
start:
	sub esp, 4
	
	push esp
	push OFFSET frmtStr
	call scanf
	add esp, 8
	
	;push [esp] ; копия значения, не адрес
	call sayGreeting
	
	add esp, 4
	
	push 0
	call ExitProcess
	
	
sayGreeting proc
	mov eax, offset sayGoodEvening
	mov ecx, [esp + 4]
	cmp ecx, 12
	jge labElseIf
	mov eax, offset sayGoodMorning
	jmp lblEnd
labElseIf:
	cmp ecx, 18
	mov edx, offset sayGoodAfternoon
	cmovl eax, edx
lblEnd:
	; call eax	; eax has the address of the function
	; ret
	jmp eax
	; the return value is on the top of stack
	; it will be used in RET of called function
sayGreeting endp
	
	
sayGoodMorning proc
	push offset msgMorning
	call puts
	add esp, 4
	ret
sayGoodMorning endp


sayGoodAfternoon proc
	push offset msgAfternoon
	call puts
	add esp, 4
	ret
sayGoodAfternoon endp


sayGoodEvening proc
	push offset msgEvening
	call puts
	add esp, 4
	ret
sayGoodEvening endp

end start
