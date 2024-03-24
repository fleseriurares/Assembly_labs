.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
SIR DB 7, 10, 10, 10
MEDIA DB 0
.code
start:
;vom calcula suma in EAX:
mov eAX, 0
mov esi, 0
mov ecx,4
MOV EDX,0
;facem suma fiecarui element:

l1:
add AL,[SIR+ESI]
inc ESI
loop l1

;impartim suma elementelor la numarul lor
mov cl,4
div CL
mov MEDIA,al
push 0
	call exit
end start
