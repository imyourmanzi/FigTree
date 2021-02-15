# File: parse_noseed.bash
# Author: Matt Manzi
# Date: 2021-02-14
#
# Functions for parsing the noseed file.
# Prerequisites:
# - FIG_HOME is set to the Fig Tree project directory.

source "${FIG_HOME}/tool-shed/logger.bash"

__NOSEED_FILE="${FIG_HOME}/.noseed"
__noSeed=()

function parseNoseedFile () {
    local cleanLine

    logTrace "Checking noseed path: ${__NOSEED_FILE}"

    [ -e "${__NOSEED_FILE}" ] && \
    logDebug "Found noseed file: ${__NOSEED_FILE}" && \
    while read -r line; do
        logTrace "Evaluating line|${line}"
        cleanLine="$(echo \"${line}\" | xargs)"

        # ignore lines
        if [[ "${cleanLine}" =~ ^\# ]] || [[ "${cleanLine}" =~ ^$ ]]; then
            logTrace "Ignoring commented/empty line"
            continue
        fi

        # keep track of seeds to exclude
        __noSeed+=( "${FIG_HOME}/${cleanLine}" )
        logDebug "Will not plant: ${cleanLine}"
    done < "${__NOSEED_FILE}" && \
    logDebug "All excluded seeds: ${__noSeed[*]}" || \
    logInfo "Did not find noseed file, planting all seeds"
}
