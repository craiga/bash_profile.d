#!/usr/bin/env bash

# Set up with `brew install bash-completion`

if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  # shellcheck disable=SC1090
  source "$(brew --prefix)/etc/bash_completion"
fi
