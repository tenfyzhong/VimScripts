"==============================================================
"    file: vim-indent-guides.vim
"   brief: 
" VIM Version: 8.0
"  author: tenfy
"   email: tenfy@tenfy.cn
" created: 2017-09-26 10:29:29
"==============================================================
PluginAdd 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

let g:indent_guides_auto_colors = 0
let g:indent_guides_tab_guides = 0
augroup indent_guides_init
  autocmd!
  autocmd VimEnter * :hi IndentGuidesOdd  ctermfg=242 ctermbg=0 guifg=grey15 guibg=grey30
  autocmd VimEnter * :hi IndentGuidesEven ctermfg=242 ctermbg=0 guifg=grey15 guibg=grey30
augroup END
