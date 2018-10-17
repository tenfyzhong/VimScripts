"==============================================================
"    file: large_file.vim
"   brief: 
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2017-03-30 18:59:53
"==============================================================

" file is large from 100K
let g:LargeFile = 1024 * 100
augroup LargeFile 
    autocmd!
    autocmd BufReadPre * call <SID>LargeFile()
augroup END

function! s:LargeFile()
    let f = getfsize(expand('<afile>'))
    if (f > g:LargeFile || f == -2) && &foldmethod ==? 'syntax'
        setlocal foldmethod=indent
        echom 'The file is larger than ' . (g:LargeFile / 1024) . ' KB, so set foldmethod=indent.'
    endif
endfunction
