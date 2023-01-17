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

function! s:go_get()
  let line = getline(line('.'))
  let items = matchlist(line, '"\(.*\)"')
  if len(items) < 2
    return
  endif
  let package = items[1]
  exec printf('AsyncRun -cwd=$(VIM_FILEDIR) -post=echom\ "go\ get\ %s\ finish" go get %s', package, package)
endfunction

let g:asyncrun_open = 8

augroup asyncrun_user_init
    autocmd!
    " autocmd User AsyncRunStop call asyncrun#quickfix_toggle(8)
    autocmd FileType go nnoremap <silent><buffer><leader>rg :call <sid>go_get()<cr>
augroup END
