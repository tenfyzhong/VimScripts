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
Plug 'haya14busa/incsearch.vim'

if exists("g:incsearch_vim_init")
    finish
endif

map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

set hlsearch
let g:incsearch#auto_nohlsearch = 0

nnoremap <silent><Esc><Esc> :<C-u>nohlsearch<CR>

let g:incsearch_vim_init = 1
