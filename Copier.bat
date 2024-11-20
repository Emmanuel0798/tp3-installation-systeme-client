@echo off 

:menu
cls

echo ==============
echo COPIER DES FICHIERS
echo ==============
echo. 
echo %1, veuillez fournir les parametres suivants : 
echo. 
echo 1) Fichier(s) source : %fichier%
echo 2) Destination  : %destination%
echo 3) Inclure les sous-dossiers : %inclureSousDossier%
echo c) Copier le(s) fichier(s) 
echo m) Menu principal
echo. 
echo Votre choix (1, 2, 3, c ou m) : 
set /p choixParametres= 
echo. 

if "%choixParametres%" == "1" goto choixParametres1

if "%choixParametres%" == "2" goto choixParametres2

if "%choixParametres%" == "3" goto choixParametres3

if "%choixParametres%" == "c" goto choixParametresc

if "%choixParametres%" == "m" goto choixParametresm

:choixParametres1
cls
echo Entre le nom du ou des fichier(s) source : 
set /p fichier=
echo. 
if "%fichier%" == "" (
    echo Le nom du fichier est vide, veuillez recommencer
    pause
    echo.
    goto choixParametres1
)
if not exist "%fichier%" (
    echo Fichier introuvable, veuillez recommencer
    pause
    echo.
    goto choixParametres1
)
goto menu

:choixParametres2
cls
echo Entrer la destination du fichier que vous voulez copier : 
set /p destination=
echo. 
if "%destination%" == "" (
    echo La destination est vide, veuillez recommencer
    pause
    echo.
    goto choixParametres2
)
goto menu

:choixParametres3
cls
echo Voulez-vous inclure des sous-dossiers ? : (o/n) 
set /p inclureSousDossier=
echo.
if not "%inclureSousDossier%" == "o" if not "%inclureSousDossier%" == "n" (
    echo Vous avez choisi un mauvais parametre, veuillez recommencer
    pause
    echo.
    goto choixParametres3
)
goto menu

:choixParametresc
cls
rem MANIPULATION POUR COPIER LES FICHIERS
echo.
set fichier=
set destination=
set inclureSousDossier=
goto menu 

:choixParametresm
cls
rem Programme finit, revenir au fichier Examen.bat