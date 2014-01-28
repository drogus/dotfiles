if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'
