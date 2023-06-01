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

select      BYTE    "|                              Selecciona una opci�n                                |", 0AH, 0

mainmenu1   BYTE    "|                              (1.) Iniciar el juego                                |", 0Ah, 0
mainmenu2   BYTE    "|                              (2.) Ver Instrucciones                               |", 0Ah, 0
mainmenu3   BYTE    "|                              (3.) Salir del juego                                 |", 0Ah, 0

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
invoke printf, addr select
invoke printf, addr mainmenu1
invoke printf, addr mainmenu2
invoke printf, addr mainmenu3
invoke printf, addr space
invoke printf, addr separator
    

main endp
end