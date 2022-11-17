. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion
. ~/.zsh/prompt
. ~/.zsh/functions_one_file.zsh
#
## use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc
#
## ttyctl -f is supposed to achieve what alias above does, but I can't make it
## work
#

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
eval "$(direnv hook zsh)"
bindkey -e
#
# added by travis gem
[ -f /home/drogus/.travis/travis.sh ] && source /home/drogus/.travis/travis.sh
#
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi

#source "${HOME}/.zgen/zgen.zsh"

source ~/.zsh/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle heroku
antigen bundle docker
antigen bundle docker-compose
antigen bundle command-not-found
antigen bundle jhipster
antigen bundle bobsoppe/zsh-ssh-agent

antigen theme amuse

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
antigen bundle andrewferrier/fzf-z

antigen apply

source /usr/local/Homebrew/opt/fzf/shell/key-bindings.zsh

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
eval "$(starship init zsh)"
