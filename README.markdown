# Bash Shell Configuration

[![Build Status](https://travis-ci.com/craiga/bash_profile.d.svg?branch=master)](https://travis-ci.com/craiga/bash_profile.d)

To set up, set `~/.bash_profile` to:

    for f in ~/.bash_profile.d/*.sh; do source $f; done

…and check out this repository to `~/.bash_profile.d/`:

    git clone https://github.com/craiga/bash_profile.d.git ~/.bash_profile.d

Put credentials and other private information in `00_private.sh`.

You might also want to run the following to get `git` tab completion:

	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.bash_profile.d/00_git_completion.sh
