#!/bin/zsh
## If not running interactively, don't do anything
[[ $- != *i* ]] && return

## Source aliases
[[ -f $ZDOTDIR/.aliasrc ]] && . $ZDOTDIR/.aliasrc

## History settings
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS

## Speedy options
setopt AUTO_CD
setopt NO_BEEP
setopt PUSHDSILENT
setopt AUTO_MENU
setopt AUTO_LIST
setopt CORRECT
setopt PROMPT_SUBST

## Autocompletion
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zmodload zsh/complist

## Prompt settings
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
[[ $EUID -eq 0 ]] \
    && PS1='%F{red}[root] %F{cyan}%1~%f${vcs_info_msg_0_} %(?.%F{green}.%F{red})ﬄ%f ' \
    || PS1='%F{cyan}%1~%F{red}$(isReadOnly)%f${vcs_info_msg_0_} %(?.%F{green}.%F{red})ﬄ%f '

## Setting up vi mode
## source https://github.com/LukeSmithxyz/voidrice/blob/master/.config/zsh/.zshrc
bindkey -v
export KEYTIMEOUT=1

## Change cursor shape for different vi modes
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
echo -ne '\e[5 q'                   # Use beam shape cursor on startup
preexec() { echo -ne '\e[5 q' ;}    # Use beam shape cursor for each new prompt

## Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M vicmd '^e' edit-command-line
bindkey -M visual '^[[P' vi-delete

## Use vim keys in tab completion menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

## Fix backspace when switching modes
bindkey "^?" backward-delete-char

## Archwiki says it makes Xterm trasnparent
[[ -n "$XTERM_VERSION" ]] && [[ $EUID -ne 0 ]] \
    && transset-df --id "$WINDOWID" >/dev/null

# Add plugins
## Syntax highlighting
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Auto suggestions
. ~/.config/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#a5abb6"

## Useless beautification
pfetch
