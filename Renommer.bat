@echo off 

:menu
cls

echo =====================
echo RENOMMER DES FICHIERS
echo =====================
echo. 
echo %1, veuillez fournir les parametres suivants : 
echo. 
echo 1) Ancien nom : %fichier%
echo 2) Nouveau nom : %nomNouveauFichier%
echo r) Renommer le(s) fichier(s) ou le dossier
echo m) Menu principale
echo. 
echo Votre choix (1, 2, r ou m) : 
set /p choixParametres= 
echo. 

if "%choixParametres%" == "1" goto choixParametres1

if "%choixParametres%" == "2" goto choixParametres2

if "%choixParametres%" == "r" goto choixParametresr

if "%choixParametres%" == "m" goto choixParametresm

:choixParametres1
cls
echo Veuillez entrer les noms du ou des fichier(s) a renommer : (l'arborescence au complet)
set /p fichier=
if "%fichier%" == "" (
	:choixParametres1error
    echo Le nom du fichier ou du dossier est vide, veuillez recommencer
	pause
	goto choixParametres1
)
if not exist "%fichier%" (
	echo Le fichier ou le dossier est introuvable, veuillez recommencer
	pause
	goto choixParametres1
)
echo. 
goto menu

:choixParametres2
cls
echo. Entrer le nouveau nom du fichier ou du dossier : (simplement le nom)
set /p nomNouveauFichier=
if "%nomNouveauFichier%" == "" (
	:choixParametres2error
	echo Le nom du fichier ou du dossier est vide, veuillez recommencer
	pause
	goto choixParametres2
)
echo. 
goto menu

:choixParametresr
cls
rem Vérifie si l'utilisateur a bien rentré toute les informations
if "%fichier%" == "" goto choixParametres1error
if "%nomNouveauFichier%" == "" goto choixParametres2error

rem MANIPULATION POUR RENOMMER LES FICHIERS
ren "%fichier%" "%nomNouveauFichier%"

set fichier=
set nomNouveauFichier=
echo.
goto menu

:choixParametresm
cls
rem Programme finit, revenir au fichier Examen.bat