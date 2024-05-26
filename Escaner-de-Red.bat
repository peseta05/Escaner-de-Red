@echo off
title Escaner de Red

:Menu
cls
echo Seleccione su opcion tecleando el numero respectivo:
echo.
echo 1. red.red.red.host/24
echo 2. red.red.host.host/16
echo 3. red.host.host.host/8
echo 4. Salir

set /p var=
if %var%==1 goto :Primero
if %var%==2 goto :Segundo
if %var%==3 goto :tercero
if %var%==4 goto exit
if %var% GTR 3 echo Error
goto :Menu

:Primero
ipconfig
set /p ipred=Escribe la direccion de Red:
for /l %%i in (1,1,254) do  ( 
    ping -w 200 -n 1 %ipred%.%%i
)
arp -a
pause
goto :Menu

:Segundo
ipconfig
set /p ipred=Escribe la direccion de Red:
for /l %%h in (1,1,255) do (
	for /l %%i in (1,1,254) do  ( 
   		 ping -w 200 -n 1 %ipred%.%%h.%%i
	)
)
arp -a
pause
goto :Menu

:Tercero
ipconfig
set /p ipred=Escribe la direccion de Red:
for /l %%g in (1,1,255) do 
	for /l %%h in (1,1,255) do (
		for /l %%i in (1,1,254) do  ( 
			ping -w 200 -n 1 %ipred%.%%g.%%h.%%i
		)
	)
)
arp -a
pause
goto :Menu