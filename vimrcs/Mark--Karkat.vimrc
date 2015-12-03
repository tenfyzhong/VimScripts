PluginAdd 'vim-scripts/Mark--Karkat'

if !exists("g:Mark_Karkat_maps")
    let g:Mark_Karkat_maps = 1
    noremap <unique> <silent> <Leader>M <Plug>MarkSet
    noremap <unique> <silent> <Leader>N <Plug>MarkAllClear
endif
