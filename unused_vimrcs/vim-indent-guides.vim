"==============================================================
"    file: vim-indent-guides.vimrc
"   brief: 显示缩进
"
" command: IndentGuidesToggle 触发显示indent
"          IndentGuidesEnable 打开显示indent
"          IndentGuidesDisable 关闭显示indent
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-25 23:16:59
"==============================================================
PluginAdd 'nathanaelkane/vim-indent-guides'

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar']
let g:indent_guides_default_mapping = 0
