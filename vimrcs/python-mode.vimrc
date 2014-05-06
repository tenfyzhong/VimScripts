" python_mode
" help pymode
if !exists('PYTHON_MODE')
let PYTHON_MODE = 1

" add paths to sys.path
let g:pymode_paths = []
" E221:操作符左边多个空格
" E222:操作符右边多个空格
" W391:文本末尾有空行
let g:pymode_lint_ignore = "E221,E222,W391"

endif
