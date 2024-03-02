# File: bat.zshrc
# Author: Matt Manzi
# Date: 2024-03-01
#
# Aliases for https://github.com/sharkdp/bat

if type bat &> /dev/null; then
    alias cat="bat"
fi

if type batcat &> /dev/null; then
    alias cat="batcat"
fi
