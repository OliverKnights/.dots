# Set up the prompt

autoload -Uz promptinit
promptinit

PROMPT='%B%F{240}%1~%f%b %# '

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Alias definitions.
[ -f $HOME/.shell_alias ] && source $HOME/.shell_alias
[ -f $HOME/.private_shell_alias ] && source $HOME/.private_shell_alias

# Load functions
if [ -d ~/.bash_functions ]; then
  for file in ~/.bash_functions/*; do
    . "$file"
  done
fi

# Source fzf if we have it
if [ "$TERM" != "dumb" ]; then
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi

