# Set up with `brew install bash-git-prompt`.

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

export GIT_PROMPT_END=" $EMOJI_FOR_PROMPT $  "
