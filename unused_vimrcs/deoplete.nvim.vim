"==============================================================
"    file: deoplete.nvim.vim
"   brief: 
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2018-12-18 10:10:08
"==============================================================
if !has('nvim')
    finish
endif
PluginAdd 'Shougo/deoplete.nvim'
PluginAdd 'zchee/deoplete-jedi'
let g:deoplete#enable_at_startup = 1
