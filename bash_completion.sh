#!/usr/bin/env bash

# Set up with `brew install bash-completion`

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi
