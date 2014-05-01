" SLIMV_VIM
if !exists('SLIMV_VIM')
let SLIMV_VIM = 1

let g:slimv_swank_cmd = '! xterm -e sbcl --load ~/.vim/bundle/slimv.vim/slime/start-swank.lisp &'
let g:slimv_repl_split = 2
let g:slimv_leader = ','

endif
