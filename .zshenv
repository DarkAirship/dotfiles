#!/bin/sh

# Path
[[ -d $HOME/.bin ]] && PATH=$HOME/.bin:$PATH
[[ -d $HOME/.local/bin ]] && PATH=$HOME/.local/bin:$PATH

# Set environment variables
export TERM="xterm-256color"
export TERMINAL="alacritty"
export VISUAL="nvim"
export EDITOR="nvim"
export READER="zathura"
export BROWSER="brave"
#export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANPAGER='less -s -M +Gg'

# Colorize less
export LESS_TERMCAP_mb=$'\e[1;38;5;160m' # red
export LESS_TERMCAP_md=$'\e[1;38;5;178m' # bold text
export LESS_TERMCAP_me=$'\e[0m' # turn off appearance modes
export LESS_TERMCAP_us=$'\e[4;38;5;74m' # underlined text
export LESS_TERMCAP_ue=$'\e[0m' # leave underline mode
export LESS_TERMCAP_so=$'\e[1;48;5;74m' # bottom of the screen
export LESS_TERMCAP_se=$'\e[0m' # leave standout mode

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

# Setting for ranger to load user configs
#export RANGER_LOAD_DEFAULT_RC=false

