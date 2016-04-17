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

augroup quickfix_init
    au!
    au FileType qf nnoremap <silent><buffer>q <esc>:cclose<cr>
augroup END


if exists("g:quickfix_init")
    finish
endif

nnoremap <unique><silent><leader>qk <esc>:cprevious<cr>
nnoremap <unique><silent><leader>qj <esc>:cnext<cr>
nnoremap <unique><silent><leader>qc <esc>:cclose<cr>
nnoremap <unique><silent><leader>qo <esc>:copen<cr>

let g:quickfix_init = 1
