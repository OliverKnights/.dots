# Set up the prompt
autoload -Uz promptinit && promptinit
PROMPT='%B%1~%b %# '

# Use env vars in prompt
setopt prompt_subst

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# History
setopt histignorealldups sharehistory
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history

# Completion
fpath=($HOME/.zsh/completion "${fpath[@]}")

# Functions
fpath=($HOME/.zsh/funcs "${fpath[@]}")
autoload -Uz $fpath[1]/*(.:t)

# Use completion system
autoload -Uz compinit && compinit -i
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

# Open in editor
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# Alias definitions.
[ -f $HOME/.shell_alias ] && source $HOME/.shell_alias
[ -f $HOME/.private_shell_alias ] && source $HOME/.private_shell_alias

# Source fzf if we have it
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Plugin
[ -f ~/.dots/zsh/you-should-use.plugin.zsh ] && source ~/.dots/zsh/you-should-use.plugin.zsh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# fasd
eval "$(fasd --init auto)"

if [ -f ~/.dir_colors ]; then
  eval `dircolors ~/.dir_colors`
fi

# if [ "$TERM" = "linux" ]; then
#     echo -en "\e]P0eeeeee" #black and background
#     echo -en "\e]P8000000" #darkgrey
#     echo -en "\e]P1000000" #darkred
#     echo -en "\e]P9000000" #red
#     echo -en "\e]P2000000" #darkgreen
#     echo -en "\e]PA000000" #green
#     echo -en "\e]P3000000" #brown
#     echo -en "\e]PB000000" #yellow
#     echo -en "\e]P4000000" #darkblue
#     echo -en "\e]PC000000" #blue
#     echo -en "\e]P5000000" #darkmagenta
#     echo -en "\e]PD000000" #magenta
#     echo -en "\e]P6000000" #darkcyan
#     echo -en "\e]PE000000" #cyan
#     echo -en "\e]P7000000" #lightgrey
#     echo -en "\e]PF000000" #white and foreground
#     clear #for background artifacting
# fi


