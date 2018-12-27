$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())

if(!$currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
    echo "Failure: this command prompt needs elevated rights to execute, please execute it again with admin rights."
    pause
    exit
}

echo "Installing and updating chocolatey..."
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))