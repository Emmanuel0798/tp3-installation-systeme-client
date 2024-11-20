@echo off 

:menu
cls

echo ==============
echo MENU PRINCIPAL
echo ==============
echo. 
echo Bonjour %1, indiquez l'action que vous desirez effecture
echo.
echo 1) Copier des fichiers
echo 2) Renommer des fichiers
echo 3) Supprimer des DOSSIERS 
echo q) Quitter 
echo. 
echo Votre choix (1, 2, 3 ou q) : 
set /p choix=
echo. 

if "%choix%" == "1" (
    call Copier.bat %1
    goto menu
)

if "%choix%" == "2" (
	call Renommer.bat %1
    goto menu
)

if "%choix%" == "3" (
	call Supprimer.bat %1
    goto menu
)

rem Si l'utilisateur n'utilise pas "1", "2" ou "3", alors cela signifie qu'il utilise forcément "q", ce qui est donc après les 3 if ci-dessus, donc pas besoin d'en fait une condition
echo %1, etes-vous certain de vouloir quitter (o/n) ? : 
set /p choixQuitter=
echo.
if "%choixQuitter%" == "o" goto end 
if "%choixQuitter%" == "n" goto menu

:end
echo Bye !!