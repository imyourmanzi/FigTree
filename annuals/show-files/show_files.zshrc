# File: show_files.zshrc
# Author: Matt Manzi
# Date: 2021-02-13
#
# Show or hide hidden files in GUI filesytem tools.

# macOS Finder
if [[ "$FIG_OS" == "$__FIG_MAC_OS" ]]; then
    _showFiles() {
        local action="$1"
        # show them by default
        if [[ -z "$action" ]]; then
            action="YES"
        fi
        defaults write com.apple.finder AppleShowAllFiles "$action"
        killall Finder
    }
    alias showFiles='_showFiles'
fi
