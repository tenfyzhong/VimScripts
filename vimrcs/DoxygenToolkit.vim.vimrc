"==============================================================
"    file: DoxygenToolkit.vim.vimrc
"   brief: 插入doxygen的注释
"
" command: :Dox 给函数插入注释
"          :DoxAuthor 插入作者和版本
"          :DoxLic 插入证书
"
"    nmap: <leader>dx :Dox
"          <leader>da :DoxAuthor
"          <leader>dl :DoxLic
"    imap: <leader>dx <esc>:Dox
"          <leader>da <esc>:DoxAuthor
"          <leader>dl <esc>:DoxLic
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-13 14:46:55
"==============================================================
PluginAdd 'vim-scripts/DoxygenToolkit.vim'

let g:load_doxygen_syntax 					= 1
let g:doxygen_enhanced_color	 			= 1
let g:DoxygenToolkit_briefTag_funcName 		= "yes"
let g:DoxygenToolkit_authorName 			= "tenfyzhong"

if !exists("g:DoxygenToolkit_vim_maps")
    let g:DoxygenToolkit_vim_maps = 1
    nnoremap <unique><silent><leader>dx <esc>:Dox<cr>
    " inoremap <unique><silent><leader>dx <esc>:Dox<cr>
    nnoremap <unique><silent><leader>da <esc>:DoxAuthor<cr>
    " inoremap <unique><silent><leader>da <esc>:DoxAuthor<cr>
    nnoremap <unique><silent><leader>dl <esc>:DoxLic<cr>
    " inoremap <unique><silent><leader>dl <esc>:DoxLic<cr>
endif
