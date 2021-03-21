#!/usr/bin/env bash
# File: darwin/provided.bash
# Author: Matt Manzi
# Date: 2021-02-16
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
__INSTALL_TARGET="${HOME}/.bash_profile"
__PERENNIAL_DIR="perennials/darwin"
__providedFile="${FIG_HOME}/${__PERENNIAL_DIR}/provided.bash_profile"
__SOURCE_FILE="${FIG_HOME}/${__PERENNIAL_DIR}/provided.grown.bash_profile"


#### Main Script

rm -f "${__SOURCE_FILE}"

# preserve the original gitconfig if it exists
if [ -e "${__INSTALL_TARGET}" ] && [ ! "${__INSTALL_TARGET}" -ef "${__SOURCE_FILE}" ]; then
    logInfo "Provided bash_profile will be appended to existing bash_profile"
    cat "${__INSTALL_TARGET}" > "${__SOURCE_FILE}"
fi
tail +5 "${__providedFile}" >> "${__SOURCE_FILE}"

logDebug "Planting perennial: ${__PERENNIAL_DIR}"
logTrace "Install target: ${__INSTALL_TARGET}"
logTrace "Source file: ${__SOURCE_FILE}"

linkSafely
