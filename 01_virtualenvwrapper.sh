#!/usr/bin/env bash

# http://virtualenvwrapper.readthedocs.io/en/latest/install.html#shell-startup-file

# If Python has been updated and you see the following error:
#
#     Error while finding module specification for
#     'virtualenvwrapper.hook_loader' (ModuleNotFoundError: No module named
#     'virtualenvwrapper')
#
# …you may need to run `sudo -H pip3 install virtualenvwrapper` to re-install
# virtualenvrapper.

export WORKON_HOME=$HOME/.ve
export PROJECT_HOME=$HOME
VIRTUALENVWRAPPER_PYTHON=$(command -v python3)
export VIRTUALENVWRAPPER_PYTHON

# shellcheck disable=SC1091
source /usr/local/bin/virtualenvwrapper.sh
