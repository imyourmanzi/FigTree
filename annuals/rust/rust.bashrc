# File: rust.bashrc
# Author: Matt Manzi
# Date: 2023-03-08
#
# Allows for configuring a custom Rust path for local installations.
# See https://www.rust-lang.org/tools/install

__figRust="$HOME/.cargo"
if [ -d "$__figRust" ]; then
    export CARGO_HOME="$__figRust"
    export PATH="$CARGO_HOME/bin:$PATH"
fi
