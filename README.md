# PSA!

## Firstly

Nowadays (atleast after 2021.9.27), Proton Experimental seems to run the tools too.

But in that case you need to set "START IN" path for the non-steam game shortcut to the install folder (that folder where "content" & "game" folders are) to be able to edit addon content.

## Secondly

**There might be a issue with steam and non-steam games with proton.**

If the tools won't start, it is probably because for some reason steam [does not seem to set the various compat paths correctly](https://github.com/ValveSoftware/steam-runtime/issues/467)

The issue seems to be that Steam reads the `steam_appid.txt` from the install folder and if the appID is anything else than 0, proton fails to set the paths.

You can edit the `steam_appid.txt` to set the ID to 0, but it will reset every time. So unless this bug is fixed the workaround is to edit this file every time you start the tools, as it is recreated if deleted, and making it readonly won't work.

## Thirdly

**The tools won't work perfectly.** Many views flicker in editors, and for example trying to load maps in the engine **will probably crash**, the more likely the more complex the map is.

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

## Updating the game.

Simply run the script again with the same settings.
