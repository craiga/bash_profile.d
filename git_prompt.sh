# Set up with `brew install bash-git-prompt`.

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

FRIENDS=("🧐" "🤓" "👍" "🤘" "🖖" "👁" "👨‍💻" "🐶" "🐨" "🦄" "☄️" "🌼" "🌻"
         "🌸" "🍃" "🌲" "🌳" "🌴" "🌱" "🌿" "☘️" "🍀" "🌎" "🌍" "🌏" "🌟"
         "🌈" "☀️" "🍏" "🍎" "🍕" "🍭")
NUM_FRIENDS=${#FRIENDS[@]}
RANDOM_INDEX=$((RANDOM % NUM_FRIENDS))
RANDOM_FRIEND=${FRIENDS[$RANDOM_INDEX]}

export GIT_PROMPT_END=" $RANDOM_FRIEND $ "
