#!/usr/bin/env bash

# network aliases

# Show what's listentening on a particular TCP port.
# 
#   port-listener 5000

port_listener() {
  lsof -nP -i4TCP:"$1" | grep LISTEN
}
alias port-listener='port_listener'
