"==============================================================
"    file: vim-grepper.vim
"   brief: grep工具，支持git,ag,ack等
"
" command:
"     Grepper 启动交互的grep
"     Todo 查找todo
"
"    nmap:
"      gp 查找一个operator
"      <leader>* 查找当前单词
"
"    xmap:
"      gp 查找选中
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2019-04-10 10:30:01
"==============================================================
Plug 'mhinz/vim-grepper'

let g:grepper = {
      \ "highlight": 1,
      \ "tools": ['ag'],
      \}

command! Todo Grepper -noprompt -tool ag -grepprg ag --vimgrep '(\bTODO\b|\bBUG\b|\bERROR\b)'
nmap gp <plug>(GrepperOperator)
xmap gp <plug>(GrepperOperator)
nnoremap <leader>*  :Grepper -tool ag -cword -noprompt<cr>
