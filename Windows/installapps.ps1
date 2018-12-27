choco upgrade chocolatey

$inifile = "G:\GitHub\FirstThingsFirst\Windows\personal.ini"
$path = "G:\Program Files"

$apps = New-Object System.Collections.Generic.List[string]

Get-Content $inifile | ForEach-Object {
    echo $_
    $apps.Add($_)
}
	
foreach ($app in $apps) {
   choco install -y --ignore-checksums --install-directory $path $app
}