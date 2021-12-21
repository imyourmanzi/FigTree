#!/usr/bin/env bash
# File: xcode/provided.sh
# Author: Matt Manzi
# Date: 2021-02-16
#
# Adds custom themes to Xcode.
#
# Prerequisites:
# - FIG_HOME is set to the Fig Tree project directory.

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

#### Globals
__PERENNIAL_DIR="perennials/xcode"

targetDirectory="${HOME}/Library/Developer/Xcode/UserData/FontAndColorThemes/"
for sourceFile in "${FIG_HOME}/${__PERENNIAL_DIR}"/*.xccolortheme; do
    
    #### Globals, the rest
    __INSTALL_TARGET="${HOME}/Library/Developer/Xcode/UserData/FontAndColorThemes/$(basename $sourceFile)"
    __SOURCE_FILE="$sourceFile"


    #### Main Script

    logDebug "Planting perennial: ${__PERENNIAL_DIR}"
    logTrace "Install target: ${__INSTALL_TARGET}"
    logTrace "Source file: ${__SOURCE_FILE}"

    linkSafely

done
