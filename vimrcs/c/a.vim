"==============================================================
"    file: a.vim
"   brief: 在源文件和头文件中跳转
"
" command: A 头文件跳到源文件中,或者相反
"          AS split和跳转
"          AV vertical split和跳转
"          AT new tab和跳转
"          AN cycles through matches
"          IH 跳转到cursor下的文件
"          IHS split和跳转
"          IHV vertical split和跳转
"          IHT new tab和跳转
"          ITN cycles through matches
"
"    nmap: <leader>as :A
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-16 17:25:46
"==============================================================
Plug 'tenfyzhong/a.vim', {'for': ['c', 'cpp']}

let g:alternateNoDefaultAlternate = 1

augroup a_vim_init
    autocmd!
    au FileType c,cpp nnoremap <buffer><silent><leader>aa :A<cr>
    au FileType c,cpp nnoremap <buffer><silent><leader>as :AS<cr>
    au FileType c,cpp nnoremap <buffer><silent><leader>av :AV<cr>
augroup END
