"==============================================================
"    file: DoxygenToolkit.vim
"   brief: 插入doxygen的注释
"
" command: :Dox 给函数插入注释
"          :DoxAuthor 插入作者和版本
"          :DoxLic 插入证书
"
"    nmap: <leader>dx :Dox
"          <leader>da :DoxAuthor
"          <leader>dl :DoxLic
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-13 14:46:55
"==============================================================
PluginAdd 'vim-scripts/DoxygenToolkit.vim', {'for': ['c', 'cpp']}

let g:load_doxygen_syntax              = 1
let g:doxygen_enhanced_color           = 1
let g:DoxygenToolkit_briefTag_funcName = "yes"

augroup doxygen_toolkit_init
    autocmd!
    autocmd FileType c,cpp nnoremap <buffer><silent><leader>dx <esc>:Dox<cr>
    autocmd FileType c,cpp nnoremap <buffer><silent><leader>da <esc>:DoxAuthor<cr>
    autocmd FileType c,cpp nnoremap <buffer><silent><leader>dl <esc>:DoxLic<cr>
augroup END
