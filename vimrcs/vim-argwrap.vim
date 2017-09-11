"==============================================================
"    file: vim-argwrap.vimrc
"   brief: 参数换行和同行模式转换
"
" command: :ArgWrap 转换
"    nmap: <leader>aw :ArgWrap
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-07-09 19:53:40
"==============================================================
PluginAdd 'FooSoft/vim-argwrap'

if exists('g:vim_argwrap_setting')
    finish
endif
let g:vim_argwrap_setting = 1
let g:argwrap_wrap_closing_brace = 0

nnoremap <silent><leader>aw :ArgWrap<cr>
