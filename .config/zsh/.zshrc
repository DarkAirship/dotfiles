#!/bin/zsh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source aliases
[[ -f $ZDOTDIR/.aliasrc ]] && . $ZDOTDIR/.aliasrc

# History settings
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS

# Speedy options
setopt AUTO_CD
setopt NO_BEEP
setopt PUSHDSILENT
setopt AUTO_MENU
setopt AUTO_LIST
setopt CORRECT
setopt PROMPT_SUBST
#export KEYTIMEOUT=1

# Autocompletion
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zmodload zsh/complist

# Setting up vi mode
## Change cursor shape for different vi modes (by Luke Smith)
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

## Use vim keys in tab completion menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

## Fix backspace when switching modes
bindkey "^?" backward-delete-char

# Prompt settings
## Git integration
autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' formats ' %F{yellow}%b%f%u%c'
precmd () { vcs_info }

## Readonly alert
isReadOnly() { [[ -r $PWD ]] && [[ ! -w $PWD ]] && echo " " }

## The prompt itself
# options ﬄﲸ
[[ $EUID -eq 0 ]] \
    && PS1='%F{red}ROOT! %F{cyan}%1~%F{red}$(isReadOnly)${vcs_info_msg_0_} %(?.%F{green}.%F{red})ﲸ%f '

[[ $EUID -ne 0 ]] \
    && PS1='%F{cyan}%1~%F{red}$(isReadOnly)%f${vcs_info_msg_0_} %(?.%F{green}.%F{red})ﲸ%f '

#PS1='%F{cyan}%1~%f'
#PS1+='%F{red}$(isReadOnly)%f'
#PS1+='${vcs_info_msg_0_} '
#PS1+='%(?.%F{green}.%F{red})ﲸ%f '

# Add plugins
## Syntax highlighting
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Auto suggestions
. ~/.config/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#a5abb6"

# Useless beatification

