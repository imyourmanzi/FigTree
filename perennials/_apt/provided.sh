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

# ripped straight from here:
# https://github.com/eza-community/eza/blob/main/INSTALL.md#debian-and-ubuntu
function __prep_eza() {
    sudo apt install -y -q=2 gpg
    sudo mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
    sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
    sudo apt -y -q=2 update
}

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
        __prep_eza
        for package in cmatrix eza bat ripgrep fd-find fzf; do
            sudo apt install -y -q=2 -m "$package" 2> /dev/null
        done
    else
        logDebug "Installation step skipped by user"
    fi
else
    logDebug "Not planting apt, Homebrew is installed and/or apt is not available"
fi
