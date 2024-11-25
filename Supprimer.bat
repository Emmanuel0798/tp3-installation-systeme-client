@echo off 

:menu
cls

echo =====================
echo SUPPRIMER DES DOSSIERS
echo =====================
echo. 
echo %1, veuillez fournir les parametres suivants : 
echo. 
echo 1) Dossier a supprimer : %dossier%
echo 2) Supprimer le dossier meme s'il contient des fichiers : %choixDelFichier%
echo s) Supprimer le dossier
echo m) Menu principal
echo. 
echo Votre choix (1, 2, s ou m) : 
set /p choixParametres= 
echo. 

if "%choixParametres%" == "1" goto choixParametres1

if "%choixParametres%" == "2" goto choixParametres2

if "%choixParametres%" == "s" goto choixParametress

if "%choixParametres%" == "m" goto choixParametresm

:choixParametres1
cls
echo Veuillez entrer le nom du dossier a supprimer
set /p dossier=
if "%dossier%" == "" (
    :choixParametres1error
    echo Le nom du dossier est vide, veuillez recommencer
    pause
    goto choixParametres1
)
if not exist "%dossier%" (
    echo Le dossier est introuvable, veuillez recommencer
    pause
    goto choixParametres1
)
echo. 
goto menu

:choixParametres2
cls
echo Voulez-vous supprimer le dossier meme s'il contient des fichiers ? : (o/n) 
set /p choixDelFichier=
echo.
if "%choixDelFichier%" == "" (
    :choixParametres2error
    echo Vous n'avez specifie s'il faut supprimer le dossier meme s'il contient des fichiers, veuillez recommencer
    pause
    echo.
    goto choixParametres2
)
if not "%choixDelFichier%" == "o" if not "%choixDelFichier%" == "n" (
    echo Vous avez choisi un mauvais parametre, veuillez recommencer
    pause
    echo.
    goto choixParametres2
)
goto menu


:choixParametress
cls
rem Vérifie si l'utilisateur a bien rentré toute les informations
if "%dossier%" == "" goto choixParametres1error
if "%choixDelFichier%" == "" goto choixParametres2error

rem MANIPULATION POUR SUPPRIMER LE DOSSIER
if "%choixDelFichier%" == "o" (
    rmdir /S /Q "%dossier%"
    echo. 
    echo Le dossier a ete supprimer avec succes
    pause
)

if "%choixDelFichier%" == "n" (
    rmdir 
)

set dossier=
set choixDelFichier=
echo.
goto menu


:choixParametresm
cls
rem Programme finit, revenir au fichier Examen.bat