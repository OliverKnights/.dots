" increment and decrement TODO
nnoremap <silent> gln :lua increment_list_state(1)<CR>
nnoremap <silent> glp :lua increment_list_state(-1)<CR>

" inoremap <buffer> <CR> <CR><Esc>:lua require'lists'.auto_list()<CR>S

setlocal suffixesadd=.md
setlocal textwidth=0
