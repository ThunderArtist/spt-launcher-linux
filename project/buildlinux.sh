#!/usr/bin/bash

buildFolder="../Build.Linux"
SPTDataFolder="../Build.Linux/SPT_Data"
launcherExeFolder="../SPT.Launcher/bin/Release/net9.0/linux-x64/publish"
launcherAssetFolder="../SPT.Launcher/SPT_Data"
licenseFile="../../LICENSE.md"

# Delete build folder and contents to ensure it's clean
if [ -d "$buildFolder" ]; then rm -rf "$buildFolder"; fi

# Create build folder and subfolders
foldersToCreate=("$buildFolder" "$SPTDataFolder")
for folder in "${foldersToCreate}"; do
    if [ ! -d "$folder" ]; then
        mkdir -p "$folder"
    fi
done

# Move built files to the build folder
cp -rf "$launcherExeFolder/SPT.Launcher.Linux" "$buildFolder"
cp -rf "$launcherAssetFolder" "$buildFolder"
# If any new DLLs need to be copied, add here

# Write the contents of the license file to a txt in the build folder
cat "$licenseFile" > "$buildFolder/LICENSE-Launcher.txt"
