" These options allow using 'gf' on go imports
" see :h option-backslash for how to escape properly
" :checkpath! to view all included files
" to test regex do /<c-r>=&include in a go buffer
setlocal include=^\\%(\\t\\%(\\w\\+\\s\\+\\)\\=\\\|import\ \\)\"\\zs[^\"]*\\ze\"$
setlocal suffixesadd=.go,/

setlocal textwidth=100
setlocal noexpandtab

" Highlight char after textwidth
call matchadd('ColorColumn', printf('\%%%sv', &textwidth+1), 100)

fun Golint()
  let b:winview = winsaveview()
  silent! cexpr system('golint ' . expand('%'))
  call winrestview(b:winview)
endfun
command! -buffer Golint call Golint()
