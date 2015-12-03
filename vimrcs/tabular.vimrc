PluginAdd 'godlygeek/tabular'

if !exists("g:tabular_maps")
    let g:tabular_maps = 1
    nnoremap <unique><silent><Leader>a= :Tabularize assignment<CR>
    vnoremap <unique><silent><Leader>a= :Tabularize assignment<CR>
    nnoremap <unique><silent><Leader>a: :Tabularize colon<CR>
    vnoremap <unique><silent><Leader>a: :Tabularize colon<CR>
endif
