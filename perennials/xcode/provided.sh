#!/usr/bin/env bash
# File: xcode/provided.sh
# Author: Matt Manzi
# Date: 2021-12-20
#
# Adds custom themes to Xcode.
#
# Prerequisites:
# - FIG_HOME is set to the Fig Tree project directory.
#
# OS Supported: macOS

if [[ -z "${FIG_HOME+x}" ]]; then
    echo -ne "\033[38;5;160m"
    echo -e "[FATL] FIG_HOME variable not set!  Check that it is being defined."
    echo -e "\033[0m"
    read -p "Shell will exit on <return>"
    exit 1
fi

#### Includes
source "${FIG_HOME}/tool-shed/logger.bash"
source "${FIG_HOME}/tool-shed/linker.bash"
source "${FIG_HOME}/tool-shed/globals.bash"

# only run for macOS
if [[ "${FIG_OS}" == "${__FIG_MAC_OS}" ]]; then
    #### Globals
    __PERENNIAL_DIR="perennials/xcode"

    targetDirectory="${HOME}/Library/Developer/Xcode/UserData/FontAndColorThemes/"

    logTrace "Creating Xcode themes directory in case it doesn't exist (${targetDirectory})"
    mkdir -p "$targetDirectory"

    for sourceFile in "${FIG_HOME}/${__PERENNIAL_DIR}"/*.xccolortheme; do
        
        #### Globals, the rest
        __INSTALL_TARGET="${HOME}/Library/Developer/Xcode/UserData/FontAndColorThemes/$(basename "$sourceFile")"
        __SOURCE_FILE="$sourceFile"


        #### Main Script

        logDebug "Planting perennial: ${__PERENNIAL_DIR} (via cp)"
        logTrace "Install target: ${__INSTALL_TARGET} (via cp)"
        logTrace "Source file: ${__SOURCE_FILE} (via cp)"

        # need to copy because Xcode doesn't like links
        cp "$__SOURCE_FILE" "$__INSTALL_TARGET"

    done
else
    logDebug "Not planting xcode, current system is ${FIG_OS}"
fi
