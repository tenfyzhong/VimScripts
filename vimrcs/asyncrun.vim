"==============================================================
"    file: asyncrun.vim
"   brief: 
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfyzhong@tencent.com
" created: 2017-02-09 12:57:16
"==============================================================
PluginAdd 'skywind3000/asyncrun.vim'

augroup asyncrun_user_init
    au!
    autocmd User AsyncRunStop call asyncrun#quickfix_toggle(8)
augroup END
