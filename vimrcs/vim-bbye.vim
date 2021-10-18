"==============================================================
"    file: vim-bbye.vim
"   brief: 删除buffer但是不关闭window
"
" command: Bdelete 删除buffer
"    nmap: <leader>bd :Bdelete
" VIM Version: 8.0
"  author: tenfy
"   email: tenfy@tenfy.cn
" created: 2017-08-07 15:55:31
"==============================================================
Plug 'moll/vim-bbye'

nnoremap <silent><leader>bd :<C-u>Bdelete<CR>
