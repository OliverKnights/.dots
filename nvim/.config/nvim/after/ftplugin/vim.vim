" Highlight columns past 100
setlocal textwidth=100
call matchadd('ColorColumn', '\%101v', 100)

setlocal iskeyword+=# " vim uses # for namespacing functions
