"==============================================================
"    file: Mark--Karkat.vimrc
"   brief: 高亮字符串
"
"    nmap: <leader>m 高亮或者取消高亮
"          <tab>m 清除所有的高亮
"          <tab>n 在高亮处理则取消高亮，否则关闭或者开启高亮
"          <tab>r 输入正则表达式来进行高亮或者取消高亮
"          <tab>* 跳到当前高亮字符串的下一个高亮处,并记为"last mark",
"                 不在高亮字符串的时候跳到下一个"last mark"处
"          <tab># 跳到当前高亮字符串的上一个高亮处,并记为"last mark",
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
"   email: tenfyzhong@qq.com
" created: 2016-04-14 19:05:58
"==============================================================
PluginAdd 'vim-scripts/Mark--Karkat'

let g:mwAutoLoadMarks = 1
let g:mwAutoSaveMarks = 0
nmap <Plug>IgnoreMarkSearchNext <Plug>MarkSearchNext
nmap <Plug>IgnoreMarkSearchPrev <Plug>MarkSearchPrev
nmap <silent><tab>m <Plug>MarkAllClear
nmap <silent><tab>n <Plug>MarkClear
nmap <silent><tab>r <Plug>MarkRegex
nmap <silent><tab>* <Plug>MarkSearchCurrentNext
nmap <silent><tab># <Plug>MarkSearchCurrentPrev
nmap <silent><tab>/ <Plug>MarkSearchAnyNext
nmap <silent><tab>? <Plug>MarkSearchAnyPrev

vmap <silent><tab>r <Plug>MarkRegex

highlight MarkWord1 ctermfg=0 ctermbg=1 guifg=Black guibg=#8CCBEA
highlight MarkWord2 ctermfg=0 ctermbg=2 guifg=Black guibg=#8CCBEA
highlight MarkWord3 ctermfg=0 ctermbg=15 guifg=Black guibg=#8CCBEA
highlight MarkWord4 ctermfg=0 ctermbg=4 guifg=Black guibg=#8CCBEA
highlight MarkWord5 ctermfg=0 ctermbg=5 guifg=Black guibg=#8CCBEA
highlight MarkWord6 ctermfg=0 ctermbg=6 guifg=Black guibg=#8CCBEA

