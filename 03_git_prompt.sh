#!/usr/bin/env bash

# Set up with `brew install bash-git-prompt`.

export GIT_PROMPT_END="\\n$EMOJI $ "
export GIT_PROMPT_THEME='Solarized'

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  # shellcheck disable=SC1090
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
