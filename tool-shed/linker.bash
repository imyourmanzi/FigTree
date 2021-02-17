# File: linker.bash
# Author: Matt Manzi
# Date: 2021-02-16
#
# Helper function to safely plant perennials that are linked.
#
# Prerequisites:
# - FIG_HOME is set to the Fig Tree project directory.


source "${FIG_HOME}/tool-shed/logger.bash"
source "${FIG_HOME}/tool-shed/globals.bash"

function linkSafely () {
    logDebug "Planting ${__SOURCE_FILE} into ${__INSTALL_TARGET}"

    # replace bash_profile on macOS
    if [ "$FIG_OS" != "$__FIG_MAC_OS" ]; then
        logDebug "Current system is not macOS"
        return
    fi
    
    # check if a profile is already linked and handle
    if [ "${__INSTALL_TARGET}" -ef "${__SOURCE_FILE}" ]; then
        logDebug "Roots exists, no further action needed"
        return
    fi

    # check that it's not a link to just the wrong file
    if [ ! -L "${__INSTALL_TARGET}" ]; then
        logWarn "Found existing file, backing up before overwrite"
        mv "${__INSTALL_TARGET}" "${__INSTALL_TARGET}.bak"
    fi

    # link Fig Tree file to target location
    logDebug "Linking new ${__INSTALL_TARGET}"
    ln -s "${__SOURCE_FILE}" "${__INSTALL_TARGET}"
}
