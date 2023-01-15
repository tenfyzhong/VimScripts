"==============================================================
"    file: aerial.nvim.vim
"   brief: 
" VIM Version: 9.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2023-01-15 13:49:12
"==============================================================
if !has('nvim')
  finish
endif
Plug 'stevearc/aerial.nvim'

" augroup aerial_init
"   au!
" augroup END
nnoremap <silent><leader>ft :call aerial#fzf()<cr>
