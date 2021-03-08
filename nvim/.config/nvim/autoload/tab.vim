fu! tab#TabRename(name)
  call settabvar(tabpagenr(), 'name', a:name)
  redrawtabline
endfu

fu! tab#TabReset()
  call settabvar(tabpagenr(), 'name', '')
  redrawtabline
endfu

fu! tab#TabLabel(n)
  let l:label = ''
  " append the tab number, useful for {num}gt command
  let l:label .= a:n . ' '

  let l:tabname = gettabvar(a:n, 'name', '')
  if l:tabname != ''
    let l:label .= l:tabname
    return l:label
  endif

  " get the list of open buffers in this tab
  let l:buflist = tabpagebuflist(a:n)
  " get the current window in this tab
  let l:winnr = tabpagewinnr(a:n)
  let l:workingdir = fnamemodify(getcwd(l:winnr, a:n), ':~')
  let l:label .= pathshorten(l:workingdir)

  " current file name if there is one
  let l:pathlist = split(bufname(l:buflist[l:winnr - 1]), '/')
  if len(l:pathlist) > 0
    let l:label .= ' ' . l:pathlist[len(l:pathlist)-1]
  endif
  return l:label
endfu

fu! tab#TabLine()
  let s = ''
  " for each tab
  for i in range(tabpagenr('$'))
    " if this is the current tab
    if i + 1 == tabpagenr()
      " Set the highlighting to the 'Selected' tab group
      let s .= '%#TabLineSel#'
    else
      " Otherwise set it to TabLine
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by TabLabel()
    let s .= ' %{tab#TabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page number
  let s .= '%#TabLineFill#%T'
  return s
endfu
