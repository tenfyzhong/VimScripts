"==============================================================
"    file: incsearch.vim
"   brief: 高亮查找,/和?查找时会启用
"
"    nmap: <esc><esc> 取消高亮
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-14 13:34:27
"==============================================================
if has('nvim')
  finish
endif
Plug 'haya14busa/incsearch.vim'

map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

set hlsearch
let g:incsearch#auto_nohlsearch = 0

