"**********************************************************************
" ctags
" echom "ctags plugin"
set tags=tags
nmap <silent><leader>tg :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<cr>
"**********************************************************************

