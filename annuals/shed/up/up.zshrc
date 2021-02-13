# File: up.zshrc
# Author: Matt Manzi
# Date: 2021-02-13
#
# Move up directories for me.

_up() {
    local levels=$1
    # 1 level by default
    if [[ -z $levels ]]; then
        levels=1
    fi
    for n ({1..$levels}) cd ..
}
alias up='_up'
