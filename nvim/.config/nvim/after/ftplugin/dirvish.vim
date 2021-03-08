setlocal textwidth=0
nnoremap <silent><buffer> D :Shdo rm -r %{}<CR>
xnoremap <silent><buffer> D :Shdo rm -r %{}<CR>
nnoremap <silent><buffer> M :Shdo mv %{} %<CR>$a
xnoremap <buffer> M :Shdo mv %{} %
xnoremap <buffer> M :Shdo mv %{} %
nnoremap <buffer> Y :Shdo cp -R %{} %
xnoremap <buffer> Y :Shdo cp -R %{} %
nnoremap <buffer> C :e %
nnoremap <buffer> I :!mkdir %
