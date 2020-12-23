# File: darwin.cshrc
# Author: Matt Manzi
# Date: 2019-01-03
#
# Configuration for macOS devices with a tcsh shell.


#### FigTree ####
# load core config
source "$fig_home/shell/core.cshrc"


#### swift ####
# use the latest Swift toolchain
set TOOLCHAINS="swift"


#### ls ####
# realias since macOS doesn't like --color (use -G instead)
alias ll "ls -FhlG"
alias la "ls -aFhlG"
alias l "ls -CFG"


#### macOS Hidden Files ####
alias showFiles "defaults write com.apple.finder AppleShowAllFiles \!:1; killall Finder"
