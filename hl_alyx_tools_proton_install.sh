#!/bin/bash
# script to install hl:alyx workshop tools and the windows version side by side with the linux version using steamcmd
usage="hl_alyx_tools_proton_install.sh STEAM_USERNAME INSTALL_LOCATION EXISTING_GAME_LOCATION"
if [ $# -eq 0 ]
  then
    echo -e "\nUsage: $usage"
	echo -e '\nSTEAM_USERNAME\nYour steam accounts (Which has HL: Alyx), username, for SteamCMD login\n\n'\
	     'INSTALL_LOCATION\nWhere you want to install the game. For example: "/mnt/HDD/Games/hl_alyx_tools_proton/"\n\n'\
		 'EXISTING_GAME_LOCATION\nIf you have HL: Alyx (Either Windows or Linux version) installed we can copy common files to save on download time/bandwidth.\n For example: "/mount/HDD/Games/Steam/SteamApps/common/Half-Life Alyx/"\n\n'
	return
fi
if ! command -v steamcmd &> /dev/null
then
    echo "steamcmd could not be found, exiting."
	return
fi
if [ -z "$2" ]
    then
	  installpath="$(pwd)/"
      echo "No install location, using current folder: ${installpath}"
else
    installpath=${2}
	echo "Installing at: ${installpath}"
fi

if [ -z "$3" ]
    then
	  echo "No existing location for a game supplied, instead downloading all from steam."
else
    gamefilespath="${3}game/"
    echo "Copying game folder ${gamefilespath} to ${installpath}"
	cp -rn "${gamefilespath}" "${installpath}"
fi

steamcmd +@sSteamCmdForcePlatformType windows +login "$1" +force_install_dir "${installpath}"  +app_set_config 546560 optionaldlc "1295040" +app_update 546560 +quit
steamcmd +@sSteamCmdForcePlatformType windows +login "$1" +force_install_dir "${installpath}"  +app_update 546560 validate +quit

echo -e "\n\nInstalling custom proton proton-5.0-7-alyx-2 to allow tools to work..."

wget https://github.com/stevenlafl/Proton/releases/download/proton-5.0-7-alyx-2/proton-5.0-7-alyx-2.tar.gz
tar -xf proton-5.0-7-alyx-2.tar.gz -C ~/.steam/root/compatibilitytools.d/

echo -e "\nTo finish\n1. Restart Steam\n2. Add ${installpath}game/bin/win64/hlvrcfg.exe to steam as a non steam game\n3. Set it to use proton-5.0-7-alyx-2\n4. Set launch options: %command% -steam -retail"
