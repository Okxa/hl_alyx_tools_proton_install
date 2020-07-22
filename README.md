# Installation script for a separate install of HL: Alyx SDK tools.

This script installs the Windows version Half-Life: Alyx and its workshop tools DLC with SteamCMD, and installs a patched Proton to allow the tools to run.

## Why?

Yes, you could just set HL:Alyx to use Proton in your steam client, but this **allows keeping the linux version installed at the same time**

## Dependencies

1. steamCMD - required

## What it does:

The script is fairly self-explanatory, but mainly:

1. If existing install path is specified, it copies the `game` -folder to the specified install folder.
2. It uses steamCMD to install the Windows version of the HL:Alyx, with the Workshop tools DLC.
3. It downloads [a patched version of proton](https://github.com/stevenlafl/Proton/releases/tag/proton-5.0-7-alyx-2) by **stevenlafl** and extracts it to `~/.steam/root/compatibilitytools.d/`
4. It tells you to add the tools as a non steam game (as it cannot be automated), see [After running the script](#after-running-the-script)

## Usage

`. hl_alyx_tools_proton_install.sh STEAM_USERNAME INSTALL_LOCATION EXISTING_GAME_LOCATION`

Where:

```
STEAM_USERNAME          Your steam accounts (Which has HL: Alyx), username, for SteamCMD login

INSTALL_LOCATION        Where you want to install the game. For example: "/mnt/HDD/Games/hl_alyx_tools_proton/"

EXISTING_GAME_LOCATION  If you have HL: Alyx (Either Windows or Linux version) installed
                        we can copy common files to save on download time/bandwidth.
                        For example: "/mount/HDD/Games/Steam/SteamApps/common/Half-Life Alyx/"
```

### After running the script

1. Restart Steam
2. Add `/game/bin/win64/hlvrcfg.exe` to steam as a non steam game
3. Set it to use `proton-5.0-7-alyx-2`
4. Set launch options: `%command% -steam -retail`
