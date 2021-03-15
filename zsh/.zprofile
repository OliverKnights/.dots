# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

[ -f "$HOME/.shellenv" ] && source "$HOME/.shellenv"

# Rust
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# save keyboard mods
setxkbmap -option 'caps:swapescape' -option 'lv3:ralt_alt'

