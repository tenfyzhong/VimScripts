"==============================================================
"    file: coc.vim
"   brief: 
"   插件 CocInstall coc-json coc-tsserver  coc-ultisnips coc-lists','coc-pairs coc-emmet coc-html coc-yaml coc-css
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2019-03-16 11:15:28
"==============================================================
Plug 'neoclide/coc.nvim', {'do': 'yarn install'}

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
inoremap <expr> ( pumvisible() ? "\<C-y>" : "("
nnoremap <leader>ad <Plug>()coc-diagnostic-info)

