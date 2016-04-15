"==============================================================
"    file: vim-autoformat.vimrc
"   brief: 格式化代码
"
" command: Autoformat [{filetype}] 格式化当前文件
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-15 17:33:22
"==============================================================
PluginAdd 'Chiel92/vim-autoformat'

let g:formatdef_my_custom_cpp = '"clang-format -style=file"'
let g:formatters_cpp = ['my_custom_cpp']
