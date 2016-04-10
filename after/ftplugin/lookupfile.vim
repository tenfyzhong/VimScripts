if !exists(':LookupFile')
    finish
endif

imap <buffer><silent><leader>uf <C-O><Plug>LookupFile
setlocal ignorecase
nnoremap <buffer> <Esc><Esc> <C-W>q
inoremap <buffer> <Esc><Esc> <Esc><C-W>q
