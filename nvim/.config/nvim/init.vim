let g:loaded_rrhelper = 1
let g:did_install_default_menus = 1  " avoid stupid menu.vim (saves ~100ms)

" Set leaders early so we can bind things to them
let mapleader      = "\<Space>"
let maplocalleader = "\\"

" if has('termguicolors')                              " Use truecolor if available
"   set termguicolors
" endif

set background=light
" colorscheme myscheme

filetype plugin indent on                             " File types
syntax on                                      " Enable syntax highlighting
set noswapfile
set isfname-== " Don't use = as part of file name in completion, useful for writing bash e.g. `var=~/path`
if has('mouse')
  set mouse=a
endif
set nojoinspaces " Don't insert 2 spaces when joining after .?!
set cursorline
set sidescrolloff=5
set scrollback=100000                          " Store more lines in terminal buffers
set autowriteall                               " save automatically
set breakindent                                " keep indentation on wrapped lines
set expandtab                                  " Expand tabs into spaces
set foldmethod=syntax                          " Syntax defined folds
set gdefault                                   " Global sub default
set hidden                                     " Allow switching buffers without saving
set ignorecase                                 " Ignore case when searching
set inccommand=split                           " preview search/replace in split
set linebreak
setglobal iskeyword-=#                               " Treat # as word seperator
set iskeyword-=/                               " Treat / as word seperator
set lazyredraw                                 " Don't redraw during macros
set noequalalways                              " Don't resize splits after close
set foldopen-=search
set foldopen-=mark
set noshowcmd                                  " Don't show last command in status bar
set noshowmode
set foldlevelstart=99 " use foldlevelstart over foldlevel
set formatoptions+=n " Better formatting for numbered lists
set formatoptions+=t " wrap at textwidth
set completefunc=ShellHistory
set tabline=%!tab#TabLine()

" Controls how CTRL-P/CTRL-N completion works in insert mode
" Default completion is:
" '.' current buffer
" 'w' buffers from other windows
" 'b' other loaded buffers in the list
" 'u' unloaded buffers in the buffer list
" 't' tag completion
" Also add dictionary completion
set dictionary+=/usr/share/dict/words
set complete+=k

" Controls how completion behaves
" 'menuone' opens the menu even with only one match, this is useful when completion provides more
"           info about the match
" 'preview' shows extra info about the selected completion
" This configuration automatically selects the first option in the list, and inserts it as the
" completion. This makes sense when invoking completion manually as we usually want to actually
" insert a word, as opposed to autocompletion, which is useful just to see what the options are.
set completeopt=menuone,preview

" Useful when opening commands from shell in a small window, automatic wrap
" means we can see the whole command and edit it easily
set wrap

setglobal textwidth=120                               " Wrap at 120
set numberwidth=1                              " Smallest number column
set previewheight=20                           " Preview window height
set shell=/bin/bash                             " shell

" wildchar and wildcharm is the character you type in cmdline to trigger wildmenu (specified by
" 'wildmode')
set wildcharm=<C-z>
" Default to 2 space indents
set shiftwidth=2                               " When using the >> or << commands, shift lines by 2 spaces
set softtabstop=2                              " Number of spaces a tab counts for
set tabstop=2                                  " Tab spaces
set expandtab                                  " change tabs to spaces

set showmatch                                  " Show matching brackets
set virtualedit=block " allow editing past end of lines in visual block mode
set smartcase                                  " Override ignore and infer case
set splitbelow                                 " open horizontal splits below
set splitright                                 " open vertical splits to the right
set timeoutlen=1000                            " key sequence timeout
set ttimeoutlen=0                              " Timeout length for TUI
set undofile                                   " Persist undo history
set updatetime=100                             " Quick update
set shortmess+=ac                                " Abbreviate a bunch of messages
set viewoptions=folds,cursor                   " When opening a file again restore folds, cursor position
set nobackup
set nowritebackup
set diffopt+=iwhiteall
set diffopt+=hiddenoff

" Default command to search for a string in files
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ --hidden\ -g'!.git'\ -g'!vendor'\ -g'!.ccls-cache'

set rtp+=~/.fzf
" search for files:
" - relative to directory of current file
" - current working directory
" This doesn't include hidden files and directories.
setglobal path=.,,**
setglobal include=
set omnifunc=lsc#complete#complete

" Ignore vendor directory
set wildignore+=vendor/**

command! -nargs=1 TabRename call tab#TabRename(<f-args>)
command! -nargs=0 TabReset call tab#TabReset()
" Change directory using fasd
command! -nargs=* Zcd :call functions#Zcd(<f-args>)

" Buffers
nnoremap gb <Cmd>ls<CR>:b<space>

" Directories
" set working dir to current buffers dir
nnoremap <Leader>dc <Cmd>lcd %:p:h<bar>pwd<CR>
" set working dir to up a directory
nnoremap <Leader>du <Cmd>lcd ..<bar>pwd<CR>
" set working dir to git root
nnoremap <Leader>dg :exec 'lcd ' . system('git rev-parse --show-toplevel')<bar>pwd<CR>
nnoremap <Leader>dz :Zcd<space>

" Quickfix
nnoremap <Leader>qo <Cmd>copen<CR>
nnoremap <Leader>qc <Cmd>cclose<CR>

" Location list
nnoremap <Leader>oo <Cmd>lopen<CR>
nnoremap <Leader>oc <Cmd>lclose<CR>

" Edit
nnoremap <Leader>e :e<space>

" Find
" Find a file using path
nnoremap <Leader>fa :e **/*
" use !find to match parts of a path
command! -nargs=* Find call functions#Find(<f-args>)
nnoremap <Leader>fd :Find<space>
" Find a file from the parent directory of the current file
nnoremap <Leader>ff :find <C-R>=fnameescape(expand('%:p:h')).'/'<CR><C-z><C-p>
nnoremap <Leader>fi :find *
nnoremap <Leader>fI :vert sfind *
" Find a file searching downards from the current files dir
nnoremap <Leader>fc :find <C-R>=fnameescape(expand('%:p:h')).'/**/*'<CR>
nnoremap <Leader>fC :vert sfind <C-R>=fnameescape(expand('%:p:h')).'/**/*'<CR>

" Grep
nnoremap <Leader>gl :silent grepl<space>
nnoremap <Leader>gr :silent grep<space>

" Git
" commit with date
command! GCommitMsgDate call system('git add . && git commit -m "$(date)"') | <Cmd>!git push<CR>
nnoremap <Leader>G <cmd>vert G<CR>

" Terminal
nnoremap <Leader>tN :term bash \#<space>
nnoremap <Leader>tn <Cmd>term bash \# <CR>
nnoremap <Leader>tr :keepalt file :term bash \#<Space>
nnoremap <Leader>tV :vs term://bash \#<space>
nnoremap <Leader>tv <Cmd>vs term://bash<CR>
nnoremap <Leader>tS :sp term://bash \#<space>
nnoremap <Leader>ts <Cmd>sp term://bash<CR>
nnoremap <Leader>tt <Cmd>tabnew term://bash<CR>

" Sessions
nnoremap <Leader>ss :mksession! ~/.local/share/nvim/sessions/
nnoremap <Leader>so :source ~/.local/share/nvim/sessions/

" Projectionist / Project
" nnoremap <Leader>pa <Cmd>A<CR>
" nnoremap <Leader>pp <Cmd>Eprojections<CR>
" Open a project dir in a new tab
nnoremap <Leader>pt :tabe <bar> tcd ~/Projects/ <bar> :Dirvish<C-f>F/a
" Open a project in this window (clearing other open splits)
nnoremap <Leader>pw :only<bar>lcd ~/Projects/ <bar> :Dirvish<C-f>F/a
" Open a project in this split
nnoremap <Leader>ps :lcd ~/Projects/ <bar> :Dirvish<C-f>F/a

" Terminal
" tnoremap <C-Q> <C-\><C-n>

" format json
nnoremap gqaj <Cmd>normal ggVGgJ<CR>:%!python -m json.tool<CR>
vnoremap gj <Cmd>'<,'>!python -m json.tool<CR>

" Utils
nnoremap <Leader>uc <Cmd>let oldtw=&textwidth <CR> \|<Cmd>set textwidth=10000 <CR> \| ggVGgqgvy \| <Cmd>let &textwidth=oldtw <CR> \| <Cmd>set textwidth? <CR> \| gvgq
nnoremap <Leader>uR <Cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>

" Vim
nnoremap <Leader>vi <Cmd>e $MYVIMRC<CR>
nnoremap <Leader>vr <Cmd>source $MYVIMRC<CR>
nnoremap <Leader>vl <Cmd>luafile %<CR>
nnoremap <Leader>vp <Cmd>e ~/.config/nvim/private/init.vim<CR>

" Fuzzy
nnoremap <Leader>zf <cmd>FZF<CR>
nnoremap <Leader>zb <cmd>Buffers<CR>
nnoremap <Leader>zs <cmd>Rg<CR>

augroup mygroup
  au!
  " Remove trailing whitespace
  au BufWritePre * %s/\s\+$//e

  " Automatically source file changes on disk
  au CursorHold,FocusGained,BufEnter * silent! checktime

  " Automatically enter insert mode when opening term
  au TermOpen *
        \ startinsert
        \|setlocal nonumber norelativenumber

  " Automatically create and load views
	au BufWinLeave *.* mkview
	au BufWinEnter *.* silent! loadview

  " Highlight text on yank
  au TextYankPost * silent! lua require'vim.highlight'.on_yank()

  " set autowriteall doesnt cover just leaving buffers
  au FocusLost,BufLeave * silent! wa

  " Highlight valid links
  "au BufWinEnter * lua require'links'.valid_links()

  " Status
  au VimEnter,WinEnter,BufWinEnter * call status#RefreshStatus()
augroup END

" Speed up startup
let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1

" Dirvish
let g:dirvish_mode = 2

" Disable netrw, but autoload it for `gx`.
let g:loaded_netrwPlugin = 0
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())<CR>

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Wiki
let g:wiki_root = '~/Projects/notes'
let g:wiki_filetypes = ['md']
let g:wiki_link_extension = '.md'
let g:wiki_map_link_create = 'MyFunction'
let g:wiki_link_target_type = 'md'

function MyFunction(text) abort
  return substitute(tolower(a:text), '\s\+', '-', 'g')
endfunction

" match brackets
inoremap (<CR> (<CR>)<Esc>O
inoremap {<CR> {<CR>}<Esc>O
inoremap {; {<CR>};<Esc>O

command! -range -nargs=1 TmuxSend lua tmux_send(<f-args>, <line1>, <line2>)

fu! ShellHistory(findstart, base)
  lua shell_history()
endfu

" Optional private local settings
let b:private_rc = expand("~/.dots/nvim/.config/nvim/private/init.vim")
if filereadable(b:private_rc)
  exec 'source ' . b:private_rc
endif

" Set tmux status bar to selected text
command! -range TaskStart silent exec '!tmux set -g status-right " ' . getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]] . ' "'

" Run a buffer through !sh and display result in a new split
nnoremap <Leader>rs ma<Cmd>exe 1 . "wincmd w"<CR><Cmd>only<CR>gg"ayG<Cmd>vnew<CR>"aP<Cmd>sil%!sh<CR><Cmd>exe 1 . "wincmd w"<CR>`a
" Run a selection through sh and display result in new split
vnoremap <Leader>rs ma"ay<Cmd>only<CR><Cmd>vnew<CR>"aP<Cmd>sil%!sh<CR><Cmd>exe 1 . "wincmd w"<CR>`agv

nnoremap <leader>rt <Cmd>call terminal#SendBuf()<CR>
vnoremap <leader>rt <Cmd><c-u>call terminal#SendRegion()<CR>

" packadd nvim-colorizer.lua
" lua require'colorizer'.setup(nil, { css = true; })

let g:lsc_server_commands = {
      \'go': {
      \  'command': 'gopls serve',
      \  'log_level': -1,
      \  'suppress_stderr': v:true,
      \   },
      \'python': 'pyls',
      \ 'cpp': {
          \ 'command': 'clangd-11 --background-index',
          \ 'suppress_stderr': v:true
      \},
      \ 'c': {
          \ 'command': 'clangd-11 --background-index',
          \ 'suppress_stderr': v:true
      \},
      \'javascript': 'typescript-language-server --stdio',
      \'ruby': 'solargraph stdio',
      \}
let g:lsc_auto_map = {
    \ 'GoToDefinition': '<Leader>ld',
    \ 'GoToDefinitionSplit': '<Leader>lD',
    \ 'FindReferences': '<Leader>lr',
    \ 'NextReference': '<Leader>ln',
    \ 'PreviousReference': '<Leader>lp',
    \ 'FindImplementations': '<Leader>li',
    \ 'FindCodeActions': '<Leader>la',
    \ 'Rename': '<Leader>lR',
    \ 'ShowHover': v:true,
    \ 'DocumentSymbol': '<Leader>ls',
    \ 'WorkspaceSymbol': '<Leader>lw',
    \ 'SignatureHelp': '<Leader>lh',
    \ 'Completion': 'completefunc',
    \}
let g:lsc_enable_autocomplete = v:false

command! HTMLPreview silent !pandoc -o /tmp/temp.html % && xdg-open /tmp/temp.html
