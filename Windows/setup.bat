title Setting up things
color 0a
cls
@echo off

set ini="G:\GitHub\FirstThingsFirst\Windows\personal.ini"
set path="G:\Program Files"

:check_permissions
	echo Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Administrative permissions confirmed.
        goto install_apps
    ) else (
        echo Failure: this command prompt needs elevated rights to execute, please execute it again with admin rights.
        pause
        exit
    )


:install_apps
	echo Installing and updating chocolatey...
	%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
	choco upgrade chocolatey

	
	echo %ini%
 	for /f "usebackq delims=" %%a in (%ini%) do (
 		echo %%a
 		choco install -y --ignore-checksums --install-directory %path% %%a
 	)

	pause
	