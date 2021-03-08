hi clear
if exists("syntax_on")
  syntax reset
endif

let b:light_blue = '#5eb3e0'
let b:red = '#ff0000'

let b:light_grey = '#d0d0d0'
let b:darker_grey = '#A8A8A8'
let b:even_darker_grey = '#585858'
let b:darkest_grey = '#444444'
let b:black = '#000000'

let b:darker_bg = '#e3e1e1'
let b:bg = '#eeeeee'

" Pastels work well for background colors
let b:pastel_blue='#F0DEFD'
let b:pastel_rose='#FDDFDF'
let b:pastel_green='#DEFDE0'
let b:pastel_yellow='#fdffab'
let b:charcoal_grey='#36454f'

" Github diff colors
let b:github_lightgreen='#cdffd8'
let b:github_lightred='#ffdce0'
let b:github_lightorange='#fffbdd'
let b:github_difftext='#f2e496'
" call s:Col('DiffAdd',    '', 'lightgreen')
" call s:Col('DiffDelete', 'base4', 'lightred') | call s:Attr('DiffDelete', 'none')
" call s:Col('DiffChange', '', 'lightorange')
" call s:Col('DiffText',   '', 'difftext')
" call s:Col('diffFile',      'base0',    'grey2')
" call s:Col('diffNewFile',   'base0',    'grey2')
" call s:Col('diffIndexLine', 'darkblue', 'grey2')
" call s:Col('diffLine',      'base2',    'lightblue')
" call s:Col('diffSubname',   'darkblue', 'lightblue')
" call s:Col('diffAdded',     'green',    'lightgreen')
" call s:Col('diffRemoved',   'red',      'lightred')

let g:colors_name = "myscheme"

" Baseline
exec 'hi Normal term=NONE cterm=NONE ctermfg=black ctermbg=255 gui=NONE guifg= ' . b:charcoal_grey . ' guibg=' . b:bg

" Floating windows
exec 'hi NormalFloat term=NONE cterm=NONE ctermfg=black ctermbg=255 gui=NONE guifg=#000000 guibg=' . b:light_grey

" Markdown
exec 'hi markdownH1 term=NONE cterm=NONE ctermfg=NONE ctermbg=253 gui=bold guibg=NONE guifg=NONE'
exec 'hi markdownH2 term=NONE cterm=NONE ctermfg=NONE ctermbg=253 gui=bold guibg=NONE guifg=NONE'
exec 'hi markdownH3 term=NONE cterm=NONE ctermfg=NONE ctermbg=253 gui=bold guibg=NONE guifg=NONE'

exec 'hi markdownCode term=NONE cterm=NONE ctermfg=NONE ctermbg=253 gui=NONE guifg=NONE guibg=' . b:light_grey

" plasticboy/vim-markdown additions
exec 'hi mkdCode term=NONE cterm=NONE ctermfg=NONE ctermbg=253 gui=NONE guifg=NONE guibg=' . b:light_grey
exec 'hi htmlH1 term=NONE cterm=NONE ctermfg=NONE ctermbg=253 gui=bold guibg=NONE guifg=NONE'
exec 'hi htmlH2 term=NONE cterm=NONE ctermfg=NONE ctermbg=253 gui=bold guibg=NONE guifg=NONE'
exec 'hi htmlH3 term=NONE cterm=NONE ctermfg=NONE ctermbg=253 gui=bold guibg=NONE guifg=NONE'

exec 'hi markdownListMarker term=NONE cterm=NONE ctermfg=NONE ctermbg=253 gui=NONE guifg=' . b:red . ' guibg=' . b:darker_bg
exec 'hi markdownListMarker term=NONE cterm=NONE ctermfg=NONE ctermbg=253 gui=NONE guifg=NONE guibg=NONE'
exec 'hi markdownHeadingDelimiter term=NONE cterm=NONE ctermfg=NONE ctermbg=253 gui=NONE guifg=NONE guibg=NONE'

" Faded
exec 'hi ColorColumn term=NONE cterm=NONE ctermfg=NONE ctermbg=253 gui=NONE guifg=NONE guibg=' . b:light_grey
hi Comment term=NONE cterm=NONE ctermfg=248 ctermbg=NONE gui=NONE guifg=#A8A8A8 guibg=NONE
hi FoldColumn term=NONE cterm=NONE ctermfg=248 ctermbg=NONE gui=NONE guifg=#A8A8A8 guibg=NONE
hi Folded term=NONE cterm=NONE ctermfg=240 ctermbg=NONE gui=NONE guifg=#585858 guibg=NONE
hi LineNr term=NONE cterm=NONE ctermfg=248 ctermbg=bg gui=NONE guifg=#A8A8A8 guibg=NONE
hi NonText term=NONE cterm=NONE ctermfg=248 ctermbg=NONE gui=NONE guifg=#A8A8A8 guibg=NONE
hi SignColumn term=NONE cterm=NONE ctermfg=240 ctermbg=bg gui=NONE guifg=#585858 guibg=bg
hi SpecialKey term=NONE cterm=NONE ctermfg=240 ctermbg=bg gui=NONE guifg=#585858 guibg=bg
hi StatusLineNC term=NONE cterm=NONE ctermfg=fg ctermbg=248 gui=NONE guibg=#d0d0d0 guifg=#444444
exec 'hi VertSplit term=NONE cterm=NONE ctermfg=fg ctermbg=248 gui=NONE guifg=fg guibg=' . b:bg

" Highlighted
hi CursorColumn term=NONE cterm=NONE ctermfg=NONE ctermbg=253 gui=NONE guifg=NONE guibg=#DADADA
hi CursorIM term=NONE cterm=NONE ctermfg=fg ctermbg=4 gui=NONE guifg=fg guibg=#00FFFF
hi CursorLineNr term=NONE cterm=NONE ctermfg=NONE ctermbg=white gui=NONE guifg=NONE guibg=white
exec 'hi CursorLine term=NONE cterm=NONE ctermfg=NONE ctermbg=253 gui=NONE guifg=NONE guibg=' . b:darker_bg
hi Cursor term=NONE cterm=NONE ctermfg=fg ctermbg=4 gui=NONE guifg=fg guibg=#00FFFF
exec 'hi Directory term=NONE cterm=NONE ctermfg=53 ctermbg=NONE gui=bold guifg=' . b:light_blue . ' guibg=NONE'
hi ErrorMsg term=NONE cterm=NONE ctermfg=9 ctermbg=white gui=NONE guifg=#FF5555 guibg=white
hi Error term=NONE cterm=NONE ctermfg=9 ctermbg=white gui=NONE guifg=#FF5555 guibg=white
hi IncSearch term=NONE cterm=NONE ctermfg=white ctermbg=2 gui=NONE guifg=white guibg=#008000
exec 'hi MatchParen term=NONE cterm=NONE ctermfg=15 ctermbg=4 gui=bold guifg=' . b:red . ' guibg=NONE'
hi ModeMsg term=NONE cterm=NONE ctermfg=53 ctermbg=NONE gui=NONE guifg=#5F005F guibg=NONE
hi MoreMsg term=NONE cterm=NONE ctermfg=53 ctermbg=NONE gui=NONE guifg=#5F005F guibg=NONE
hi PmenuSel term=NONE cterm=NONE ctermfg=fg ctermbg=13 gui=NONE guifg=fg guibg=#FF00FF
hi Question term=NONE cterm=NONE ctermfg=53 ctermbg=NONE gui=NONE guifg=#5F005F guibg=NONE
hi Search term=NONE cterm=NONE ctermfg=white ctermbg=6 gui=NONE guifg=white guibg=#00CDCD
exec 'hi StatusLine term=NONE cterm=NONE ctermfg=white ctermbg=black gui=NONE guibg=' . b:light_blue . ' guifg=#e4e4e4'
hi WarningMsg term=NONE cterm=NONE ctermfg=9 ctermbg=white gui=NONE guifg=#FF5555 guibg=white
hi WildMenu term=NONE cterm=NONE ctermfg=black ctermbg=white gui=NONE guifg=#000000 guibg=white

" Tabline
exec 'hi TabLineSel term=reverse cterm=reverse ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=' . b:bg
exec 'hi TabLineFill term=NONE cterm=NONE ctermfg=fg ctermbg=248 gui=NONE guifg=fg guibg=' . b:darker_bg
exec 'hi TabLine term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=#d0d0d0'

" Reversed
hi PmenuSbar term=reverse cterm=reverse ctermfg=NONE ctermbg=NONE gui=reverse guifg=NONE guibg=NONE
hi Pmenu term=reverse cterm=reverse ctermfg=NONE ctermbg=NONE gui=reverse guifg=NONE guibg=NONE
hi PmenuThumb term=reverse cterm=reverse ctermfg=NONE ctermbg=NONE gui=reverse guifg=NONE guibg=NONE
hi Visual term=reverse cterm=reverse ctermfg=NONE ctermbg=NONE gui=reverse guifg=NONE guibg=NONE
hi VisualNOS term=reverse,underline cterm=reverse,underline ctermfg=NONE ctermbg=NONE gui=reverse,underline guifg=NONE guibg=NONE

" Diff
" Diff mode
exec 'hi DiffAdd term=NONE cterm=NONE ctermfg=2 ctermbg=NONE gui=NONE guifg=NONE guibg=' . b:github_lightgreen
exec 'hi DiffDelete term=NONE cterm=NONE ctermfg=1 ctermbg=NONE gui=NONE guifg=NONE guibg=' . b:github_lightred
exec 'hi DiffChange term=NONE cterm=NONE ctermfg=94 ctermbg=NONE gui=NONE guifg=NONE guibg=' . b:github_lightorange
" Changed text within a changed line
exec 'hi DiffText term=NONE cterm=NONE ctermfg=1 ctermbg=NONE gui=NONE guifg=NONE guibg=' . b:github_difftext

" Used for fugitive status buffer
exec 'hi diffAdded term=NONE cterm=NONE ctermfg=2 ctermbg=NONE gui=NONE guifg=NONE guibg=' . b:github_lightgreen
exec 'hi diffChanged term=NONE cterm=NONE ctermfg=94 ctermbg=NONE gui=NONE guifg=NONE guibg=' . b:github_lightgreen
exec 'hi diffRemoved term=NONE cterm=NONE ctermfg=1 ctermbg=NONE gui=NONE guifg=NONE guibg=' . b:github_lightred
exec 'hi diffLine term=NONE cterm=NONE ctermfg=1 ctermbg=NONE gui=NONE guifg=' . b:light_blue . ' guibg=NONE'
exec 'hi diffFile term=NONE cterm=NONE ctermfg=1 ctermbg=NONE gui=NONE guifg=' . b:light_blue . ' guibg=NONE'

" Spell
hi SpellBad term=underline cterm=underline ctermfg=5 ctermbg=NONE gui=underline guifg=#CD00CD guibg=NONE
hi SpellCap term=underline cterm=underline ctermfg=5 ctermbg=NONE gui=underline guifg=#CD00CD guibg=NONE
hi SpellLocal term=underline cterm=underline ctermfg=5 ctermbg=NONE gui=underline guifg=#CD00CD guibg=NONE
hi SpellRare term=underline cterm=underline ctermfg=5 ctermbg=NONE gui=underline guifg=#CD00CD guibg=NONE

" Valid links in .txt files
hi ValidLink term=underline cterm=underline ctermfg=5 ctermbg=NONE gui=underline guifg=#CD00CD guibg=NONE

" Vim Features
hi Menu term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Scrollbar term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Tooltip term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE

" Go
hi goFunction term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
exec 'hi goDeclaration term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=bold guifg=' . b:light_blue . ' guibg=NONE'

" Syntax Highlighting (or lack there of)
hi Boolean term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Character term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Conceal term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Conditional term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Constant term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Debug term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Define term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Delimiter term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Directive term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Exception term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Float term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Format term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Function term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Identifier term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Ignore term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Include term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Keyword term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Label term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Macro term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Number term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Operator term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi PreCondit term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi PreProc term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Repeat term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi SpecialChar term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi SpecialComment term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Special term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
exec 'hi Statement term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=bold guifg=' . b:light_blue . ' guibg=NONE'
hi StorageClass term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi String term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=#1bab44 guibg=NONE
hi Structure term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Tag term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Title term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Typedef term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Type term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Underlined term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE

" Sneak
hi SneakLabelMask term=NONE cterm=NONE ctermfg=black ctermbg=195 gui=NONE guifg=black guibg=#d7ffff
hi SneakTarget term=NONE cterm=NONE ctermfg=black ctermbg=195 gui=NONE guifg=black guibg=#d7ffff
hi SneakLabelTarget term=NONE cterm=NONE ctermfg=black ctermbg=183 gui=NONE guifg=black guibg=#d7afff
hi SneakScope term=NONE cterm=NONE ctermfg=black ctermbg=183 gui=NONE guifg=black guibg=#d7afff
