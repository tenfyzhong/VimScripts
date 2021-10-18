"==============================================================
"    file: vim-isort.vim
"   brief: 对import进行排序
"
" command:
"     Isort 排序
"
"    nmap:
"     <leader>is :Isort
"
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2019-05-27 16:20:28
"==============================================================
Plug 'fisadev/vim-isort', {'do': 'pip install isort', 'for': 'python'}

augroup vim_isort_init
  autocmd BufWritePre *.py Isort
  autocmd FileType python nnoremap <buffer><silent><leader>is :<c-u>Isort<cr>
augroup END

let g:vim_isort_map = ''

