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

;2. Sa se scrie un program pentru calculul sumei unui sir de numere ıntregi reprezentate
;pe octet.

.data
sir db 2, 4, 7, 10, 15, 5, 20
contor db 7
.code
start:
mov edi,0
mov eax,0
mov esi,0
mov dl,contor
;facem o instructiune for folosindu-ne de flags
et_for:
add al,[sir+esi]
add esi,1
dec dl
cmp dl,0
jg et_for
push 0
	call exit
end start