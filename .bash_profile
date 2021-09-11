# Tries for bloat aka load the default .profile
[[ -s "$HOME/.profile" ]] && . "$HOME/.profile"

# if running bash
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"


# set PATH so it includes user's private bin if it exists
#[ -d "$HOME/.bin" ] && PATH="$HOME/.bin:$PATH"


# set PATH so it includes user's private bin if it exists
#[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

# some setting for homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# some setting for qt apps
export QT_QPA_PLATFORMTHEME=qt5ct
