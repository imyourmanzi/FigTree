# File: word_jump.zshrc
# Author: Matt Manzi
# Date: 2022-02-12
#
# Use the `option` key to navigate by word/line.

# for cmd + arrow key cursor navigation
# https://coderwall.com/p/a8uxma/zsh-iterm2-osx-shortcuts
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line
