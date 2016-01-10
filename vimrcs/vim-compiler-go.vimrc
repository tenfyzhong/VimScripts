PluginAdd 'rjohnsondev/vim-compiler-go'

autocmd FileType go compiler golang

let g:golang_onwrite = 0
let g:golang_cwindow = 0
