# Set environment variables
export TERM="xterm-256color"
export TERMINAL="alacritty"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export VISUAL="nvim"
export EDITOR="nvim"
export BROWSER="brave"


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
#export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export GNUPGHOME="$XDG_DATA_HOME"/gnupg, gpg2 --homedir "$XDG_DATA_HOME"/gnupg
