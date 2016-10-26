# Civilization IV : Rise of Mankind - A New Dawn, Mega Civilization Pack

## Instructions for players

**Description** 

The Mega Civilization Pack add more than 100 new civilizations to the game. Each civilization has at least 2 Leaders, one UU (unique unit) and one UB (unique building), which all are balanced for use with the expansion pack "A New Dawn". All these new nations will bring an incredible diversity to the game!

**Installation / update instructions**

- Download the latest full installer and the latest patch if available.
- Latest full installer: [version 1.7](https://sourceforge.net/projects/anewdawn/files/MegaCivPack/rand_mcp_full_installer_2016-06_1.7.exe/download)
- Latest patch: [version 1.7 -> 1.8](https://sourceforge.net/projects/anewdawn/files/MegaCivPack/rand_mcp_patch_1.7_to_1.8.exe/download)
- Install using both installer and patch (if any) to the Rise of Mankind mod folder.
- Start the launcher and click on "Community -> Modules -> Mega Civ Pack" to enable/disable the mod.

**Credits**

_All credits for the main mod are available on our website: http://anewdawn.sourceforge.net/_

- Generalstaff: initial creation of the mega civ. pack for Rise of Mankind.
- Maska_gzg: update to the "A New Dawn" standards and the maintenance of the mod.
- 45°38'N-13°47'E, Sogroon, dbkblk: maintenance of the mod to the current "A New Dawn" standards.

## Instructions for developers

The requirements to contribute to this repository are:

- Autohotkey, https://autohotkey.com/
- git, https://git-scm.com/

Once Autohotkey is installed, just double-click the scripts to:

- create_new_installer.ahk, to create a new installer.
- create_patch_installer.ahk, to create a patch between different revisions.
- update_installer_translations.ahk, to update the installers translations.
- update_mod_translations.ahk, to update the mod translations.

To understand the details about the scripts, just open them with a text editor and read the comments (;).

**DON'T FORGET TO CHANGE TO MOD VERSION WHEN PUBLISHING A NEW REVISION**
Open "files\Assets\Modules\Custom_Civilizations_MCP\modInfo.xml" and increment <version>1.8.2</version>