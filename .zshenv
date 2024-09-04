#!/bin/zsh

## Path
[[ -d $HOME/.bin ]] && PATH=$HOME/.bin:$PATH
[[ -d $HOME/.local/bin ]] && PATH=$HOME/.local/bin:$PATH
[[ -d $HOME/.local/bin/platform-tools ]] && PATH=$HOME/.local/bin/platform-tools:$PATH

## Set XDG variables
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

## Flatpack path
#PATH=$XDG_DATA_HOME/flatpak/exports/bin:$PATH
#PATH=/var/lib/flatpak/exports/bin:$PATH

## Set environment variables
export VISUAL="nvim"
export EDITOR="nvim"
export BROWSER="brave"
export MANPAGER='less -s -M +Gg'
export HISTCONTROL=ignoreboth:erasedups
export SCRIPTFOLDER='~/.local/bin'
#export READER="zathura"
#export TERM="xterm-256color"
#export TERMINAL="alacritty"

## Colorize less
export LESS_TERMCAP_mb=$'\e[1;38;5;160m' # red
export LESS_TERMCAP_md=$'\e[1;38;5;178m' # bold text
export LESS_TERMCAP_me=$'\e[0m' # turn off appearance modes
export LESS_TERMCAP_us=$'\e[4;38;5;70m' # underlined text
export LESS_TERMCAP_ue=$'\e[0m' # leave underline mode
export LESS_TERMCAP_so=$'\e[1;38;5;67m' # bottom of the screen
export LESS_TERMCAP_se=$'\e[0m' # leave standout mode

## Change QT settings
#export QT_QPA_PLATFORMTHEME="kvantum"

# added by me in hopes of getting flameshot to work (it did)
export QT_QPA_PLATFORM=wayland
export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1

# added by me in hopes of getting firefox snap to display correct cursor (it didn't)
export XCURSOR_PATH=$RUNTIME/usr/share/icons

## ~/ clean-up
export ZDOTDIR=$HOME/.config/zsh
export HISTFILE=$ZDOTDIR/.zhistory
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export ATOM_HOME="$XDG_DATA_HOME"/atom
export KDEHOME="$XDG_CONFIG_HOME"/kde
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export WGETRC="$XDG_CONFIG_HOME/wgetrc"

case "$XDG_SESSION_TYPE" in
    x11)
    export XCURSOR_PATH=${XCURSOR_PATH}:~/.local/share/icons
    export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
    ;;
    wayland)
    export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
    ;;
esac

#dasfasdflkaj комментарийц
