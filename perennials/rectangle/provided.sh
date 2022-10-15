#!/usr/bin/env bash
# File: rectangle/provided.sh
# Author: Matt Manzi
# Date: 2021-12-20
#
# Preferences for Rectangle (https://github.com/rxhanson/Rectangle)
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
    __INSTALL_TARGET=""
    __PERENNIAL_DIR="perennials/rectangle"
    __SOURCE_FILE="${FIG_HOME}/${__PERENNIAL_DIR}/provided.json"


    #### Main Script

    # only run if Rectangle is installed via Homebrew
    if [[ -d "$(brew --prefix)/Caskroom/rectangle" ]]; then
        # use manual import
        logWarn "The easiest way to import Rectangle preferences is to:"
        logWarn "open the application preferences, click Import, type cmd + shift + G, and paste in this path:"
        logWarn "  ${FIG_HOME}/${__PERENNIAL_DIR}"
        logWarn "Then choose the file named: provided.json"
        sleep 5 && read -p "Press enter when ready to continue with setup"
    else
        logDebug "Not planting rectangle, Rectangle is not installed"
    fi
else
    logDebug "Not planting rectangle, current system is ${FIG_OS}"
fi
