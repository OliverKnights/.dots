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

command! -buffer -range=% Gofmt let b:winview = winsaveview() |
  \ silent! execute <line1> . "," . <line2> . "!gofmt " |
  \ call winrestview(b:winview)

command! -buffer -range=% Goimport let b:winview = winsaveview() |
  \ silent! execute <line1> . "," . <line2> . "!goimports " |
  \ call winrestview(b:winview)

fun Golint()
  let b:winview = winsaveview()
  silent! cexpr system('golint ' . expand('%'))
  call winrestview(b:winview)
endfun
command! -buffer Golint call Golint()

" Auto format and import
augroup Goupdate
  autocmd!
  autocmd BufWritePre <buffer> Gofmt
  autocmd BufWritePre <buffer> Goimport
augroup END

