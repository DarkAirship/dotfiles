#!/bin/fish
## Commands to run when interactive

if status is-interactive
## Add a greeting
    function fish_greeting
#        pfetch
    end

## Enable vim mode
    fish_vi_key_bindings

## But disable vim mode showing in prompt
    function fish_mode_prompt
    end

## Setting up right cursor shapes
    set fish_cursor_default     block   blink
    set fish_cursor_insert      line    blink
    set fish_cursor_replace_one underscore blink
    set fish_cursor_visual      block   blink

## Setting up colors for man pages
    set -gx LESS_TERMCAP_mb \e'[01;31m'
    set -gx LESS_TERMCAP_md \e'[01;34m'
    set -gx LESS_TERMCAP_so \e'[01;35;37m'
    set -gx LESS_TERMCAP_us \e'[01;36m'
    set -gx LESS_TERMCAP_me \e'[0m'
    set -gx LESS_TERMCAP_se \e'[0m'
    set -gx LESS_TERMCAP_ue \e'[0m'
end


## GENERAL ABBREVIATIONS AND ALIASES

## Abbreviations
## Navigation
abbr -a cd..    'cd ..'
abbr -a cdpy    'cd ~/documents/python/'
abbr -a scripts 'cd ~/.local/bin/'

## Short names for frequently used programs
## Neovim
abbr -a v       'nvim'
abbr -a vim     'nvim --clean'

## Ranger
abbr -a fm      'ranger'
abbr -a mf      'ranger'

## Bluetooth
abbr -a bctl    'bluetoothctl'
abbr -a rebt    'sudo systemctl restart bluetooth.service'

## Neofetch
abbr -a nf      'neofetch'

## Transmission
abbr -a tsd     'transmission-daemon'
abbr -a tsm     'transmission-remote'
abbr -a wtsm    'watch transmission-remote -l'

## Weather info
abbr -a wttrc   'curl wttr.in/chelyabinsk'
abbr -a wttre   'curl wttr.in/ekaterinburg'

## Python
abbr -a py      'python'

## Fast configuration edits
abbr -a va      'nvim ~/.config/alacritty/alacritty.yml'
abbr -a vb      'nvim ~/.config/bash/.bashrc'
abbr -a vd      'nvim ~/.config/dunst/dunstrc'
abbr -a vf      'nvim ~/.config/fish/config.fish'
abbr -a vp      'nvim ~/.config/polybar/config.ini'
abbr -a vv      'nvim ~/.config/nvim/init.vim'
abbr -a vz      'nvim ~/.config/zsh/.zshrc'
abbr -a vsa     'nvim ~/.config/zsh/.aliasrc'
abbr -a vsx     'nvim ~/.config/sxhkd/sxhkdrc'
abbr -a vwm     'nvim ~/.config/bspwm/bspwmrc'

## And one word reloaders
abbr -a rf      'source ~/.config/fish/config.fish'
abbr -a rz      'source $ZDOTDIR/.zshrc'

## System information
abbr -a df      'df -h'
abbr -a free    'free -mt'
abbr -a jctl    'journalctl -p 3 -xb'
abbr -a hw      'hwinfo --short'
abbr -a probe   'sudo -E hw-probe -all -upload'
abbr -a psa     'ps auxf'
abbr -a psgrep  'ps aux | grep -v grep | grep -i -e VSZ -e'
abbr -a xd      'ls /usr/share/xsessions'
abbr -a microcode   'grep . /sys/devices/system/cpu/vulnerabilities/*'
abbr -a userlist    'cut -d: -f1 /etc/passwd'

## System management
abbr -a merge       'xrdb -merge /home/semyon/.config/X11/xresources'
abbr -a sysfailed   'systemctl list-units --failed'
abbr -a ssn         'sudo shutdown now'
abbr -a po          'poweroff'
abbr -a sr          'sudo reboot'
abbr -a unhblock    'hblock -S none -D none'
abbr -a update-grub 'sudo grub-mkconfig -o /boot/grub/grub.cfg'
abbr -a rmswap      'rm ~/.local/share/nvim/swap/*'


## Aliases
## For fun
alias please    'sudo'

## For colorizing the output
## of ls
alias ls        'eza --group-directories-first'
alias la        'eza -a --group-directories-first'
alias ll        'eza -alh --git --group-directories-first --icons'
alias l.        'eza -a --no-icons | rg "^\."'

#alias ls        'ls --group-directories-first'
#alias la        'ls --almost-all --group-directories-first'
#alias ll        'ls -alh --group-directories-first'
#alias l.        'ls -a | rg "^\."'

## of other programs
alias grep      'grep --color=auto'
alias ip        'ip -color=auto'
alias rg        'rg --sort path --color=auto'
alias bat       'batcat'

## Flashy clear
alias clean     'clear; seq 1 $(tput cols) | sort -R | sparklines | lolcat; echo'

## For managing dotfiles
#alias config    '/usr/bin/git --git-dir=$HOME/.config/.dots/ --work-tree=$HOME'
#alias comconf   'config commit -m $(date +%d.%m.%Y)'

## To switch between shells
alias tobash    'sudo chsh $USER -s /bin/bash && echo "Now log out."'
alias tozsh     'sudo chsh $USER -s /bin/zsh && echo "Now log out."'
alias tofish    'sudo chsh $USER -s /bin/fish && echo "Now log out."'

## For headphones management
alias hphones   'bluetoothctl -- connect C8:7B:23:56:DE:4F'
alias unhphones 'bluetoothctl -- disconnect C8:7B:23:56:DE:4F'
alias ystaysh   'bluetoothctl -- connect CC:4B:73:25:97:77'
alias unstaysh  'bluetoothctl -- disconnect CC:4B:73:25:97:77'

## For Bitwarden
alias mypass    'bw get password'
alias genpass   'bw generate -lusn --length 14'

## For VPN management
alias city      'curl ipinfo.io/city'
#alias rc        'sudo systemctl restart openvpn-client@nl.service'
#alias dc        'sudo systemctl stop openvpn-client@nl.service'
#alias wgup      'sudo wg-quick up dark 2>/dev/null'
#alias wgdown    'sudo wg-quick down dark 2>/dev/null'

## Feh (it\'s a keybinding but let\'s have an alias anyway)
#alias fehbg    'feh --bg-fill -r -z --no-fehbg ~/pictures/backgrounds'

## Wget
alias wget      'wget -c --hsts-file="$XDG_CACHE_HOME/wget-hsts"'


## DISTRO SPECIFIC ABBREVIATIONS AND ALIASES
## Figure out what distro we are on and add abbreviations for that
set distro "$(awk -F= '/^ID=/{print $2}' /etc/os-release)"
switch $distro
#### ARCH
case arch
    ## Abbreviations
    ## Short names for frequently used programs
    ## Pacman
    abbr -a pac     'sudo pacman'

    ## System information
    abbr -a big     'expac -H M "%m\t%n" | sort -h | nl'

    ## System management
    abbr -a downgrada       'sudo downgrade --ala-url https://ant.seedhost.eu/arcolinux/'
    abbr -a rmlogoutlock    'sudo rm /tmp/arcologout.lock'
    abbr -a rmpacmanlock    'sudo rm /var/lib/pacman/db.lck'
    abbr -a unlock          'sudo rm /var/lib/pacman/db.lck'

    ## Reading logs with bat
    abbr -a lpacman 'bat /var/log/pacman.log'


    ## Aliases
    ## For getting fastest mirrors
    alias mirror    'sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
    alias mirrors   'sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist'
    alias ram       'rate-mirrors --allow-root arch | sudo tee /etc/pacman.d/mirrorlist'

    ## For software managment
    alias update    'sudo pacman -Syyu --noconfirm'
    alias cleanup   'sudo pacman -Rns $(pacman -Qtdq)'
    alias paruskip  'paru -S --mflags --skipinteg'

#### FEDORA
case fedora
    ## Abbreviations
    ## Short names for frequently used programs
    ## dnf
    abbr -a dnf      'sudo dnf'

    ## For software managment
    abbr -a update   'sudo dnf update --best --allowerasing'

    ## Aliases

#### UBUNTU
case ubuntu
    ## Abbreviations
    ## Short names for frequently used programs
    ## apt
    abbr -a apt     'sudo apt'

    ## nala
    abbr -a nala    'sudo nala'

    ## For software managment
    abbr -a update  'sudo nala upgrade -y'

    ## Gimme back my firefox
    abbr -a foxback 'sudo snap remove firefox && sudo apt install firefox -y'

    ## Aliases

end

