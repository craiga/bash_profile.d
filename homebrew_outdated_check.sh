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
  
  read -p 'Check for updates available from brew? [Y/n] ' answer
  case ${answer} in
    n|N|no|No|NO )
      return 0
    ;;
    * )
      touch ~/.brew_outdated_check

      # Note that we remove old software before installing new software so
      # that it's easier to roll back should a new version cause problems.
      echo 'Removing unused packages older than 30 days...'
      brew cleanup --prune=30

      echo 'Updating Homebrew...'
      brew update

      echo 'Checking for available updates...'
      brew_updates=`brew outdated --verbose`
      if [[ $brew_updates ]]
      then
        echo 'Homebrew updates exist:'
        echo "$brew_updates"
        read -p 'Run brew upgrade? [y/N] ' answer
        case ${answer} in
          y|Y|yes|Yes|YES )
            echo 'Running brew upgrade...'
            brew upgrade
            echo 'Done!'
          ;;
        esac
      else
        echo "You're up-to-date!"
      fi
    ;;
  esac
fi
