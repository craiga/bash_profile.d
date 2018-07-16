# Select an emoji.
# This file must be run before git_prompt.sh and title.sh. In practice, this
# means that the name of this file must be before "git_prompt.sh" in
# alphabetical order.

if [ -z "$EMOJI" ]; then

  DATE=`date +%m-%d`
  MONTH=`date +%m`
  DAY_OF_WEEK=`date +%a`
  HOUR=`date +%H`

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

      # Add emojis based on daytime/nighttime.
      case $HOUR in
        # Sunrise happens between 4 and 8 depending on the time of year
        '09'|'10'|'11'|'12'|'13'|'14')
          # Daytime
          EMOJIS+=("☀️ " "😎" "🌤 " "🌍")
        ;;
        # Sunset happens between 15 and 21 depending on the time of year
        '22'|'23'|'00'|'01'|'02'|'03')
          # Nightime
          EMOJIS+=("🌙" "🌛" "🌜" "🌝" "🌠" "✨" "💫" "🌟" "⭐️" "🌎" "🌏")
        ;;
      esac

      # Add emojis based on time of day.
      case $HOUR in
        '06'|'07'|'08'|'09'|'10')
          # Morning
          EMOJIS+=("☕️" "🍳" "⏰" "🥐" "🥓" "🥚")
        ;;
        '12'|'13')
          # Lunch time
          EMOJIS+=("🌭" "🌮" "🌯" "🍔" "🍕" "🥗" "🍛" "🍜" "🍝" "🍱" "🍲" "🧀"
                   "🌶" "🌽" "🍅" "🍆" "🍇" "🍉" "🍊" "🍋" "🍌" "🍍" "🍎" "🍏"
                   "🍐" "🍑" "🍒" "🍓" "🥑" "🍖" "🥔" "🍗" "🥕" "🥖" "🍙" "🍚"
                   "🍞" "🍟" "🥝" "🥞" "🍣" "🍤" "🍴" "🍽")
        ;;
        '16'|'17'|'18'|'19')
          # Late afternoon
          EMOJIS+=("🍺" "🍻"  "🍷")
        ;;
        '20'|'21'|'22'|'23'|'00'|'01')
          # Night
          EMOJIS+=("🍺" "🍻"  "🍷" "🥃" "🍹" "🍾" "🍸")
        ;;
        '02'|'03'|'04'|'05')
          # Late night
          EMOJIS+=("🛌" "🛏" "💤" "😴" "😪")
        ;;
      esac

      # Add emojis based on day of the week.
      case $DAY_OF_WEEK in
        'Mon'|'Tue'|'Wed'|'Thu'|'Fri')
          # Weekday
          case $HOUR in
            '09'|'10'|'11'|'12'|'13'|'14'|'15'|'16')
              # Work hours
              EMOJIS+=("💼" "🏢" "📎" "📌" "👔")
            ;;
          esac
        ;;
        'Sat'|'Sun')
          EMOJIS+=("🍺" "🍻")
        ;;
      esac

      # Add emojis based on the season
      case $MONTH in
        '12'|'01'|'02')
          # Winter
          EMOJIS+=("🏂" "🌨" "❄️" "⛄️" "☃️")
        ;;
        '03'|'04'|'05')
          # Spring
          EMOJIS+=("💐" "🌷" "🌸" "🌹" "🌺" "🌻" "🌼" "⛅️" "🌥" "🌦" "🌱")
        ;;
        '06'|'07'|'08')
          # Summer
          EMOJIS+=("☀️ " "🌤 " "😎" "🏖 " "⛱ " "🌴")
        ;;
        '09'|'10'|'11')
          # Autumn
          EMOJIS+=("🥀" "🍂" "🍁" "🍃" "⛅️" "🌥" "🌦")
        ;;
      esac
    ;;
  esac

  NUM_EMOJIS=${#EMOJIS[@]}
  EMOJI_INDEX=$((RANDOM % NUM_EMOJIS))
  EMOJI=${EMOJIS[$EMOJI_INDEX]}
fi