"==============================================================
"    file: tabular.vimrc
"   brief: 自动对齐
"
" command: Tabularize {pattern} 根据pattern进行对齐
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-14 20:32:42
"==============================================================
PluginAdd 'godlygeek/tabular'

if !exists("g:tabular_maps")
    let g:tabular_maps = 1
    nnoremap <unique><silent><Leader>a= :Tabularize assignment<CR>
    vnoremap <unique><silent><Leader>a= :Tabularize assignment<CR>
    nnoremap <unique><silent><Leader>a: :Tabularize colon<CR>
    vnoremap <unique><silent><Leader>a: :Tabularize colon<CR>
endif
