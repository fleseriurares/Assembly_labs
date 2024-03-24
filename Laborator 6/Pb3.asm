.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern printf: proc
extern scanf: proc
extern rand: proc


extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data

msg db "Scrieti un numar:",10,13,0
msg_l db "mai mic",10,13, 0
msg_h db "mai mare",10,13, 0
msg_win db "Ai ghicit numarul,felicitari!",10,10
format db "%s",0
format2 db "%d",0
nr_incerc db "Nr. incercari:",0
ct db 0
x db 0

.code
start:

	;afisare mesaj de start
	push offset msg
	push offset format
	call printf
	add esp,8

	;calcularea unui nr. random:
	
	mov eax,0
	mov ecx,0
	mov edx,0
	call rand
	ror ecx,16
	mov al,cl
	mov ebx,3
	div ebx
	mov ebx,eax
	
	
	mov ecx,0 ;contor
	push ecx
	;eax(al) avem nr random
	principal:
	pop ecx
	inc ecx
	push ecx
	push offset x
	push offset format2
	call scanf
	add esp,8
	mov ecx,0
	mov cl,x
	cmp bl,cl
	jb et1
	ja et2
	push offset msg_win
	push offset format
	call printf
	add esp,8
	jmp final
	
	et1:
	push offset msg_l
	push offset format
	call printf
	add esp,8
	jmp principal
	
	et2:
	push offset msg_h
	push offset format
	call printf
	add esp,8
	jmp principal
	
	final:

	push offset nr_incerc
	push offset format
	call printf
	add esp,8
	
	pop eax
	push eax
	push offset format2
	call printf
	add esp,8
	
	push 0
	call exit
end start
