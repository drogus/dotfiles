. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion
. ~/.zsh/prompt

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

function new-scratch {
  cur_dir="$HOME/scratch"
  new_dir="$HOME/tmp/scratch-`date +'%s'`"
  mkdir -p $new_dir
  ln -nfs $new_dir $cur_dir
  cd $cur_dir
  echo "New scratch dir ready for grinding ;>"
}

source $HOME/.rvm/scripts/rvm

alias nom='npm cache clear && rm -rf node_modules && npm install'
alias nombom='npm cache clear && bower cache clean && rm -rf node_modules bower_components && npm install && bower install'

eval "$(/Users/drogus/.trvs/bin/trvs init -)"

# added by travis gem
[ -f /Users/drogus/.travis/travis.sh ] && source /Users/drogus/.travis/travis.sh

# allow to use ctrl-s inside vim
alias vim="stty stop '' -ixoff ; vim"

# ttyctl -f is supposed to achieve what alias above does, but I can't make it
# work
