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

function logDebug () {
    if [ ! -z "${FIG_DEBUG+true}" ]; then
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
NOSEED_FILE="$(ls -1 .noseed 2> /dev/null || ls -1 ./default.noseed 2> /dev/null || logWarn 'Cannot find noseed file')"


# parse the .noseed file
[ -e "${NOSEED_FILE}" ] && \
logDebug "Found noseed file: ${NOSEED_FILE}" && \
while read -r line; do
    logDebug "Evaluating line|${line}"

    # ignore lines
    if [[ "${line}" =~ ^\# ]] || [[ "${line}" =~ ^$ ]]; then
        logDebug "Ignoring commented/empty line"
    fi
done < "${NOSEED_FILE}" || \
echo "${NOSEED_FILE}"
