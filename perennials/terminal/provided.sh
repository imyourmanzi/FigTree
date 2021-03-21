#!/usr/bin/env bash
# File: terminal/provided.sh
# Author: Matt Manzi
# Date: 2021-02-16
#
# macOS wants to deal with plists only and I'm feeling lazy.
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


#### Globals
__PERENNIAL_DIR="perennials/ssh"
__SOURCE_FILE="${FIG_HOME}/${__PERENNIAL_DIR}/Fig Tree Dark.terminal"


#### Main Script

logDebug "Planting perennial: ${__PERENNIAL_DIR}"
logTrace "Source file: ${__SOURCE_FILE}"
logInfo "Terminal will launch shortly (if it is not running already) and a new window will open.  It can be closed at any time."
sleep 1

open "${__SOURCE_FILE}"
