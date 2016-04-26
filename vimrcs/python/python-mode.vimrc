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
"       <leader>r :PymodeRun
"       <leader>b 设置断点
"       <c-c>d show document
"       <c-c>g 跳到定义
"       <c-c>rr 重命名
"       <c-c>r1r 重命名模块
"       <c-c>ro import组织
"       <c-c>ra import
"       <c-c>r1p PymodeRopeModuleToPackage
"       <c-c>rm 提取方法
"       <c-c>rl 提取变量
"       <c-c>ru use function
"       <c-c>rv move method/fields
"       <c-c>rs 修改函数签名
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-26 14:12:24
"==============================================================
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

let g:pymode_virtualenv = 1
let g:pymode_virtualenv_path = $VIRTUAL_ENV

let g:pymode_lint_options_pep8 =
    \ {'max_line_length': g:pymode_options_max_line_length}
let g:pymode_lint_options_pylint =
    \ {'max-line-length': g:pymode_options_max_line_length}
let g:pymode_rope = 1
