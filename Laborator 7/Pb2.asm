.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern printf: proc


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date
adresa dd 0
format db "%d",0
format2 db "%s",0
afis db "1=prim; 0=neprim",10,13,0
.code

divizibil PROC
push EBP
mov EBP, ESP
sub ESP,0
push edx
push ecx
mov edx,0
div ecx
cmp edx,0
je divi
mov eax,0
jmp final
divi:
mov eax,1
final:
pop ecx
pop edx
mov esp,ebp
pop ebp
ret 8
divizibil endp

prim PROC

push ebp
mov ebp,esp
sub esp,0

;SALVAM VALORILE REGISTRILOR PE STIVA:
push ebx
mov ebx,[ebp+4]
mov adresa,ebx
pop ebx
push ebx
push ecx
push edx

mov ebx, [ebp+8];in ebx tinem minte numarul
cmp ebx, 2 
je win
cmp ebx, 3 
je win
;AFLAM JUMATATEA NR:
mov edx,0
mov ecx,2
mov eax,ebx
div ecx
mov ecx,eax;ecx=n/2
mov edx,0
inc ecx
;Calculul pe rand al numerelor care pot fi divizori

verif:
dec ecx
mov eax, ebx
call divizibil
cmp eax,1
je neprim
cmp ecx,2
jbe win
jmp verif

neprim:
mov eax,0
jmp final

win:
mov eax,1
jmp final

final:
pop edx
pop ecx
pop ebx


mov esp,ebp
pop ebp
push adresa
ret
prim endp

afisare MACRO nr
push nr
push offset format
call printf
add esp,8
endm

start:
	push offset afis
	push offset format2
	call printf
	mov ebx, 2
	mov edx, 4
	mov eax, 39
	mov ecx,10
	push eax
	call prim
	
	add esp,8
	afisare eax
	;terminarea programului
	push 0
	call exit
end start
