# Automatically check Homebrew for updates daily.

time_since_last_check=86400

if [ -f ~/.brew_outdated_check ]
then
  last_check=$(date -r ~/.brew_outdated_check -u +%s)
  now=$(date +%s)
  time_since_last_check=$(($now - $last_check))
fi

if [ $time_since_last_check -ge 86400 ]
then
  touch ~/.brew_outdated_check

  echo 'Updating Homebrew...'
  brew update

  echo 'Checking for available updates...'
  brew_updates=`brew outdated`
  if [[ $brew_updates ]]
  then
    echo 'Homebrew updates exist:'
    echo "$brew_updates"
    read -n1 -p 'Run brew upgrade? [y/N] ' answer
    echo ''
    case ${answer} in
      y|Y )
        echo 'Running brew upgrade...'
        brew upgrade
        echo 'Done!'
      ;;
    esac
  else
    echo "You're up-to-date!"
  fi
fi
