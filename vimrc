if has('nvim')
    finish
endif
let main = expand('<sfile>:h:p').'/main.vim'
exec 'source ' . main
