#!/usr/bin/env bash
# File: _apt/provided.sh
# Author: Matt Manzi
# Date: 2022-10-14
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
source "${FIG_HOME}/tool-shed/globals.bash"
source "${FIG_HOME}/tool-shed/yn_prompt.bash"

# only set up perennial if Homebrew is installed
if ! type brew &>/dev/null && type apt &> /dev/null; then
    #### Globals
    __PERENNIAL_DIR="perennials/_apt"


    #### Main Script

    logDebug "\nPlanting perennial: ${__PERENNIAL_DIR}"

    logInfoNoPrefix ""
    if ynPrompt "Do you want to install recommended packages from apt"; then
        logDebug "Installation step initiated by user"
        
        logTrace "Updating apt"
        sudo apt update -q=2 &> /dev/null
        logTrace "Installing CLI utilities"
        sudo apt install -q=2 -m cmatrix exa bat ripgrep fd-find 2> /dev/null
    else
        logDebug "Installation step skipped by user"
    fi
else
    logDebug "Not planting apt, Homebrew is installed and/or apt is not available"
fi
