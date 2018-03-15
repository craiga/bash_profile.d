# git aliases

# Create a work in progress commit.

alias git-wip="git add . && git commit --no-verify --message 'WIP'"

# Roll back a work in progress commit.

alias git-unwip="if [ \"\`git log -1 --pretty=%B\`\" == 'WIP' ]; then git reset HEAD~1; else echo 'Last commit not WIP!'; fi"
