# File: brew.zprofile
# Author: Matt Manzi
# Date: 2023-03-08
#
# Set up Homebrew shell environment.
# See https://docs.brew.sh/Manpage#shellenv

[ -x "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
