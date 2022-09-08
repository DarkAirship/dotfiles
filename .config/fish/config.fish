#!/bin/fish

## Commands to run when interactive

if status is-interactive
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
end


## Abbreviations
## Navigation
abbr -a cd..    'cd ..'

## Short names for frequently used programs
## Pacman
abbr -a pac     'sudo pacman'

## Neovim
abbr -a v       'nvim'
abbr -a vim     'nvim --clean'

## Ranger
abbr -a fm      'ranger'
abbr -a mf      'ranger'

## Bluetoothctl
abbr -a btc     'bluetoothctl'

## Wget
abbr -a wget    'wget -c'

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
abbr -a big     'expac -H M "%m\t%n" | sort -h | nl'
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
abbr -a downgrada   'sudo downgrade --ala-url https://ant.seedhost.eu/arcolinux/'
abbr -a merge       'xrdb -merge /home/semyon/.config/X11/xresources'
abbr -a sysfailed   'systemctl list-units --failed'
abbr -a ssn         'sudo shutdown now'
abbr -a sr          'sudo reboot'
abbr -a unhblock    'hblock -S none -D none'
abbr -a unlock      'sudo rm /var/lib/pacman/db.lck'
abbr -a update-grub 'sudo grub-mkconfig -o /boot/grub/grub.cfg'
abbr -a unswap      'rm ~/.local/share/nvim/swap/*'
abbr -a rmlogoutlock    'sudo rm /tmp/arcologout.lock'
abbr -a rmpacmanlock    'sudo rm /var/lib/pacman/db.lck'

## Reading logs with bat
abbr -a lpacman 'bat /var/log/pacman.log'
abbr -a lxorg   'bat /var/log/Xorg.0.log'
abbr -a lxorgo  'bat /var/log/Xorg.0.log.old'


## Aliases
## For fun
alias please    'sudo'

## For managing dotfiles
alias config    '/usr/bin/git --git-dir=$HOME/.config/.dots/ --work-tree=$HOME'
alias comconf   'config commit -m $(date +%d.%m.%Y)'

## For getting fastest mirrors
alias mirror    'sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
alias mirrors   'sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist'
alias ram       'rate-mirrors --allow-root arch | sudo tee /etc/pacman.d/mirrorlist'

## For software managment
alias update    'sudo pacman -Syyu --noconfirm'
alias cleanup   'sudo pacman -Rns $(pacman -Qtdq)'
alias paruskip  'paru -S --mflags --skipinteg'

## To switch between shells
alias tobash    'sudo chsh $USER -s /bin/bash && echo "Now log out."'
alias tozsh     'sudo chsh $USER -s /bin/zsh && echo "Now log out."'

## For headphones management
alias hphones   'bluetoothctl -- connect CC:98:8B:E3:1D:4E'
alias unhphones 'bluetoothctl -- disconnect CC:98:8B:E3:1D:4E'
alias ysta      'bluetoothctl -- connect CC:4B:73:25:97:77'
alias unysta    'bluetoothctl -- disconnect CC:4B:73:25:97:77'

## For Bitwarden
alias mypass    'bw get password'
alias genpass   'bw generate -lusn --length 14'

## For VPN management
alias city      'curl ipinfo.io/city'
alias rc        'sudo systemctl restart openvpn-client@nl.service'
alias dc        'sudo systemctl stop openvpn-client@nl.service'
alias wgup      'sudo wg-quick up dark 2>/dev/null'
alias wgdown    'sudo wg-quick down dark 2>/dev/null'

## For remote work access
## with wireguard
#alias trasko   'sudo wg-quick up trasko 2>/dev/null'
#alias untrasko 'sudo wg-quick down trasko 2>/dev/null'

## with l2tp
alias trasko    'nmcli connection up trasko 1>/dev/null 2>&1'
alias untrasko  'nmcli connection down trasko 1>/dev/null 2>&1'

## For colorizing the output
## of ls
alias ls        'exa -x --group-directories-first'
alias la        'exa -a --group-directories-first'
alias ll        'exa -alh --git --group-directories-first --icons'
alias l.        'exa -a --no-icons | rg "^\."'

## of other programs
alias grep      'grep --color=auto'
alias ip        'ip -color=auto'
alias pacman    'pacman --color=auto'
alias rg        'rg --sort path --color=auto'

## Flashy clear
alias clean     'clear; seq 1 $(tput cols) | sort -R | sparklines | lolcat; echo'

## Feh (it\'s a keybinding but let\'s have an alias anyway)
alias fehbg     'feh --bg-fill -r -z --no-fehbg ~/pictures/backgrounds'


## Useless beautification
pfetch
