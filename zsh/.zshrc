# Set up the prompt
autoload -Uz promptinit && promptinit
PROMPT='%B($env_name)%b %1~ %# '

# Use env vars in prompt
setopt prompt_subst

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# History
setopt histignorealldups sharehistory
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history

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

# Functions
fpath=($HOME/.dots/zsh/.zsh_funcs $HOME/.zsh/completion ${fpath[@]})
autoload -Uz $fpath[1]/*(.:t)

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# fasd
eval "$(fasd --init auto)"

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0eeeeee" #black
    echo -en "\e]P82B2B2B" #darkgrey
    echo -en "\e]P1D75F5F" #darkred
    echo -en "\e]P9E33636" #red
    echo -en "\e]P287AF5F" #darkgreen
    echo -en "\e]PA98E34D" #green
    echo -en "\e]P3D7AF87" #brown
    echo -en "\e]PBFFD75F" #yellow
    echo -en "\e]P48787AF" #darkblue
    echo -en "\e]PC7373C9" #blue
    echo -en "\e]P5BD53A5" #darkmagenta
    echo -en "\e]PDD633B2" #magenta
    echo -en "\e]P65FAFAF" #darkcyan
    echo -en "\e]PE44C9C9" #cyan
    echo -en "\e]P7000000" #lightgrey
    echo -en "\e]PF000000" #white
    clear #for background artifacting
fi
