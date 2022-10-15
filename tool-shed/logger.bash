# File: logger.bash
# Author: Matt Manzi
# Date: 2021-02-14
#
# Helper functions for logging.

function logTrace () {
    if [ ! -z "${FIG_TRACE+true}" ]; then
        echo -ne "\033[38;5;244m"
        echo -e "[TRAC] ${1}"
        echo -ne "\033[0m"
    fi
}

function logDebug () {
    if [ ! -z "${FIG_DEBUG+true}" ] || [ ! -z "${FIG_TRACE+true}" ]; then
        echo -ne "\033[38;5;153m"
        echo -e "[DBUG] ${1}"
        echo -ne "\033[0m"
    fi
}

function logInfo () {
    echo -e "[INFO] ${1}"
}

function logInfoNoNewline () {
    echo -e -n "[INFO] ${1}"
}

function logInfoNoPrefix () {
    echo -e "${1}"
}

function logWarn () {
    echo -ne "\033[38;5;172m"
    echo -e "[WARN] ${1}"
    echo -ne "\033[0m"
}

function logFatal () {
    echo -ne "\033[38;5;160m"
    echo -e "[FATL] ${1}"
    echo -ne "\033[0m"
    exit 1
}
