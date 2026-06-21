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
#
export PATH="$PATH:$HOME/.local/bin"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
eval "$(direnv hook zsh)"
bindkey -e

export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

if [[ -z "${SSH_AUTH_SOCK:-}" || ! -S "${SSH_AUTH_SOCK}" ]]; then
    if ! pgrep -u "$(id -u)" ssh-agent > /dev/null; then
        ssh-agent > ~/.ssh-agent-thing
    fi
    if [[ -z "${SSH_AGENT_PID:-}" && -f ~/.ssh-agent-thing ]]; then
        eval "$(<~/.ssh-agent-thing)"
    fi
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
if [[ -z "${SSH_AUTH_SOCK:-}" || ! -S "${SSH_AUTH_SOCK}" ]]; then
    antigen bundle bobsoppe/zsh-ssh-agent
fi

antigen theme amuse

#export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#
#antigen bundle andrewferrier/fzf-z

antigen apply

#source /usr/share/bash-completion/completions/fzf

# export ASDF_DIR=/opt/homebrew/Cellar/asdf/0.14.1/libexec
# . /opt/homebrew/Cellar/asdf/0.14.1/libexec/asdf.sh
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export STDB_PATH=$HOME/.stdb

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

HISTSIZE=500000
SAVEHIST=500000
setopt appendhistory
setopt INC_APPEND_HISTORY  
setopt SHARE_HISTORY

export GPG_TTY=$(tty)

export PATH=$PATH:/opt/homebrew/Cellar/postgresql@15/15.4/bin/

unalias history
eval "$(mise activate zsh)"
