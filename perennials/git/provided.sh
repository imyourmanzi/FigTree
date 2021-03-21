#!/usr/bin/env bash
# File: git/provided.bash
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
__INSTALL_TARGET="${HOME}/.gitconfig"
__PERENNIAL_DIR="perennials/git"
__providedFile="${FIG_HOME}/${__PERENNIAL_DIR}/provided.gitconfig"
__SOURCE_FILE="${FIG_HOME}/${__PERENNIAL_DIR}/provided.grown.gitconfig"


#### Main Script

rm -f "${__SOURCE_FILE}"

# preserve the original gitconfig if it exists
if [ -e "${__INSTALL_TARGET}" ] && [ ! "${__INSTALL_TARGET}" -ef "${__SOURCE_FILE}" ]; then
    logInfo "Provided Git config will be appended to existing config"
    cat "${__INSTALL_TARGET}" > "${__SOURCE_FILE}"
fi
tail +4 "${__providedFile}" >> "${__SOURCE_FILE}"

logDebug "Planting perennial: ${__PERENNIAL_DIR}"
logTrace "Install target: ${__INSTALL_TARGET}"
logTrace "Source file: ${__SOURCE_FILE}"

linkSafely
