# File: linker.bash
# Author: Matt Manzi
# Date: 2021-02-16
#
# Helper function to safely plant perennials that are linked.
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

source "${FIG_HOME}/tool-shed/logger.bash"
source "${FIG_HOME}/tool-shed/globals.bash"

function linkSafely () {
    logDebug "Linking ${__INSTALL_TARGET} to ${__SOURCE_FILE}"
    
    # check if a file is already linked and handle
    if [ "${__INSTALL_TARGET}" -ef "${__SOURCE_FILE}" ]; then
        logDebug "Correct link exists, no further action needed"
        return
    fi
    logTrace "File not currently linked"

    # check if there is a file there already
    if [ -e "${__INSTALL_TARGET}" ]; then
        logInfo "Found existing file, backing up before linking"
        mv "${__INSTALL_TARGET}" "${__INSTALL_TARGET}.bak"
    fi

    # link Fig Tree file to target location
    ln -s "${__SOURCE_FILE}" "${__INSTALL_TARGET}"
}
