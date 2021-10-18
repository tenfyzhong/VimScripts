"==============================================================
"    file: asyncrun.vim
"   brief: 异步执行外部程序
"
" command: AsyncRun[!] [options] {cmd} 执行cmd命令，[!]关闭自动滚动
"          AsyncStop[!] 停止任务，[!]会使用KILL信号
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2017-02-09 12:57:16
"==============================================================
Plug 'skywind3000/asyncrun.vim'

augroup asyncrun_user_init
    autocmd!
    autocmd User AsyncRunStop call asyncrun#quickfix_toggle(8)
augroup END
