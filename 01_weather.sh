#!/usr/bin/env bash

# Get latest weather from Dark Sky. Store in ~/.weather.json.
#
# Requires a DARK_SKY_API_KEY, jq (`brew install jq`), and CoreLocationCLI
# (`brew cask install corelocationcli`).

time_since_last_check=600

if [ -f ~/.weather.json ]
then
  last_check=$(date -r ~/.weather.json -u +%s)
  now=$(date +%s)
  time_since_last_check=$((now - last_check))
fi

if [ $time_since_last_check -ge 600 ]
then
  echo "Getting weather..."
  if ! curl --location --fail \
      "https://api.darksky.net/forecast/$DARK_SKY_API_KEY/$(CoreLocationCLI -format "%latitude,%longitude")?exclude=minutely,hourly&units=ca" \
        > ~/.weather.json
  then
    echo "Getting weather failed."
    rm ~/.weather.json
  fi
fi
