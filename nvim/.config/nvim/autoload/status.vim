function! status#Statusline(winnum)
  let sl = ''
  if a:winnum == winnr()
    let sl .= '%1* %{winnr()} '     " win number
    let sl .='%t %<'                " filename
    let sl .='%m%*'                 " modified
    let sl .='%='                   " format right
    let sl .='%{functions#GetCwd()} '         " working dir
    let sl .='%y %1* '              " filetype
    let sl .='%l'                   " linenumber
    let sl .=':%c '                 " column number
  else
    let sl .=' %{winnr()} '         " win number
    let sl .='%t %<'                " filename
    let sl .='%m%*'                 " modified
    let sl .='%='                   " format right
    let sl .='%{functions#GetCwd()} '         " working dir
    let sl .='%y  '                 " filetype
    let sl .='%l'                   " linenumber
    let sl .=':%c '                 " column number
  endif
  return sl
endfunction

" Refresh statusline
function! status#RefreshStatus()
  for nr in range(1, winnr('$'))
    call setwinvar(nr, '&statusline', '%!status#Statusline(' . nr . ')')
  endfor
endfunction

