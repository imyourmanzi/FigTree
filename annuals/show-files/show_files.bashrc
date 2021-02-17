# File: show_files.bashrc
# Author: Matt Manzi
# Date: 2020-12-23
#
# Show or hide hidden files in GUI filesytem tools.

# macOS Finder
if [[ "$FIG_OS" == "$__FIG_MAC_OS" ]]; then
    _showFiles() {
        local action="$1"
        if [[ -z "$action" ]]; then action="YES"; fi # no arguments == show
        defaults write com.apple.finder AppleShowAllFiles "$action"
        killall Finder
    }
    alias showFiles='_showFiles'
fi
