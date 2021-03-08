" Send a the current buffer contents to an interactive split term
" If there's no split term, open a new one
" Only works with 2 side by side splits
fun! terminal#SendBuf()
  if len(tabpagebuflist()) < 2
    vs term://bash
    stopinsert
    " let the terminal prompt render
    sleep 20m
  else
    wincmd w
  endif
  let l:id = b:terminal_job_id
  normal G
  wincmd w
  let l:lines = getbufline(bufnr('%'), 1, '$')
  " append final newline
  call add(l:lines, "")
  call chansend(l:id, l:lines)
endfun

" Send a visual selection to a split term, opening a new terminal if one doesn't exist
fun! terminal#SendRegion()
  if len(tabpagebuflist()) < 2
    vs term://bash
    stopinsert
    " let the terminal prompt render
    sleep 20m
  else
    wincmd w
  endif
  let l:id = b:terminal_job_id
  normal G
  wincmd w
  let l:startline = getpos("'<")[1]
  let l:endline = getpos("'>")[1]
  let l:lines = getbufline(bufnr('%'), l:startline, l:endline)
  " append final newline
  call add(l:lines, "")
  call chansend(l:id, l:lines)
endfun
