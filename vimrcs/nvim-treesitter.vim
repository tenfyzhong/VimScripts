"==============================================================
"    file: nvim-treesitter.vim
"   brief: 
" VIM Version: 9.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2023-01-15 13:54:22
"==============================================================
if !has('nvim')
  finish
endif
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable                     " Disable folding at startup.
