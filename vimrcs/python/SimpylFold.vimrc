"==============================================================
"    file: SimpylFold.vimrc
"   brief: python折叠
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-16 19:34:51
"==============================================================
PluginAdd 'tmhedberg/SimpylFold'

let g:SimpylFold_docstring_preview = 1

augroup SimpylfoldDefine
    au!
    autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
    autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
augroup END
