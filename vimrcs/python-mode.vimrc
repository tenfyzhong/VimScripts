" python_mode
" help pymode
PluginAdd 'klen/python-mode'

" add paths to sys.path
let g:pymode_paths = ['~/code/python']
" E221:操作符左边多个空格
" E222:操作符右边多个空格
" W391:文本末尾有空行
let g:pymode_lint_ignore = "E221,E222,W391"
let g:pymode = 1
let g:pymode_folding = 0
let g:pymode_options = 1
let g:pymode_options_max_line_length = 80
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6
let g:pymode_indent = 1
let g:pymode_motion = 1
let g:pymode_doc = 1
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>r'
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_on_fly = 0
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
let g:pymode_lint_options_pep8 =
    \ {'max_line_length': g:pymode_options_max_line_length}
let g:pymode_lint_options_pylint =
    \ {'max-line-length': g:pymode_options_max_line_length}
