# File: persist.zshrc
# Author: Matt Manzi
# Date: 2021-10-27
#
# Fun way to keep your Mac running.

if [[ "$FIG_OS" == "$__FIG_MAC_OS" ]]; then
    alias persist='caffeinate -iud & (cmatrix 2> /dev/null || echo "\033[38;5;172mFor the full effect, please install cmatrix.\033[0m") && fg'
fi
