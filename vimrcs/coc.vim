"==============================================================
"    file: coc.vim
"   brief: 
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2019-03-16 11:15:28
"==============================================================
PluginAdd 'neoclide/coc.nvim', {'do': 'yarn install'}

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
inoremap <expr> ( pumvisible() ? "\<C-y>" : "("
nnoremap <leader>ad <Plug>()coc-diagnostic-info)

augroup coc_init
  au!
  autocmd User CocNvimInit call coc#add_extension('coc-json', 'coc-tsserver')
augroup end
