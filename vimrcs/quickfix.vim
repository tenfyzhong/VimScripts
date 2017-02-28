"==============================================================
"    file: quickfix.vimrc
"   brief: 
"
"    nmap: <leader>qk 跳到上一个quickfix的内容
"          <leader>qj 跳到下一个quickfix的内容
"          <leader>qc 关闭quickfix
"          <leader>qo 打开quickfix
"
" quickfix的nmap
"     q: cclose
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-13 20:24:38
"==============================================================
" quickfix
if !has("quickfix")
    finish
endif

if exists("g:quickfix_init")
    finish
endif

nnoremap <silent><leader>qk :call feature#quickfixDo('previous')<cr>
nnoremap <silent><leader>qj :call feature#quickfixDo('next')<cr>
nnoremap <silent><leader>qc :call feature#quickfixDo('close')<cr>
nnoremap <silent><leader>qo :call feature#quickfixDo('open')<cr>

let g:quickfix_init = 1
