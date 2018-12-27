$Global:SysinternalsFolder = "$PSScriptRoot\SysinternalsSuite"

.  $PSScriptRoot\Installer.ps1

Export-ModuleMember Install-Apps
Export-ModuleMember Install-SteamGames