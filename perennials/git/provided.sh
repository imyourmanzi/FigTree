#!/usr/bin/env bash
# File: git/provided.sh
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
__SOURCE_FILE="${FIG_HOME}/${__PERENNIAL_DIR}/provided.gitconfig"


#### Main Script

logDebug "Planting perennial: ${__PERENNIAL_DIR}"
logTrace "Install target: ${__INSTALL_TARGET}"
logTrace "Source file: ${__SOURCE_FILE}"

gitUserName="$(git config --global --get user.name)"
if [ -z "$gitUserName" ]; then
    read -p "What name do you want to use for git? " gitUserName
fi

gitUserEmail="$(git config --global --get user.email)"
if [ -z "$gitUserEmail" ]; then
    read -p "What email do you want to use for git? " gitUserEmail
fi

cp "$__SOURCE_FILE" "${__SOURCE_FILE}.grown"
__SOURCE_FILE="${__SOURCE_FILE}.grown"

echo "[user]
    name = $gitUserName
    email = $gitUserEmail
" > "$__SOURCE_FILE"

linkSafely
