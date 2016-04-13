"==============================================================
"    file: quickfix.vimrc
"   brief: 
"
"    nmap: <leader>qk 跳到上一个quickfix的内容
"          <leader>qj 跳到下一个quickfix的内容
"          <leader>qc 关闭quickfix
"          <leader>qo 打开quickfix
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-13 20:24:38
"==============================================================
" quickfix
if !has("quickfix")
    finish
endif

if !exists("g:quickfix_maps")
    let g:quickfix_maps = 1
    nnoremap <unique><silent><leader>qk <esc>:cprevious<cr>
    nnoremap <unique><silent><leader>qj <esc>:cnext<cr>
    nnoremap <unique><silent><leader>qc <esc>:cclose<cr>
    nnoremap <unique><silent><leader>qo <esc>:copen<cr>
endif


