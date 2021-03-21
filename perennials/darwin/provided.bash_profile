# File: darwin/provided.bash_profile
# Author: Matt Manzi
# Date: 2019-01-03
#
# Override profile (login) configuration for all devices with a bash shell.

#### Difference Between .bash_profile and .bashrc ####
# .bash_profile is executed for login shells, while .bashrc is executed for
# interactive non-login shells.
#
# When you login (type username and password) via console, either sitting at
# the machine, or remotely via ssh: .bash_profile is executed to configure
# your shell before the initial command prompt.
#
# But, if you’ve already logged into your machine and open a new terminal
# window (xterm) then .bashrc is executed before the window command prompt.
# .bashrc is also run when you start a new bash instance by typing /bin/bash
# in a terminal.
#
# On OS X, Terminal by default runs a login shell every time, so this is a
# little different to most other systems, but you can configure that in the
# preferences.
# **Source: https://apple.stackexchange.com/a/51038

# immediately source the .bashrc (now all configs
# can be kept in the .bashrc file)
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        source "$HOME/.bashrc"
    fi
fi
