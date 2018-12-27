Import-Module $PSScriptRoot\Module.psm1

$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())

if(!$currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
    echo "Failure: this command prompt needs elevated rights to execute, please execute it again with admin rights."
    pause
    exit
}

$config = Get-Content -Raw -Path $PSScriptRoot\_user\personalconfig.json | ConvertFrom-Json

echo "Installing and updating chocolatey..."
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

echo "Installing all apps..."
Install-Apps

echo $config.steam

echo "Installing steam games..."
Install-SteamGames $config.steam