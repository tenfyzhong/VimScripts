if !exists(':Tabularize') || get(g:, 'no_default_tabular_maps', 0)
  finish " Tabular.vim wasn't loaded or the default maps are unwanted
endif

AddTabularPattern! define    /#define \w*\zs /l0
AddTabularPattern! colon     /:\zs/l0r1
AddTabularPattern! statement /.*\zs\ze \w*;\?/l0r1


" augroup {{{
augroup tabular_map_define
    au!
    autocmd BufWritePre tabular_map_define.vim Tab /^AddTabularPattern!\? \w*\zs /l0
augroup END
" }}}
