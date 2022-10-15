#!/usr/bin/env bash
# File: iterm2/provided.sh
# Author: Matt Manzi
# Date: 2021-02-16
#
# Utilizes iTerm2's Dynamic Profiles feature:
# https://iterm2.com/documentation-dynamic-profiles.html
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
source "${FIG_HOME}/tool-shed/globals.bash"

# only run for macOS
if [[ "${FIG_OS}" == "${__FIG_MAC_OS}" ]]; then
    #### Globals
    __INSTALL_TARGET="${HOME}/Library/Application Support/iTerm2/DynamicProfiles/fig_tree.json"
    __PERENNIAL_DIR="perennials/iterm2"
    __SOURCE_FILE="${FIG_HOME}/${__PERENNIAL_DIR}/provided.json"


    #### Main Script

    logDebug "Planting perennial: ${__PERENNIAL_DIR}"
    logTrace "Install target: ${__INSTALL_TARGET}"
    logTrace "Source file: ${__SOURCE_FILE}"

    linkSafely
else
    logDebug "Not planting iterm2, current system is ${FIG_OS}"
fi
