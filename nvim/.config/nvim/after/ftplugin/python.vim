" Python looks gross if you wrap everything at 80
setlocal textwidth=100

" Highlight char after textwidth
call matchadd('ColorColumn', printf('\%%%sv', &textwidth+1), 100)

setlocal sw=4 sts=4 ts=4
