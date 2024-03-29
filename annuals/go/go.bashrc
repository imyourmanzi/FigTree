# File: go.bashrc
# Author: Matt Manzi
# Date: 2020-11-14
#
# Allows for configuring a custom Golang path for local installations.

__figGo="$HOME/.go"
if type go &> /dev/null; then
    if [ ! -d "$__figGo" ]; then mkdir -p "$__figGo"; fi
    export GOPATH="$__figGo"
    export PATH="$GOPATH/bin:$PATH"
fi
