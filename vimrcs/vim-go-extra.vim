"==============================================================
"    file: vim-go-extra.vimrc
"   brief: go语言的扩展插件
"
" command: Godoc 打开文档
"          Fmt 格式化代码
"          Import 添加import声明
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-16 18:39:50
"==============================================================
PluginAdd 'vim-jp/vim-go-extra'

autocmd FileType go autocmd BufWritePre <buffer> Fmt
