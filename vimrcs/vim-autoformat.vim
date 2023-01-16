"==============================================================
"    file: vim-autoformat.vim
"   brief: 格式化代码
"
" command: Autoformat [{filetype}] 格式化当前文件
"
"    nmap: <leader>af 进行format
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-15 17:33:22
"==============================================================
Plug 'Chiel92/vim-autoformat', {'do': 'pip install yapf sqlparse'}

let g:formatdef_my_custom_cpp = '"clang-format -style=file"'
let g:formatters_cpp = ['my_custom_cpp']
let g:formatters_python = ['yapf']
let g:formatdef_gofmt_2 = '"gofmt -s"'
let g:run_all_formatters_go = 1


augroup autoformat_setting
    au!
    autocmd FileType python let b:autoformat_autoindent = 0
    autocmd FileType python let b:autoformat_retab = 0
augroup END

nnoremap <leader>af :Autoformat<cr>
