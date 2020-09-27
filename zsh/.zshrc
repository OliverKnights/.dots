# Use vi mode
bindkey -v

setopt share_history
setopt rm_star_silent

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line

# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# partial history search
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# history
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

autoload -U colors
colors
PS1="%{$fg[green]%}%c%{$reset_color%} "

# Load aliases
[ -f $HOME/.shell_alias ] && source $HOME/.shell_alias
[ -f $HOME/.private_shell_alias ] && source $HOME/.private_shell_alias

# fzf
# [ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# Load direnv
if hash direnv 2>/dev/null
then
  eval "$(direnv hook zsh)"
fi

# Load pyenv
# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# Docker completion
fpath=($HOME/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# Also load bash completions
autoload bashcompinit && bashcompinit

# add functions
fpath=( $HOME/.zsh_funcs "${fpath[@]}" )

# autoload functions
for file in $HOME/.zsh_funcs/*; do;
  func="${file/\.\/functions\//}"
  autoload -Uz $func
done;

# autoload prompt
autoload -U promptinit; promptinit

export NVM_DIR="$HOME/.config"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

# attach to the most recent not currently attached session
# not_attached=$(tmux ls -F '#{session_name}|#{?session_attached,attached,not attached}' 2>/dev/null | grep 'not attached$' | tail -n 1 | cut -d '|' -f1)
# tmux attach -t "$not_attached" 2> /dev/null || tmux

# Start tmux automatically
# if [ -z "$TMUX" ]; then
#   tmux
# fi
#
eval "$(zoxide init zsh)"
