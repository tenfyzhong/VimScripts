"==============================================================
"    file: vim-autocdls.vimrc
"   brief: 自动运行cd ls
"
" command: Ls[!] [{path}] 列出path目录下的文件,!会同时显示点开头的文件
"          LsGrep[!] {word} 显示包含word的文件
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-14 20:40:49
"==============================================================
PluginAdd 'tenfyzhong/vim-autocdls'

let g:autocdls_alter_letter      = 1  " auto alter 'ls' to 'Ls'
let g:autocdls_newline_disp      = 1
let g:autocdls_ls_highlight      = 1
let g:autocdls_lsgrep_ignorecase = 1

