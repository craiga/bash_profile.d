# Set up with `brew install bash-git-prompt`.

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

DATE=`date +%m-%d`
DAY_OF_WEEK=`date +%a`
HOUR=`date +%H`

FRIENDS=()

case $DATE in
  '02-14')
    # It's Valentine's day
    FRIENDS+=("💕" "💖" "💗" "💘" "💝" "💞" "❤️" "💌")
  ;;
  '03-10')
    # It's MAR10!
    FRIENDS+=("🎮" "👾" "🕹" "🍄")
  ;;
  '03-17')
    # It's St. Patrick's Day!
    FRIENDS+=("🍀" "🇮🇪" "☘️")
  ;;
  '03-31')
    # It's my birthday!
    FRIENDS+=("🍰" "🎂" "🎉" "🎁" "🍺" "🍻")
  ;;
  '06-16')
    # It's Captain Picard Day!
    FRIENDS+=("🖖" "🚀" "🛰")
  ;;
  '06-30')
    # It's Asteroid Day!
    FRIENDS+=("☄️" "💫" "🚀" "🛰")
  ;;
  '07-22')
    # It's Pi Approximation Day!
    FRIENDS+=("🥧" "𝛑")
  ;;
  '08-02')
    # It's IPA Day!
    FRIENDS+=("🍺" "🍻")
  ;;
  '09-01')
    # It's World Beard Day!
    FRIENDS+=("🧔" "🧔🏻" "🧔🏼" "🧔🏽" "🧔🏾" "🧔🏿")
  ;;
  '11-30')
    # It's St. Andrew's Day!
    FRIENDS+=("🏴󠁧󠁢󠁳󠁣󠁴󠁿")
  ;;
  '12-25'|'12-24')
    # It's Christmas!
    FRIENDS+=("🎁" "🎄" "🎅🏻" "🤶🏻")
  ;;
  '12-31')
    # It's New Year's Eve!
    FRIENDS+=("🎉" "🎆" "🎇" "🍺" "🍻")
  ;;
  *)
    # Not a special day.
    FRIENDS+=("🧐" "🤓" "👍" "🤘" "🖖" "👁" "👨‍💻" "🐶" "🐨" "🦄" "☄️" "🌼"
              "🌻" "🌸" "🍃" "🌲" "🌳" "🌴" "🌱" "🌿" "☘️" "🌈" "🍏" "🍎"
              "🍕" "🍭" "🚀")

    # Add friends based on daytime/nighttime.
    case $HOUR in
      # Sunrise happens between 4 and 8 depending on the time of year
      '09'|'10'|'11'|'12'|'13'|'14')
        # Daytime
        FRIENDS+=("☀️" "🌞" "😎" "🌤" "🌍")
      ;;
      # Sunset happens between 15 and 21 depending on the time of year
      '22'|'23'|'00'|'01'|'02'|'03')
        # Nightime
        FRIENDS+=("🌙" "🌛" "🌜" "🌝" "🌠" "✨" "💫" "🌟" "⭐️" "🌎" "🌏")
      ;;
    esac

    # Add friends based on time of day.
    case $HOUR in
      '06'|'07'|'08'|'09'|'10')
        # Morning
        FRIENDS+=("☕️" "🍳" "⏰")
      ;;
      '16'|'17'|'18'|'19')
        # Late afternoon
        FRIENDS+=("🍺" "🍻")
      ;;
      '20'|'21'|'22'|'23'|'00'|'01')
        # Night
        FRIENDS+=("🍺" "🍻" "🥃" "🍹" "🍾" "🍸")
      ;;
      '02'|'03'|'04'|'05')
        # Late night
        FRIENDS+=("🛌" "🛏" "💤" "😴" "😪")
      ;;
    esac

    # Add friends based on day of the week.
    case $DAY_OF_WEEK in
      'Mon'|'Tue'|'Wed'|'Thu'|'Fri')
        # Weekday
        FRIENDS+=("💻" "💼" "🏢" "📎" "📌" "👔")
      ;;
      'Sat'|'Sun')
        FRIENDS+=("🍺" "🍻")
      ;;
    esac
  ;;
esac

NUM_FRIENDS=${#FRIENDS[@]}
RANDOM_INDEX=$((RANDOM % NUM_FRIENDS))
RANDOM_FRIEND=${FRIENDS[$RANDOM_INDEX]}

export GIT_PROMPT_END=" $RANDOM_FRIEND $  "
