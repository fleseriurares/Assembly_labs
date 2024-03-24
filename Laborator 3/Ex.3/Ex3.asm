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

;3. Instruct, iunea bswap (Byte Swap) inverseaz˘a octet, ii unui registru.
; Dac˘a ˆın EAX avem valoarea 12345678h, prin apelul bswap EAX, registrul va cont,
; ine 78563412h.Implementat, i aceast˘a operat, ie folosind instruct, 
;iuni de rotat, ie (rol, ror) s, i interschimbare (xchg).

.code
start:
	mov EAX, 12345678h
	;Vom interschimba pe rand octetii partii mai semnificative cu cei a partii mai putin semnificative
	xchg al, ah
	;repetam aceeasi operatie, insa cu partea extinsa a registrului
	;pentru asta vom aduce acea parte la dreapta
	rol eax,16
	xchg al,ah
	
	
	;apel functie exit
	push 0
	call exit
end start