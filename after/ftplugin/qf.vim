"==============================================================
"    file: qf.vim
"   brief: 
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-08-23 20:03:32
"==============================================================
if exists('b:quickfix_after_plugin_init')
    finish
endif
let b:quickfix_after_plugin_init = 1

augroup quickfix_after_plugin
    autocmd BufEnter    <buffer> if winnr('$') < 2 | q | endif
    " open entry in a new horizontal window
    autocmd FileType    qf nnoremap <buffer> s <C-w><CR>
    " nnoremap <buffer> v <C-w><CR><C-w>L<C-w>p<C-w>J<C-w>p
    autocmd FileType    qf nnoremap <buffer> v <C-w><CR><C-w>L<C-w>p<C-w>J<C-w>p
    " open entry in a new tab.
    autocmd FileType    qf nnoremap <buffer> t <C-w><CR><C-w>T
    " open entry and come back
    autocmd FileType    qf nnoremap <buffer> o <CR><C-w>p
    " close 
    au FileType qf nnoremap <silent><buffer>q :call feature#quickfixDo('close')<cr>
augroup END
