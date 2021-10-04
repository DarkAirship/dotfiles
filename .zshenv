#!/bin/sh
#
## Path
[[ -d $HOME/.bin ]] && PATH=$HOME/.bin:$PATH
[[ -d $HOME/.local/bin ]] && PATH=$HOME/.local/bin:$PATH

# Set environment variables
export TERM="xterm-256color"
export TERMINAL="alacritty"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export VISUAL="nvim"
export EDITOR="nvim"
export BROWSER="brave"
export READER="zathura"

#export LESS_TERMCAP_mb=$'\e[1;32m'

# Set XDG variables
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# ~/ clean-up
export ZDOTDIR=$HOME/.config/zsh
export HISTFILE=$ZDOTDIR/.zhistory
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export GNUPGHOME="$XDG_DATA_HOME"/gnupg, gpg2 --homedir "$XDG_DATA_HOME"/gnupg

# Cannot set this - doesn't allow to login then
#export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
#
# Setting for ranger to load user configs
#export RANGER_LOAD_DEFAULT_RC=false

