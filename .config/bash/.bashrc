# Basics settings
## Path
[ -d $HOME/.bin ] && PATH=$HOME/.bin:$PATH
[ -d $HOME/.local/bin ] && PATH=$HOME/.local/bin:$PATH

## Sourcing
[ -f /usr/share/bash-completion ] && . /usr/share/bash-completion
[ -e /usr/lib/git-core/git-sh-prompt ] && . /usr/lib/git-core/git-sh-prompt

## Exporting
export TERM='xterm-256color'
export TERMINAL='alacritty'
export MANPAGER='sh -c "col -bx | bat -l man -p"'
export EDITOR='nvim'
export BROWSER='brave'

## Semi-useful
shopt -s checkwinsize
bind 'set completion-ignore-case On'

# Prompt settings
GIT_PS1_SHOWDIRTYSTATE=1

function SuccessFail {
    [ $? == 0 ] && echo 32 || echo 31
}

PS1='\[\033[1;36m\]\W '
PS1+='\[\033[0;33m\]$(__git_ps1 "(%s) ")'
PS1+='\[\033[1;$(SuccessFail)m\]ﬄ '
PS1+='\[\033[00m\]'


# Aliases
#alias ls='exa -a --colour=always --group-directories-first'
alias ls="ptls"
alias ll='ls -al'
alias la='ls -A'
alias pwd="ptpwd"
alias mkdir="ptmkdir"
alias touch="pttouch"
alias grep='grep --color=auto'
alias v='nvim'
alias vim='nvim'
alias p='sudo pacman'
#alias rp='sudo pacman -Rcs $(pacman -Qdtq)'
alias rp='sudo pacman -Qtdq | pacman -Rns -'
alias fm='ranger'
alias tsm='transmission-remote'
alias city='curl ipinfo.io/city'
alias rc='sudo systemctl restart openvpn-client@ie'
alias dc='sudo systemctl stop openvpn-client@ie'
alias mypass='bw get password'
alias config='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'


# History settings
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=10000
