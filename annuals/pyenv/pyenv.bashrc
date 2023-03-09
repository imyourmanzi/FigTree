# File: pyenv.bashrc
# Author: Matt Manzi
# Date: 2023-03-08
#
# Allows for configuring a custom Pyenv path for local installations.
# See https://github.com/pyenv/pyenv#set-up-your-shell-environment-for-pyenv

__figPyenv="$HOME/.pyenv"
if type pyenv &>/dev/null; then
    export PYENV_ROOT="$__figPyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi
