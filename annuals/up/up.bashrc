# File: up.bashrc
# Author: Matt Manzi
# Date: 2020-12-23
#
# Move up directories for me.

_up() {
    local levels=$1 count=1
    # 1 level by default
    if [[ -z $levels ]]; then
        levels=1
    fi
    while ((count++ <= levels)); do
        cd ..
    done
}
alias up='_up'
