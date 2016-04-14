if !exists(':LookupFile')
    finish
endif

setlocal ignorecase
nnoremap <buffer><Esc><Esc> <C-W>q
inoremap <buffer><Esc><Esc> <Esc><C-W>q
inoremap <buffer><c-j> <c-n>
inoremap <buffer><c-k> <c-p>
