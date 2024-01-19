# File: brew.zprofile
# Author: Matt Manzi
# Date: 2023-03-08
#
# Set up Homebrew shell environment.
# See https://docs.brew.sh/Manpage#shellenv

[ -x "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
[ -x "/usr/local/bin/brew" ] && eval "$(/usr/local/bin/brew shellenv)"
[ -x "/home/linuxbrew/.linuxbrew/bin/brew" ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
