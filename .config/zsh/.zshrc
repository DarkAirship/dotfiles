# Basics settings
## If not running interactively, don't do anything
[[ $- != *i* ]] && return

## Path
[[ -d $HOME/.bin ]] && PATH=$HOME/.bin:$PATH
[[ -d $HOME/.local/bin ]] && PATH=$HOME/.local/bin:$PATH

## Vi key bindings
bindkey -v

## History settings
HISTSIZE=1000
SAVEHIST=1000
setopt inc_append_history
setopt hist_ignore_dups

## Speedy options
setopt autocd
setopt nobeep
#setopt expand_aliases

## Autocompletion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

## Git integration
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats ' %F{yellow}(%b%u%c)%f'
zstyle ':vcs_info:*' check-for-changes true
precmd () { vcs_info }

# Prompt settings
setopt prompt_subst

PS1='%B%F{cyan}%1~%f%b'
PS1+='${vcs_info_msg_0_} '
PS1+='%(?.%F{green}.%F{red})ﬄ%f '
#RPS1=

# Aliases
## Navigation
alias ls="ptls"
alias ll='ptls -Al'
alias la='ptls -A'
alias l.="/bin/ls -A | egrep '^\.'"
alias pwd="ptpwd"
alias mkdir="ptmkdir"
alias touch="pttouch"

## Colorize the grep command output for ease of use (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

## Short names for frequently used programs
alias v='nvim'
alias fm='ranger'
alias tsm='transmission-remote'
alias p='sudo pacman --color auto'
alias mypass='bw get password'

## VPN management
alias city='curl ipinfo.io/city'
alias rc='sudo systemctl restart openvpn-client@ie'
alias dc='sudo systemctl stop openvpn-client@ie'

## Fast configuration edits
alias vb='nvim ~/.config/bash/.bashrc'
alias vz='nvim ~/.config/zsh/.zshrc'
alias va='nvim ~/.config/alacritty/alacritty.yml'
alias vv='nvim ~/.config/nvim/init.vim'

## Alias for managing dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'

## Aliases for software managment
alias update='sudo pacman -Syyu'
alias upall="yay -Syu --noconfirm"
alias yayskip='yay -S --mflags --skipinteg'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

## Fix obvious typo's
alias cd..='cd ..'
alias pdw='pwd'
alias udpate='sudo pacman -Syyu'

## System information
alias df='df -h'
alias free="free -mt"
alias psa="ps auxf"
alias userlist="cut -d: -f1 /etc/passwd"
alias hw="hwinfo --short"
alias iso="cat /etc/dev-rel | awk -F '=' '/ISO/ {print $2}'"
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

## System management
alias probe="sudo -E hw-probe -all -upload"
alias sysfailed="systemctl list-units --failed"
alias jctl="journalctl -p 3 -xb"
alias big="expac -H M '%m\t%n' | sort -h | nl"
alias ssn="sudo shutdown now"
alias sr="sudo reboot"
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias rg="rg --sort path"
alias wget="wget -c"
alias rez='. $ZDOTDIR/.zshrc'

## Get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist"
### Arcolinux experimental - best option for the moment
alias mirrorx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias mirrorxx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"

## Arcolinux applications
alias att="arcolinux-tweak-tool"
alias adt="arcolinux-desktop-trasher"
alias abl="arcolinux-betterlockscreen"
alias agm="arcolinux-get-mirrors"
alias amr="arcolinux-mirrorlist-rank-info"
alias aom="arcolinux-osbeck-as-mirror"
alias ars="arcolinux-reflector-simple"
alias atm="arcolinux-tellme"
alias avs="arcolinux-vbox-share"
alias awa="arcolinux-welcome-app"

## Arcolinux resets
#copy/paste all content of /etc/skel over to home folder - backup of config created - beware
#alias skel='[ -d ~/.config ] || mkdir ~/.config && cp -Rf ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S) && cp -rf /etc/skel/* ~'

#backup contents of /etc/skel to hidden backup folder in home/user
#alias bupskel='cp -Rf /etc/skel ~/.skel-backup-$(date +%Y.%m.%d-%H.%M.%S)'

#copy bashrc-latest over on bashrc - cb= copy bashrc
#alias cb='sudo cp /etc/skel/.bashrc ~/.bashrc && source ~/.bashrc'
#copy /etc/skel/.zshrc over on ~/.zshrc - cb= copy zshrc
#alias cz='sudo cp /etc/skel/.zshrc ~/.zshrc && exec zsh'
