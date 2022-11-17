#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

mkdir -p ~/.config
ln -sf $SCRIPT_DIR/nvim $HOME/.config/nvim
ln -sf $SCRIPT_DIR/zsh $HOME/.zsh
ln -sf $SCRIPT_DIR/zshrc $HOME/.zshrc
ln -sf $SCRIPT_DIR/tmux.conf $HOME/.tmux.conf
