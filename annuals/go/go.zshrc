# File: go.zshrc
# Author: Matt Manzi
# Date: 2020-11-14
#
# Allows for configuring a custom Golang path for local installations.


#### go root ####
if [[ $(which go) ]]; then
    if [ ! -d "$_go" ]; then; mkdir -p "$_go"; fi
    export GOPATH="$_go"
    export PATH="$PATH:$GOPATH/bin"
fi
