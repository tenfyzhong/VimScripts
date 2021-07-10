"==============================================================
"    file: Mark--Karkat.vim
"   brief: 高亮字符串
"
"    nmap: <leader>m 高亮或者取消高亮
"          <tab>m 清除所有的高亮
"          <tab>r 输入正则表达式来进行高亮或者取消高亮
"          <tab>n 跳到当前高亮字符串的下一个高亮处,并记为"last mark",
"                 不在高亮字符串的时候跳到下一个"last mark"处
"          <tab>N 跳到当前高亮字符串的上一个高亮处,并记为"last mark",
"                 不在高亮字符串的时候跳到上一个"last mark"处
"          <tab>/ 跳到下一个任意的高亮处
"          <tab>? 跳到上一个任意的高亮处
"
"   vmap:  <tab>r 输入正则表达式来进行高亮或者取消高亮
"
" command: Mark {pattern} 高亮pattern.只能是ignorecase
"          Mark 暂时去掉高亮,再次调用则高亮
"          MarkClear 清除所有的高亮
"          MarkSave 保存高亮,默认自动保存
"          MarkLoad 加载高亮,不默认自动加载
"
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-14 19:05:58
"==============================================================
PluginAdd 'vim-scripts/Mark--Karkat'

let g:mwAutoLoadMarks = 1
let g:mwAutoSaveMarks = 1
nmap <Plug>IgnoreMarkSearchNext <Plug>MarkSearchNext
nmap <Plug>IgnoreMarkSearchPrev <Plug>MarkSearchPrev
nmap <silent><tab>m <Plug>MarkAllClear
nmap <silent><tab>r <Plug>MarkRegex
nmap <silent><tab>n <Plug>MarkSearchCurrentNext
nmap <silent><tab>N <Plug>MarkSearchCurrentPrev
nmap <silent><tab>/ <Plug>MarkSearchAnyNext
nmap <silent><tab>? <Plug>MarkSearchAnyPrev

vmap <silent><tab>r <Plug>MarkRegex

highlight MarkWord1  ctermfg=17  ctermbg=112 cterm=none guifg=#001767 guibg=#8fd757 gui=none
highlight MarkWord2  ctermfg=52  ctermbg=221 cterm=none guifg=#570000 guibg=#fcd757 gui=none
highlight MarkWord3  ctermfg=225 ctermbg=90  cterm=none guifg=#ffdff7 guibg=#8f2f8f gui=none
highlight MarkWord4  ctermfg=195 ctermbg=68  cterm=none guifg=#dffcfc guibg=#5783c7 gui=none
highlight MarkWord5  ctermfg=19  ctermbg=189 cterm=bold guifg=#0000af guibg=#d7d7fc gui=bold
highlight MarkWord6  ctermfg=89  ctermbg=225 cterm=bold guifg=#87005f guibg=#fcd7fc gui=bold
highlight MarkWord7  ctermfg=52  ctermbg=180 cterm=bold guifg=#570000 guibg=#dfb787 gui=bold
highlight MarkWord8  ctermfg=223 ctermbg=130 cterm=bold guifg=#fcd7a7 guibg=#af5f17 gui=bold
highlight MarkWord9  ctermfg=230 ctermbg=242 cterm=bold guifg=#f7f7d7 guibg=#676767 gui=bold
highlight MarkWord10 ctermfg=22  ctermbg=194 cterm=bold guifg=#004f00 guibg=#d7f7df gui=bold
