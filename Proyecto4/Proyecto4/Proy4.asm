;|----------------------------------------------------------------------|
;| Universidad del Valle de Guatemala                                   |
;| Jos� Pablo Orellana - 21970 | Diego Alberto Leiva - 21752            | 
;| Proyecto 04 - Organizaci�n de Computadoras y Assembler               |
;|----------------------------------------------------------------------|
;| Acertijo Pastor: Consiste en el dise�o de un juego de acertijos      |
;| en el que un pastor tiene que atravesar a la otra orilla de un       |
;| r�o con un lobo, una cabra y una lechuga. Dispone de una barca       |
;| en la que solo caben �l y una de las otras tres cosas. Si el lobo    |
;| se queda solo con la cabra se la come, si la cabra se queda sola con | 
;| la lechuga se la come. �C�mo debe hacerlo?                           |
;|----------------------------------------------------------------------|


.386
.model flat, stdcall, c
.stack 4096

includelib libcmt.lib
includelib libvcruntime.lib
includelib libucrt.lib
includelib legacy_stdio_definitions.lib

.model flat, C

printf proto c : vararg
scanf  proto c : vararg


.data


.code

public main
main proc


    

main endp
end