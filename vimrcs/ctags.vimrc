" ctags

if executable('ctags')
    let p = file#FindFile(getcwd(), 'tags')
    if p != ''
        execute "set tags=" . p . "/tags"
    endif

    if !exists("g:ctags_map")
        let g:ctags_map = 1
        nnoremap <unique><silent><leader>tg :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<cr>
    endif
endif

