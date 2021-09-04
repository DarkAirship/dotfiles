# Basics settings

## Sourcing
[ -f /usr/share/bash-completion ] && . /usr/share/bash-completion
[ -e /usr/lib/git-core/git-sh-prompt ] && . /usr/lib/git-core/git-sh-prompt

## Exporting
export TERM='xterm-256color'
export TERMINAL='alacritty'
export MANPAGER='sh -c "col -bx | batcat -l man -p"'
export EDITOR='nvim'
export BROWSER='brave-browser'


## Semi-useful
shopt -s checkwinsize


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

## General
alias dir='dir --color=auto'
alias grep='grep --color=auto'
#alias ls='exa -a --colour=always --group-directories-first'
alias ll='ls -al'
alias la='ls -A'
alias l='ls -CF'
alias v='nvim'
alias vim='nvim'
alias mrkd='pandoc -f docx -t commonmark'
alias mypass='bw get password'
alias myday='v ~/Documents/Journal/2021/2021.md'
alias fm='ranger'
alias config='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
alias city='curl ipinfo.io/city'
alias rc='sudo systemctl restart openvpn'
alias dc='sudo systemctl stop openvpn'

## ptSh
alias ls="ptls"
alias pwd="ptpwd"
alias mkdir="ptmkdir"
alias touch="pttouch"


# History settings
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=10000
