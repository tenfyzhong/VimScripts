AddTabularPattern! define /#define \w*\zs /l0
AddTabularPattern! colon  /:\zs


" augroup {{{
augroup tabular_map_define
    au!
    autocmd BufWritePre tabular_map_define.vim Tab /^AddTabularPattern!\? \w*\zs /l0
augroup END
" }}}
