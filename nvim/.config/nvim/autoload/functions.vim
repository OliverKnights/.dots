" Get current working dir
function! functions#GetCwd()
  return pathshorten(fnamemodify(getcwd(), ':~'))
endfunction

" Change dir with fasd
function! functions#Zcd(...)
  let cmd = 'fasd -d -e printf'
  for arg in a:000
    let cmd = cmd . ' ' . arg
  endfor
  let path = system(cmd)
  if isdirectory(path)
    echo path
    exec 'lcd' fnameescape(path)
  endif

  :Dirvish
endfunction

fun! functions#Find(...)
  let cmd = "find . -type f \\( -ipath '*" . join(a:000, "*") . "*' ! -ipath '*.git*' ! -ipath './vendor*' ! -ipath '*.ccls-cache*' \\) "
  let found = systemlist(cmd)
  let dict = map(found, { index, file -> { 'filename': file } })
  call setqflist(found)
  cc 1
endfun
