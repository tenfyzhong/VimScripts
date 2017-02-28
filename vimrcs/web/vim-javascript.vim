"==============================================================
"    file: vim-javascript.vimrc
"   brief: js高亮和缩进
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-16 19:27:54
"==============================================================
PluginAdd 'pangloss/vim-javascript'

if version < 704
    set regexpengine=1
    syntax enable
endif

let javascript_enable_domhtmlcss=1
