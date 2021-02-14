#!/usr/bin/env bash
# File: plant.sh
# Author: Matt Manzi
# Date: 2020-11-14
#
# In Programmer Jargon:
# Install various configurations and shell script mix-ins into your $HOME
# directory.
#
# In Fig Tree Jargon:
# Plant perennials, prepare soil with amendments, and plant annuals into your
# garden.

function logTrace () {
    if [ ! -z "${FIG_TRACE+true}" ]; then
        echo "[TRAC] ${1}"
    fi
}

function logDebug () {
    if [ ! -z "${FIG_DEBUG+true}" ] || [ ! -z "${FIG_TRACE+true}" ]; then
        echo "[DBUG] ${1}"
    fi
}

function logInfo () {
    echo "[INFO] ${1}"
}

function logWarn () {
    echo "[WARN] ${1}"
}

#### Global Variables
__NOSEED_FILE="$(ls -1 .noseed 2> /dev/null)"
__noSeed=()


# parse the .noseed file
[ -e "${__NOSEED_FILE}" ] && \
logDebug "Found noseed file: ${__NOSEED_FILE}" && \
while read -r line; do
    logTrace "Evaluating line|${line}"

    # ignore lines
    if [[ "${line}" =~ ^\# ]] || [[ "${line}" =~ ^$ ]]; then
        logTrace "Ignoring commented/empty line"
        continue
    fi

    # keep track of seeds to exclude
    __cleanLine="$(echo \"${line}\" | xargs)"
    __noSeed+=( "${__cleanLine}" )
    logDebug "Will not plant: ${__cleanLine}"
done < "${__NOSEED_FILE}" && \
logDebug "All excluded seeds: ${__noSeed[*]}" || \
logInfo "Did not find noseed file, planting all seeds"
