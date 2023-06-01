;|----------------------------------------------------------------------|
;| Universidad del Valle de Guatemala                                   |
;| José Pablo Orellana - 21970 | Diego Alberto Leiva - 21752            | 
;| Proyecto 04 - Organización de Computadoras y Assembler               |
;|----------------------------------------------------------------------|
;| Acertijo Pastor: Consiste en el diseño de un juego de acertijos      |
;| en el que un pastor tiene que atravesar a la otra orilla de un       |
;| río con un lobo, una cabra y una lechuga. Dispone de una barca       |
;| en la que solo caben él y una de las otras tres cosas. Si el lobo    |
;| se queda solo con la cabra se la come, si la cabra se queda sola con | 
;| la lechuga se la come. ¿Cómo debe hacerlo?                           |
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

separator	BYTE	"|===================================================================================|", 0Ah, 0

space		BYTE	"|                                                                                   |", 0Ah, 0


title0		BYTE	"|                     _____ ______ _____ _______ _____     _  ____                  |", 0Ah, 0
title1		BYTE	"|               /\   / ____|  ____|  __ \__   __|_   _|   | |/ __ \                 |", 0Ah, 0
title2		BYTE	"|              /  \ | |    | |__  | |__) | | |    | |     | | |  | |                |", 0Ah, 0
title3		BYTE	"|             / /\ \| |    |  __| |  _  /  | |    | | _   | | |  | |                |", 0Ah, 0
title4		BYTE	"|            / ____ \ |____| |____| | \ \  | |   _| || |__| | |__| |                |", 0Ah, 0
title5		BYTE	"|           /_/    \_\_____|______|_|  \_\ |_|  |_____\____/ \____/                 |", 0Ah, 0


title6      BYTE    "|             _      _       _____         _____ _______ ____  _____                |", 0Ah, 0
title7      BYTE    "|            | |    | |     |  __ \ /\    / ____|__   __/ __ \|  __ \               |", 0Ah, 0
title8      BYTE    "|          __| | ___| |     | |__) /  \  | (___    | | | |  | | |__) |              |", 0Ah, 0
title9      BYTE    "|         / _` |/ _ \ |     |  ___/ /\ \  \___ \   | | | |  | |  _  /               |", 0Ah, 0
title10     BYTE    "|        | (_| |  __/ |     | |  / ____ \ ____) |  | | | |__| | | \ \               |", 0Ah, 0
title11     BYTE    "|         \__,_|\___|_|     |_| /_/    \_\_____/   |_|  \____/|_|  \_\              |", 0Ah, 0


logo0		BYTE	"|           / \      _-'                  __  _                      _ _            |", 0Ah, 0
logo1		BYTE	"|         _/|  \-''- _ /               .-:'  `; `-._              .-( : )-.         |", 0Ah, 0
logo2		BYTE	"|    __-' { |          \              (_,           )            (   \'/   )        |", 0Ah, 0
logo3		BYTE	"|        /             \            ,'o''(           )>         ( `'.;;;.'` )       |", 0Ah, 0
logo4		BYTE	"|        /      ''o.  |o }         (__,-'            )         ( :-=;;;;;=-: )      |", 0Ah, 0
logo5		BYTE	"|        |            \ ;             (             )           (  .';;;'.  )       |", 0Ah, 0
logo6		BYTE	"|                      ',              `-'._.--._.-'             (`  /.\  `)        |", 0Ah, 0
logo7		BYTE	"|           \_         __\                |||  |||                '-(_:_)-'         |", 0Ah, 0
logo8		BYTE	"|             ''-_    \.//                                                          |", 0Ah, 0
logo9		BYTE	"|               / '-____'                                                           |", 0Ah, 0
logo10		BYTE	"|              /                                                                    |", 0Ah, 0

welcome		BYTE	"|               Bienvenido al acertijo del lobo la obeja y la lechuga               |", 0Ah, 0 

home        BYTE    "|                                  MENU PRINCIPAL                                   |", 0Ah, 0

select      BYTE    "|                              Selecciona una opcion: ", 0

mainmenu1   BYTE    "|                              (1.) Iniciar el juego                                |", 0Ah, 0
mainmenu2   BYTE    "|                              (2.) Ver Instrucciones                               |", 0Ah, 0
mainmenu3   BYTE    "|                              (3.) Salir del juego                                 |", 0Ah, 0

finish      BYTE    "|                               EL JUEGO HA TERMINADO                               |", 0Ah, 0


message1		BYTE	"|               Bienvenido al acertijo del lobo la obeja y la lechuga               |", 0Ah, 0
message2		BYTE	"|                    Aqui podras ver las instrucciones del juego                    |", 0Ah, 0
message3		BYTE	"|  Un pastor tiene que atravesar a la otra orilla de un rio con un lobo, una oveja  |", 0Ah, 0
message4		BYTE	"|   y una lechuga Dispone de una barca en la que solo caben el y una de las otras   |", 0Ah, 0
message5		BYTE	"|  Si el lobo se queda solo con la cabra se la come, si la cabra se queda sola con  |", 0Ah, 0
message6		BYTE	"|                              la lechuga se la come.                               |", 0Ah, 0
message7		BYTE	"|                                COMO DEBE HACERLO?                                 |", 0Ah, 0
message8		BYTE	"|    A continuacion debera ingresar, cual sera el primer objeto en cruzar el rio    |", 0Ah, 0
message9		BYTE	"|                                     1) Lobo                                       |", 0Ah, 0
message10		BYTE	"|                                     2) Oveja                                      |", 0Ah, 0
message11		BYTE	"|                                     3) Lechuga                                    |", 0Ah, 0


message12		BYTE	"|                   Ingresa el numero 1 para iniciar con el juego:", 0
message13		BYTE	"|                        Ingreso un numero que no es valido                         ", 0Ah, 0
pru     		BYTE	"                                       Prueba                                       ", 0Ah, 0


dato1   db "%d", 0
Inicio1 dd 0

.code

public main
main proc

invoke printf, addr separator
invoke printf, addr space
invoke printf, addr title0
invoke printf, addr title1
invoke printf, addr title2
invoke printf, addr title3
invoke printf, addr title4
invoke printf, addr title5
invoke printf, addr space
invoke printf, addr title6
invoke printf, addr title7
invoke printf, addr title8
invoke printf, addr title9
invoke printf, addr title10
invoke printf, addr title11
invoke printf, addr space
invoke printf, addr separator
invoke printf, addr space
invoke printf, addr logo0
invoke printf, addr logo1
invoke printf, addr logo2
invoke printf, addr logo3
invoke printf, addr logo4
invoke printf, addr logo5
invoke printf, addr logo6
invoke printf, addr logo7
invoke printf, addr logo8
invoke printf, addr logo9
invoke printf, addr logo10
invoke printf, addr space
invoke printf, addr separator
invoke printf, addr space
invoke printf, addr welcome
invoke printf, addr space
invoke printf, addr separator
invoke printf, addr space
invoke printf, addr home
invoke printf, addr space
invoke printf, addr mainmenu1
invoke printf, addr mainmenu2
invoke printf, addr mainmenu3
invoke printf, addr space
invoke printf, addr separator




    sub esp, 4	
    push offset select
    call printf

    lea eax, [ebp - 4]			;Obtenemos la dirección donde se guardara el numero ingresado
    push eax					;Se da la dirección donde se guardara el dato
    push offset dato1    		;Dato a ingresar
    call scanf

    mov eax, [ebp - 4]		    ;Movemos el dato ingresado al registro
    mov Inicio1, eax			;Movemos el dato a la variable Inicio1


   
	.IF Inicio1 == 1 
		;Programar Juego



	.ELSEIF Inicio1 == 2 
		;Instrucciones
        invoke printf, addr space
        invoke printf, addr separator
        invoke printf, addr message1
        invoke printf, addr message2
        invoke printf, addr separator
        invoke printf, addr message3
        invoke printf, addr message4
        invoke printf, addr message5
        invoke printf, addr message6
        invoke printf, addr message7

        sub esp, 4	
        push offset message12
        call printf

        lea eax, [ebp - 4]			;Obtenemos la dirección donde se guardara el numero ingresado
        push eax					;Se da la dirección donde se guardara el dato
        push offset dato1    		;Dato a ingresar
        call scanf

        mov eax, [ebp - 4]		    ;Movemos el dato ingresado al registro
        mov Inicio1, eax			;Movemos el dato a la variable Inicio1

        mov eax, Inicio1
        mov ebx, 1
        cmp eax, ebx
        je lp1
        jne lp2

        lp1:
            ;Inicia el Juego
            invoke printf, addr pru
            jmp endl

        lp2: 
            ;Mensaje de Error
            invoke printf, addr separator
            invoke printf, addr message13
            invoke printf, addr separator

        endl:
            RET



	.ELSEIF Inicio1 == 3   
		;Salir
        invoke printf, addr separator
        invoke printf, addr finish
        invoke printf, addr separator


	.ENDIF


    

main endp
end

















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

sepa		BYTE	"|===================================================================================|", 0Ah, 0
enca		BYTE	"|                     __ ___ __ ___ __     _  __                  |", 0Ah, 0
enca1		BYTE	"|               /\   / _|  __|  _ \__   _|   |   | |/ _ \                 |", 0Ah, 0
enca2		BYTE	"|              /  \ | |    | |_  | |_) | | |    | |     | | |  | |                |", 0Ah, 0
enca3		BYTE	"|             / /\ \| |    |  __| |  _  /  | |    | | _   | | |  | |                |", 0Ah, 0
enca4		BYTE	"|            / __ \ |_| |_| | \ \  | |   | || || | |_| |                |", 0Ah, 0
enca5		BYTE	"|           //    \\__|__||  \_\ ||  |_\_/ \__/                 |", 0Ah, 0
espa		BYTE	"|                                                                                   |", 0Ah, 0
enca6		BYTE	"|           / \      -'                  _  _                      _ _            |", 0Ah, 0
enca7		BYTE	"|         /|  \-''- _ /               .-:'  `; `-.              .-( : )-.         |", 0Ah, 0
enca8		BYTE	"|    _-' { |          \              (,           )            (   \'/   )        |", 0Ah, 0
enca9		BYTE	"|        /             \            ,'o''(           )>         ( `'.;;;.'` )       |", 0Ah, 0
enca10		BYTE	"|        /      ''o.  |o }         (__,-'            )         ( :-=;;;;;=-: )      |", 0Ah, 0
enca11		BYTE	"|        |            \ ;             (             )           (  .';;;'.  )       |", 0Ah, 0
enca12		BYTE	"|                      ',              `-'..--..-'             (`  /.\  `)        |", 0Ah, 0
enca13		BYTE	"|           \_         _\                |||  |||                '-(:_)-'         |", 0Ah, 0
enca14		BYTE	"|             ''-_    \.//                                                          |", 0Ah, 0
enca15		BYTE	"|               / '-__'                                                           |", 0Ah, 0
enca16		BYTE	"|              /                                                                    |", 0Ah, 0


 
msg1		BYTE	"|               Bienvenido al acertijo del lobo la obeja y la lechuga               |", 0Ah, 0
msg2		BYTE	"|                    Aqui podras ver las instrucciones del juego                    |", 0Ah, 0
msg3		BYTE	"|  Un pastor tiene que atravesar a la otra orilla de un rio con un lobo, una oveja  |", 0Ah, 0
msg4		BYTE	"|   y una lechuga Dispone de una barca en la que solo caben el y una de las otras   |", 0Ah, 0
msg5		BYTE	"|  Si el lobo se queda solo con la cabra se la come, si la cabra se queda sola con  |", 0Ah, 0
msg6		BYTE	"|                              la lechuga se la come.                               |", 0Ah, 0
msg7		BYTE	"|                               ¿COMO DEBE HACERLO?                                 |", 0Ah, 0
msg8		BYTE	"|    A continuacion debera ingresar, cual sera el primer objeto en cruzar el rio    |", 0Ah, 0
msg9		BYTE	"|                                     1) Lobo                                       |", 0Ah, 0
msg10		BYTE	"|                                     2) Oveja                                      |", 0Ah, 0
msg11		BYTE	"|                                     3) Lechuga                                    |", 0Ah, 0



.code

public main
main proc

	invoke printf, addr sepa
    invoke printf, addr enca
    invoke printf, addr enca1
    invoke printf, addr enca2
    invoke printf, addr enca3
    invoke printf, addr enca4
    invoke printf, addr enca5
    invoke printf, addr espa
    invoke printf, addr sepa
    invoke printf, addr sepa
    invoke printf, addr espa
    invoke printf, addr enca6
    invoke printf, addr enca7
    invoke printf, addr enca8
    invoke printf, addr enca9
    invoke printf, addr enca10
    invoke printf, addr enca11
    invoke printf, addr enca12
    invoke printf, addr enca13
    invoke printf, addr enca14
    invoke printf, addr enca15
    invoke printf, addr enca16
    invoke printf, addr sepa
    invoke printf, addr msg1
    invoke printf, addr msg2
    invoke printf, addr sepa
    invoke printf, addr msg3
    invoke printf, addr msg4
    invoke printf, addr msg5
    invoke printf, addr msg6
    invoke printf, addr msg7
    invoke printf, addr sepa
    invoke printf, addr msg8
    invoke printf, addr sepa
    invoke printf, addr msg9
    invoke printf, addr msg10
    invoke printf, addr msg11
    invoke printf, addr sepa



    

main endp
end