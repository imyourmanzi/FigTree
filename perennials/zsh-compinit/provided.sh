#!/usr/bin/env bash
# File: zsh-compinit/provided.sh
# Author: Matt Manzi
# Date: 2021-03-21
#
# Prerequisites:
# - FIG_HOME is set to the Fig Tree project directory.
#
# OS Supported: macOS Big Sur (11.x) or later

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
__INSTALL_TARGET="${HOME}/Library/LaunchAgents/com.figtree.zsh.compinit.plist"
__PERENNIAL_DIR="perennials/zsh-compinit"
__SOURCE_FILE="${FIG_HOME}/${__PERENNIAL_DIR}/provided.plist"


#### Main Script

logDebug "Planting perennial: ${__PERENNIAL_DIR}"
logTrace "Install target: ${__INSTALL_TARGET}"
logTrace "Source file: ${__SOURCE_FILE}"

linkSafely

logDebug "Loading ${__PERENNIAL_DIR} into launchd"
# https://www.reddit.com/r/MacOS/comments/kbko61/launchctl_broken/gpv2to1?utm_source=share&utm_medium=web2x&context=3
launchctl enable "user/${UID}/$(basename ${__INSTALL_TARGET} .plist)"
