#!/usr/bin/env bash

# Addresses https://github.com/pyenv/pyenv/issues/1219

# Additional switches for the C compiler.
CFLAGS="$CFLAGS -I$(brew --prefix readline)/include"
CFLAGS="$CFLAGS -I$(brew --prefix openssl)/include"
CFLAGS="$CFLAGS -I$(xcrun --show-sdk-path)/usr/include"
export CFLAGS

# Additional switches for the linker.
LDFLAGS="$LDFLAGS -L$(brew --prefix readline)/lib"
LDFLAGS="$LDFLAGS -L$(brew --prefix openssl)/lib"
export LDFLAGS
