"==============================================================
"    file: a.vim.vimrc
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
"   email: 364755805@qq.com
" created: 2016-04-16 17:25:46
"==============================================================
PluginAdd 'tenfyzhong/a.vim'

let g:alternateNoDefaultAlternate = 1

if exists("g:a_vim_init")
    finish
endif

nnoremap <silent><leader>as :A<cr>
let g:a_vim_init = 1
