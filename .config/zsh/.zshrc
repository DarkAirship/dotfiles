# Basics settings
## If not running interactively, don't do anything
[[ $- != *i* ]] && return

## Path
[[ -d $HOME/.bin ]] && PATH=$HOME/.bin:$PATH
[[ -d $HOME/.local/bin ]] && PATH=$HOME/.local/bin:$PATH

## Aliases
[[ -f $ZDOTDIR/.aliasrc ]] && . $ZDOTDIR/.aliasrc

## History settings
HISTSIZE=1000
SAVEHIST=1000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS

## Change cursor shape for different vi modes
export KEYTIMEOUT=1

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
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

## Speedy options
setopt AUTO_CD
setopt NO_BEEP
setopt PUSHDSILENT
setopt AUTO_MENU
setopt AUTO_LIST
setopt CORRECT
setopt PROMPT_SUBST

## Syntax highlighting
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Autocompletion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Prompt settings
## Git integration
autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' formats ' %F{yellow}%b%f%u%c'
precmd () { vcs_info }

## Readonly alert
function isReadOnly { [[ -r $PWD ]] && [[ ! -w $PWD ]] && echo " " }

## The prompt itself
PS1='%F{cyan}[%1~%f'
PS1+='%F{red}$(isReadOnly)%f'
PS1+='%F{cyan}]%f'
PS1+='${vcs_info_msg_0_} '
PS1+='%(?.%F{green}.%F{red})ﬄ%f '

# Useless beatification
clear && fortune -s | lolcat -t

