augroup quickfix_after_plugin
    autocmd!
    autocmd BufEnter <buffer> if winnr('$') < 2 | q | endif
    " open entry in a new horizontal window
    autocmd FileType qf nnoremap <buffer> s <C-w><CR>
    " nnoremap <buffer> v <C-w><CR><C-w>L<C-w>p<C-w>J<C-w>p
    autocmd FileType qf nnoremap <buffer> v <C-w><CR><C-w>L<C-w>p<C-w>J<C-w>p
    " open entry in a new tab.
    autocmd FileType qf nnoremap <buffer> t <C-w><CR><C-w>T
    " open entry and come back
    autocmd FileType qf nnoremap <buffer> o <CR><C-w>p
    " close 
    autocmd FileType qf nnoremap <silent><buffer>q :call feature#quickfixDo('close')<cr>
augroup END
