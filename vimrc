if has('nvim')
    set runtimepath+=~/.vim,~/.vim/after
    set packpath+=.vim

    let g:python_host_prog  = '/usr/local/bin/python'
    let g:python3_host_prog = '/usr/local/bin/python3'
    let g:ycm_server_python_interpreter = g:python_host_prog
endif

let main = fnamemodify($HOME.'/.vim/main.vim', ':p')
exec 'source ' . main


