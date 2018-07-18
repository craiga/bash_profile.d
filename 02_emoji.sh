#!/usr/bin/env bash

# Select an emoji.
# This file must be run before git_prompt.sh and title.sh. In practice, this
# means that the name of this file must be before "git_prompt.sh" in
# alphabetical order.

if [ -z "$EMOJI" ]; then

  DATE=$(date +%m-%d)
  MONTH=$(date +%m)
  DAY_OF_WEEK=$(date +%u)
  HOUR=$(date +%k)
  NOW=$(date +%s)

  EMOJIS=()

  case $DATE in
    '02-14')
      # It's Valentine's day
      EMOJIS+=("💕" "💖" "💗" "💘" "💝" "💞" "❤️" "💌")
    ;;
    '03-10')
      # It's MAR10!
      EMOJIS+=("🎮" "👾" "🕹" "🍄")
    ;;
    '03-17')
      # It's St. Patrick's Day!
      EMOJIS+=("🍀" "🇮🇪" "☘️ ")
    ;;
    '03-31')
      # It's my birthday!
      EMOJIS+=("🍰" "🎂" "🎉" "🎁" "🍺" "🍻" "🍷")
    ;;
    '06-16')
      # It's Captain Picard Day!
      EMOJIS+=("🖖" "🚀")
    ;;
    '06-30')
      # It's Asteroid Day!
      EMOJIS+=("☄️ " "💫" "🚀")
    ;;
    '07-01')
      # It's Canada Day!
      EMOJIS+=("🇨🇦" "🍁" "🏒" "🥅" "🥞")
    ;;
    '07-04')
      # It's American Independence Day!
      EMOJIS+=("🇺🇸" "🏈" "🦅" "🎆" "🎇")
    ;;
    '07-22')
      # It's Pi Approximation Day!
      EMOJIS+=("🥧" "𝛑")
    ;;
    '08-02')
      # It's IPA Day!
      EMOJIS+=("🍺" "🍻")
    ;;
    '09-01')
      # It's World Beard Day!
      EMOJIS+=("🧔" "🧔🏻" "🧔🏼" "🧔🏽" "🧔🏾" "🧔🏿")
    ;;
    '11-30')
      # It's St. Andrew's Day!
      EMOJIS+=("🏴󠁧󠁢󠁳󠁣󠁴󠁿" "🥃")
    ;;
    '12-25'|'12-24')
      # It's Christmas!
      EMOJIS+=("🎁" "🌲" "🎄" "🎅🏻" "🤶🏻")
    ;;
    '12-31')
      # It's New Year's Eve!
      EMOJIS+=("🎉" "🎆" "🎇" "🍺" "🍻")
    ;;
    *)
      # Not a special day.
      EMOJIS+=("🧐" "🤓" "👍" "🤘" "🖖" "👁 " "🐶" "🐨" "🦄" "☄️ " "🌼"
               "🌻" "🌸" "🌳" "🌿" "🌈" "🍏" "🍎" "🍭" "🚀" "🍦" "🍩" "🍪")

      # Work days.
      if (( DAY_OF_WEEK <= 5 ))
      then
        if (( HOUR <= 5 ))
        then
          EMOJIS+=("🛌" "🛏" "💤" "😴" "😪")
        fi

        if (( HOUR >= 6 && HOUR <= 9 ))
        then
          EMOJIS+=("☕️" "🍳" "⏰" "🥐" "🥓" "🥚")
        fi

        if (( HOUR >= 9 && HOUR <= 17 ))
        then
            EMOJIS+=("💼" "📎" "📌" "👔")
        fi

        if (( HOUR >= 12 && HOUR <= 13 ))
        then
          # Lunch time
          EMOJIS+=("🌭" "🌮" "🌯" "🍔" "🍕" "🥗" "🍛" "🍜" "🍝" "🍱" "🍲" "🧀"
                   "🌶" "🌽" "🍅" "🍆" "🍇" "🍉" "🍊" "🍋" "🍌" "🍍" "🍎" "🍏"
                   "🍐" "🍑" "🍒" "🍓" "🥑" "🍖" "🥔" "🍗" "🥕" "🥖" "🍙" "🍚"
                   "🍞" "🍟" "🥝" "🥞" "🍣" "🍤" "🍴" "🍽")
        elif (( HOUR >= 17 ))
        then
          # Late afternoon onwards.
          EMOJIS+=("🍺" "🍻"  "🍷" "🥃" "🍹" "🍾" "🍸")
        fi
      fi

      # Days before work days
      if (( DAY_OF_WEEK < 5 || DAY_OF_WEEK == 7 ))
      then
        if (( HOUR >= 22 ))
        then
          EMOJIS+=("🛌" "🛏" "💤" "😴" "😪")
        fi
      fi

      # Weekend
      if (( DAY_OF_WEEK > 5 ))
      then

        if (( HOUR >= 6 && HOUR <= 12 ))
        then
          EMOJIS+=("☕️" "🍳" "⏰" "🥐" "🥓" "🥚")
        fi

        if (( HOUR >= 12 ))
        then
          EMOJIS+=("🍺" "🍻")
        fi

      fi

      # Add emojis based on the season
      case $MONTH in
        '12'|'01'|'02')
          # Winter
          EMOJIS+=("🏂")
        ;;
        '03'|'04'|'05')
          # Spring
          EMOJIS+=("💐" "🌷" "🌸" "🌹" "🌺" "🌻" "🌼" "🌱")
        ;;
        '06'|'07'|'08')
          # Summer
          EMOJIS+=("😎" "🏖 " "⛱ " "🌴")
        ;;
        '09'|'10'|'11')
          # Autumn
          EMOJIS+=("🥀" "🍂" "🍁" "🍃")
        ;;
      esac

      # Add emojis based on the weather.
      if [ -f ~/.weather.json ]
      then
        WEATHER=$(jq --raw-output .currently.icon ~/.weather.json)
        case $WEATHER in
          'clear-day')
            EMOJIS+=("☀️ ")
          ;;
          'clear-night')
            EMOJIS+=("🌝" "🌠" "✨" "💫" "🌟" "⭐️")
          ;;
          'rain')
            EMOJIS+=("🌨" "🌦")
          ;;
          'snow')
            EMOJIS+=("❄️" "⛄️" "☃️")
          ;;
          'sleet')
            EMOJIS+=("🌨")
          ;;
          'wind')
            EMOJIS+=()
          ;;
          'fog')
            EMOJIS+=()
          ;;
          'cloudy')
            EMOJIS+=("⛅️" "🌥")
          ;;
          'partly-cloudy-day')
            EMOJIS+=("⛅️" "🌥" "🌤 ")
          ;;
          'partly-cloudy-night')
            EMOJIS+=()
          ;;
        esac

        # Add emojis based on daytime/nighttime.
        SUNRISE_TIME=$(jq --raw-output .daily.data[0].sunriseTime ~/.weather.json)
        SUNSET_TIME=$(jq --raw-output .daily.data[0].sunsetTime ~/.weather.json)
        if (( NOW > SUNRISE_TIME && NOW < SUNSET_TIME ))
        then
          EMOJIS+=("☀️ " "😎" "🌤 " "🌍")
        else
          EMOJIS+=("🌙" "🌠" "✨" "💫" "🌟" "⭐️" "🌎" "🌏")

          # Moon phases
          LUNATION=$(jq --raw-output .daily.data[0].moonPhase ~/.weather.json)
          LUNATION=$(echo "$LUNATION * 100 / 1" | bc)
          if (( LUNATION == 0 ))
          then
            # New moon
            EMOJIS+=("🌚")
          elif (( LUNATION < 25 ))
          then
            # Waxing crescent
            EMOJIS+=("🌒")
          elif (( LUNATION == 25 ))
          then
            # First quarter
            EMOJIS+=("🌓" "🌛")
          elif (( LUNATION < 50 ))
          then
            # Waxing gibbous
            EMOJIS+=("🌔")
          elif (( LUNATION == 50 ))
          then
            # Full moon
            EMOJIS+=("🌕" "🌝")
          elif (( LUNATION < 75 ))
          then
            # Waning gibbous
            EMOJIS+=("🌖")
          elif (( LUNATION == 75 ))
          then
            # Last quarter
            EMOJIS+=("🌜" "🌗")
          else
            # Waning crescent
            EMOJIS+=("🌘")
          fi
        fi

      fi
    ;;
  esac

  NUM_EMOJIS=${#EMOJIS[@]}
  EMOJI_INDEX=$((RANDOM % NUM_EMOJIS))
  EMOJI=${EMOJIS[$EMOJI_INDEX]}
fi
