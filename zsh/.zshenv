export VISUAL='nvim'
export EDITOR='nvim'
export ALTERNATE_EDITOR=""

export NNN_USE_EDITOR=1

# go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GO111MODULE=on

export NODE_PATH=/usr/local/lib/node_modules # Allow node repl to import global modules

# Duplicated in init.vim
export FZF_DEFAULT_COMMAND='rg \
             --files \
             --hidden \
             --follow \
             -g "!{.git,.ccls-cache,node_modules,bin,Library,Downloads,Music,.Trash,.Private,.cache,snap,tags}/" \
             -g "!tags" \
             -g "!.DS_Store" \
             -g "!vendor" \
             --ignore-file "./.project_ignore"'

# better less
export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'

export MANPAGER='nvim +Man!'
export MANWIDTH=999

export LD_LIBRARY_PATH=/usr/local/lib

# script paths
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/privatebin
export PATH=$PATH:$HOME/go/bin

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.composer/vendor/bin
export PATH=$PATH:$HOME/.cabal/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.npm/bin
export PATH=$PATH:$HOME/.gem/ruby/2.5.0/bin
export PATH=$PATH:$HOME/.gem/ruby/2.4.0/bin

export BAT_THEME="GitHub"

export dotfiles_dir="$HOME/.dots"
export project_dir="$HOME/Projects"

export GPG_TTY=$(tty)

