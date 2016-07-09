"==============================================================
"    file: vim-argwrap.vimrc
"   brief: 参数换行和同行模式转换
"
" command: :ArgWrap 转换
"    nmap: <leader>aw :ArgWrap
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-07-09 19:53:40
"==============================================================
PluginAdd 'FooSoft/vim-argwrap'

if exists('g:vim_argwrap_setting')
    finish
endif
let g:vim_argwrap_setting = 1

nnoremap <silent><unique><leader>aw :ArgWrap<cr>
