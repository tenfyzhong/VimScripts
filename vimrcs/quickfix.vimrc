" quickfix

if has ("quickfix")
    if !exists("g:quickfix_maps")
        let g:quickfix_maps = 1
        nnoremap <unique><silent><leader>qk <esc>:cprevious<cr>
        nnoremap <unique><silent><leader>qj <esc>:cnext<cr>
        nnoremap <unique><silent><leader>qc <esc>:cclose<cr>
        nnoremap <unique><silent><leader>qo <esc>:copen<cr>
    endif
endif


