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
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfyzhong@qq.com
" created: 2016-04-13 14:46:55
"==============================================================
PluginAdd 'vim-scripts/DoxygenToolkit.vim'

let g:load_doxygen_syntax 					= 1
let g:doxygen_enhanced_color	 			= 1
let g:DoxygenToolkit_briefTag_funcName 		= "yes"
" let g:DoxygenToolkit_authorName 			= substitute(system("whoami"), "\s*", "", "g")

if !exists("g:DoxygenToolkit_vim_maps")
    let g:DoxygenToolkit_vim_maps = 1
    nnoremap <silent><leader>dx <esc>:Dox<cr>
    nnoremap <silent><leader>da <esc>:DoxAuthor<cr>
    nnoremap <silent><leader>dl <esc>:DoxLic<cr>
endif
