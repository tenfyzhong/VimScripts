"==============================================================
"    file: vim-compiler-go.vim
"   brief: go语言编译查错
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-16 18:38:32
"==============================================================
Plug 'rjohnsondev/vim-compiler-go'

autocmd FileType go compiler golang

let g:golang_onwrite = 0
let g:golang_cwindow = 0
