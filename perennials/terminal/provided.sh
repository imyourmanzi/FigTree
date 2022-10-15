#!/usr/bin/env bash
# File: terminal/provided.sh
# Author: Matt Manzi
# Date: 2021-02-16
#
# macOS wants to deal with plists only and I'm feeling lazy.  This perennial
# will not be linked back to FIG_HOME and so it will re-plant every time.  The
# only side effect of this is that Terminal will run every time ./plant is run,
# unless the terminal perennial is excluded using the noseed file.
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

# only run for macOS
if [[ "${FIG_OS}" == "${__FIG_MAC_OS}" ]]; then
    #### Globals
    __PERENNIAL_DIR="perennials/terminal"
    __SOURCE_FILE="${FIG_HOME}/${__PERENNIAL_DIR}/Fig Tree Dark.terminal"


    #### Main Script

    logDebug "\nPlanting perennial: ${__PERENNIAL_DIR}"
    logTrace "Source file: ${__SOURCE_FILE}"
    logWarn "Terminal will launch shortly (if it is not running already) and a new window will open.  It can be closed at any time."
    sleep 1

    open "${__SOURCE_FILE}"
else
    logDebug "Not planting terminal, current system is ${FIG_OS}"
fi
