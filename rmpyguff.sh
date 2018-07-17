#!/usr/bin/env bash

# rmpyguff
#
# Recursively removes all .pyc files and __pycache__ directories in the current
# directory
#
# Based on https://gist.github.com/joelverhagen/3853540

alias rmpyguff="find . | grep -E \"(__pycache__|\.pyc$)\" | xargs rm -rf"
