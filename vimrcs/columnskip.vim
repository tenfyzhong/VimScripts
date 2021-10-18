"==============================================================
"    file: columnskip.vim
"   brief: 行对齐的上下移动
"
" mappping: <leader>k 行对齐上移
"           <leader>j 行对齐下移
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2020-04-15 09:47:59
"==============================================================
Plug 'tyru/columnskip.vim'

nmap <leader>j <Plug>(columnskip-j)
omap <leader>j <Plug>(columnskip-j)
xmap <leader>j <Plug>(columnskip-j)
nmap <leader>k <Plug>(columnskip-k)
omap <leader>k <Plug>(columnskip-k)
xmap <leader>k <Plug>(columnskip-k)
