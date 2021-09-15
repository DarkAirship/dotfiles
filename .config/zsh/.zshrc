# Basics settings
## If not running interactively, don't do anything
[[ $- != *i* ]] && return

## Path
[[ -d $HOME/.bin ]] && PATH=$HOME/.bin:$PATH
[[ -d $HOME/.local/bin ]] && PATH=$HOME/.local/bin:$PATH

## Aliases
[[ -f $ZDOTDIR/.aliasrc ]] && . $ZDOTDIR/.aliasrc

## Vi key bindings
bindkey -v

## History settings
HISTSIZE=1000
SAVEHIST=1000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS

## Speedy options
setopt AUTO_CD
setopt NO_BEEP
setopt PUSHDSILENT
setopt AUTO_MENU
setopt CORRECT

## Syntax highlighting
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Autocompletion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

## Git integration
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats ' %F{yellow}(%b%u%c)%f'
zstyle ':vcs_info:*' check-for-changes true
precmd () { vcs_info }

# Prompt settings
setopt PROMPT_SUBST

PS1='%B%F{cyan}[%1~]%f%b'
PS1+='${vcs_info_msg_0_} '
PS1+='%(?.%F{green}.%F{red})ﬄ%f '
#RPS1=

## Search for a package if command not found
function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    local entries=(
        ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"}
    )
    if (( ${#entries[@]} ))
    then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}"
        do
            # (repo package version file)
            local fields=(
                ${(0)entry}
            )
            if [[ "$pkg" != "${fields[2]}" ]]
            then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
}
