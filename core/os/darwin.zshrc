# File: darwin.zshrc
# Author: Matt Manzi
# Date: 2019-11-08
#
# Configuration for macOS devices with a zsh shell.


#### FigTree ####
# set OS shell varibales for later config
_go="$HOME/Code/.go"

# load core config
. "$FIG_HOME/shell/core.zshrc"


#### swift ####
# use the latest Swift toolchain
export TOOLCHAINS=swift


#### ls ####
# realias since macOS doesn't like --color (use -G instead)
alias ll='ls -FhlG'
alias la='ls -aFhlG'
alias l='ls -CFG'


#### macOS Hidden Files ####
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
