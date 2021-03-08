if exists("b:current_syntax")
  finish
endif

syntax keyword StatusTodo TODO
syntax keyword StatusDoing DOING
syntax keyword StatusDone DONE

highlight StatusTODO   guibg=Red gui=bold
highlight StatusDOING   guibg=#0099f7 gui=bold
highlight StatusDONE  guibg=LightGreen gui=bold
highlight Quote  guibg=LightGrey gui=italic


