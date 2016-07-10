"==============================================================
"    file: Mark--Karkat.vimrc
"   brief: 高亮字符串
"
"    nmap: <leader>m 高亮或者取消高亮
"          <leader>r 输入正则表达式来进行高亮或者取消高亮
"          <leader>N 在高亮处理则取消高亮，否则关闭或者开启高亮
"          <leader>M 清除所有的高亮
"          <leader>* 跳到当前高亮字符串的下一个高亮处,并记为"last mark",
"                    不在高亮字符串的时候跳到下一个"last mark"处
"          <leader>/ 跳到下一个任意的高亮处
"
" command: Mark {pattern} 高亮pattern.只能是ignorecase
"          Mark 暂时去掉高亮,再次调用则高亮
"          MarkClear 清除所有的高亮
"          MarkSave 保存高亮,默认自动保存
"          MarkLoad 加载高亮,不默认自动加载
"
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-14 19:05:58
"==============================================================
PluginAdd 'vim-scripts/Mark--Karkat'

nmap <Plug>IgnoreMarkSearchNext <Plug>MarkSearchNext
nmap <Plug>IgnoreMarkSearchPrev <Plug>MarkSearchPrev
nmap <Leader>M <Plug>MarkAllClear
nmap <Leader>N <Plug>MarkClear

