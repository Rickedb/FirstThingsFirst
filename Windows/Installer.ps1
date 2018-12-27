function Install-Apps(){
    choco upgrade chocolatey

	
    #foreach ($app in $apps) {
       #choco install -y --ignore-checksums --install-directory $path $app
    #}
}

function Install-SteamGames($config){
    foreach($game in $config.steam_games)
    { 
        &"C:\Program Files (x86)\Steam\steamcmd.exe"  +login $config.steam_username $config.steam_password +force_install_dir $config.steam_path +app_update $game.appid +quit
        Start-Sleep -s 30
    }
}