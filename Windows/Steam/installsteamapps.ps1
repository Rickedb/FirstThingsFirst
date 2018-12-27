$json = Get-Content -Raw -Path "G:\GitHub\FirstThingsFirst\Windows\Steam\steamapps.json" | ConvertFrom-Json


foreach($game in $json.games)
{
    echo $game
    Start-Process "steam://install/$game.appid"
}

