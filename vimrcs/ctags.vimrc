" ctags

if executable('ctags')
    let p = file#FindFile(getcwd(), 'tags')
    if p != ''
        execute "set tags=" . p . "/tags"
    endif
	nnoremap <silent><leader>tg :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<cr>
endif

