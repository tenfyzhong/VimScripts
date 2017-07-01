"==============================================================
"    file: python-mode.vimrc
"   brief: 
"    help: pymode
"
" motion:
" ========  ============================
" Key               Command
" ========  ============================
" [[        Jump to previous class or function (normal, visual, operator modes)
" ]]        Jump to next class or function  (normal, visual, operator modes)
" [M        Jump to previous class or method (normal, visual, operator modes)
" ]M        Jump to next class or method (normal, visual, operator modes)
" aC        Select a class. Ex: vaC, daC, yaC, caC (normal, operator modes)
" iC        Select inner class. Ex: viC, diC, yiC, ciC (normal, operator modes)
" aM        Select a function or method. Ex: vaM, daM, yaM, caM (normal, operator modes)
" iM        Select inner function or method. Ex: viM, diM, yiM, ciM (normal, operator modes)
" ========  ============================
"
" command:
"     PymodeDoc <args> 显示文档
"     PymodeVirtualenv <path> 激活virtualenv
"     PymodeRun 运行当前buffer或者选择的块
"     PymodeLint 检查代码
"     PymodeLintToggle 触发检查
"     PymodeLintAuto fix pep8错误
"     PymodeRopeAuto import当前cursor下的元素
"     PymodeRopeModuleToPackage
"     PymodeRopeNewProject 打开一个新的rope工程
"     PymodeRopeRedo 重做上一次重构
"     PymodeRopeRegenerate 重新生成工程cache
"     PymodeRopeRenameModule 重命名当前module
"     PymodeRopeUndoe 撤消重构
"
"    nmap:
"     <leader>rr :PymodeRun
"     <leader>rb 设置断点
"     <leader>ra autoimport
"     <leader>rg 跳到定义
"     <leader>rd show document
"     <leader>rf find it
"     <leader>ro organize import
"     <leader>re 重命名
"     <leader>r1m 重命名模块
"     <leader>r1p module to package
"     <leader>rm 提取方法
"     <leader>rl 提取变量
"     <leader>ri rope inline
"     <leader>rv move method/fields
"     <leader>rnf generate function
"     <leader>rnc generate class
"     <leader>rnp generate package
"     <leader>rs change signature
"     <leader>ru use function
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfyzhong@qq.com
" created: 2016-04-26 14:12:24
"==============================================================
PluginAdd 'klen/python-mode', {'for': 'python'}

" add paths to sys.path
let g:pymode_paths = ['~/code/python']
" W391:文本末尾有空行
let g:pymode_lint_ignore = "W391"
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
let g:pymode_breakpoint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_on_fly = 0
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
let g:pymode_trim_whitespaces = 1
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_rope_completion = 0

let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_run_bind = '<leader>rr'
let g:pymode_breakpoint_bind = '<leader>rb'
let g:pymode_rope_autoimport_bind = '<leader>ra'
let g:pymode_rope_goto_definition_bind = '<leader>rg'
let g:pymode_rope_show_doc_bind = '<leader>rd'
let g:pymode_rope_find_it_bind = '<leader>rf'
let g:pymode_rope_organize_imports_bind = '<leader>ro'
let g:pymode_rope_rename_bind = '<leader>re'
let g:pymode_rope_rename_module_bind = '<leader>r1m'
let g:pymode_rope_module_to_package_bind = '<leader>r1p'
let g:pymode_rope_extract_method_bind = '<leader>rm'
let g:pymode_rope_extract_variable_bind = '<leader>rl'
let g:pymode_rope_inline_bind = '<leader>ri'
let g:pymode_rope_move_bind = '<leader>rv'
let g:pymode_rope_generate_function_bind = '<leader>rnf'
let g:pymode_rope_generate_class_bind = '<leader>rnc'
let g:pymode_rope_generate_package_bind = '<leader>rnp'
let g:pymode_rope_change_signature_bind = '<leader>rs'
let g:pymode_rope_use_function_bind = '<leader>ru'

let g:pymode_virtualenv = 1
let g:pymode_virtualenv_path = $VIRTUAL_ENV

let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_import_after_complete = 0

let g:pymode_lint_options_pep8 =
    \ {'max_line_length': g:pymode_options_max_line_length}
let g:pymode_lint_options_pylint =
    \ {'max-line-length': g:pymode_options_max_line_length}
let g:pymode_rope = 1
