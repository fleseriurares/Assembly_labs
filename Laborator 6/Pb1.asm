.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern printf: proc
extern scanf: proc
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
msg db "Scrieti 2 numere",10,0
msg1 db "nr1= ",0
msg2 db "nr2= ",0
format db "%d",0
nr1 db 0
nr2 db 0
.code
start:

	push offset msg
	call printf
	add ESP,4
	
	;citim primul nr:
	push offset msg1
	call printf
	add ESP,4
	
	push offset nr1
	push offset format
	call scanf
	add ESP,8
	
	;citim al doilea nr:
	push offset msg2
	call printf
	add ESP,4
	
	push offset nr2
	push offset format
	call scanf
	add ESP,8
	
	;facem suma celor 2 nr:
	mov EBX,0
	mov ECX,0
	mov CL,nr1
	mov BL,nr2
	add CX,BX

	;afisam rezultatul:
	push ECX
	push offset format
	call printf
	add ESP, 8
	

	push 0
	call exit
end start
