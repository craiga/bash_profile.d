# Set up with `brew install bash-git-prompt`.

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

DATE=`date +%m-%d`
DAY_OF_WEEK=`date +%a`
HOUR=`date +%H`

case $DATE in
  '02-14')
    # It's Valentine's day
    FRIENDS=("💕" "💖" "💗" "💘" "💝" "💞" "❤️" "💌")
  ;;
  '03-31')
    # It's my birthday!
    FRIENDS=("🍰" "🎂" "🎉" "🎁" "🍺" "🍻")
  ;;
  '12-25'|'12-24')
    # It's Christmas!
    FRIENDS=("🎁" "🎄" "🎅🏻" "🤶🏻")
  ;;
  '12-31')
    # It's my birthday!
    FRIENDS=("🍰" "🎂" "🎉" "🎁" "🍺" "🍻")
  ;;
  *)
    case $DAY_OF_WEEK in
      'Mon'|'Tue'|'Wed'|'Thu'|'Fri')
        case $HOUR in
          '06'|'07'|'08'|'09'|'10')
            # Weekday morning
            FRIENDS=("☕️" "🍳" "⏰")
          '11'|'12'|'13'|'14'|'15'|'16')
            # Weekday late morning/early afternoon
            FRIENDS=("💻" "💼" "🏢" "🖇" "📎" "🗒" "🗂" "📌" "👔")
        esac
      ;;
      'Sat'|'Sun')
        
      ;;
    esac

    # FRIENDS=("🧐" "🤓" "👍" "🤘" "🖖" "👁" "👨‍💻" "🐶" "🐨" "🦄" "☄️" "🌼" "🌻"
    #          "🌸" "🍃" "🌲" "🌳" "🌴" "🌱" "🌿" "☘️" "🍀" "🌎" "🌍" "🌏" "🌟"
    #          "🌈" "☀️" "🍏" "🍎" "🍕" "🍭")
  ;;
esac

NUM_FRIENDS=${#FRIENDS[@]}
RANDOM_INDEX=$((RANDOM % NUM_FRIENDS))
RANDOM_FRIEND=${FRIENDS[$RANDOM_INDEX]}

export GIT_PROMPT_END=" $RANDOM_FRIEND $ "
