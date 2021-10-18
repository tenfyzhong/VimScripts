"==============================================================
"    file: bullets.vim
"   brief: 
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2020-01-21 14:35:25
"==============================================================
Plug 'dkarter/bullets.vim'

let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \]

let g:bullets_checkbox_markers = ' x'
let g:bullets_renumber_on_change = 0
