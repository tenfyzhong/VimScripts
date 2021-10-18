"==============================================================
"    file: vim-highlightedyank.vim
"   brief: 
" VIM Version: 8.0
"  author: tenfy
"   email: tenfy@tenfy.cn
" created: 2018-09-20 09:11:17
"==============================================================
Plug 'machakann/vim-highlightedyank'

if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif

let g:highlightedyank_highlight_duration = 200
