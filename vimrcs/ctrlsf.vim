"==============================================================
"    file: ctrlsf.vim
"   brief: 搜索字符串
"
"     nmap: <leader>sf 开启命令行，提示输入文字进行搜索
"           <leader>sb 对当前光标的单词进行全匹配搜索
"           <leader>sn 开启命令行，把当前光标的单词填到参数
"           <leader>sp 开启命令行，当上一次搜索的单词填到参数
"           <leader>st 触发CtrlSF窗口
"           <leader>sr 触发在工程目录搜索还是当前目录搜索
"
"     vmap: <leader>sf 搜索当前选中的字符串
"           <leader>sF 开启命令行，把当前选中的填到参数，提示用户输入
"
"  command:
"           CtrlSF [arguments] {pattern} [path] ... 搜索
"           CtrlSFOpen 重新打开关闭的窗口
"           CtrlSFUpdate 更新上一次的模式搜索结果
"           CtrlSFClose 关闭CtrlSF窗口
"           CtrlSFClearHL 清除高亮
"           CtrlSFToggle 触发CtrlSF窗口
"           CtrlSFToggleMap 触发CtrlSF的默认mapping，只有在CtrlSF窗口有用
"
" CtrlSF窗口的mapping:
"         Enter, o, double-click - Open corresponding file of current line in the window which CtrlSF is launched from.
"         <C-O> - Like Enter but open file in a horizontal split window.
"         t - Like Enter but open file in a new tab.
"         p - Like Enter but open file in a preview window.
"         P - Like Enter but open file in a preview window and switch focus to it.
"         O - Like Enter but always leave CtrlSF window opening.
"         T - Like t but focus CtrlSF window instead of new opened tab.
"         M - Switch result window between normal view and compact view.
"         q - Quit CtrlSF window.
"         <C-J> - Move cursor to next match.
"         <C-K> - Move cursor to previous match.
" Maps by default in preview window:
"         <q>            Quit preview mode.
"
" Arguments:
" '-after', '-A'    匹配行后显示的行数
" '-before', '-B'   匹配行前显示的行数
" '-context', '-C'  匹配行前后显示的行数
" '-filetype'       指定搜索的文件类型
" '-filematch'      指定要搜索的文件名模式进行搜索
" '-ignorecase', '-I' 忽略大小写
" '-ignoredir'      忽略目录
" '-literal', '-L'  literal string
" '-matchcase', '-S' 识别大小写
" '-regex', '-R'    使用正则表达式匹配
" '-smartcase'      smartcase
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfyzhong@qq.com
" created: 2017-06-24 11:10:49
"==============================================================
PluginAdd 'dyng/ctrlsf.vim'

" let g:ctrlsf_ackprg = 'rg'
let g:ctrlsf_auto_close = 1
let g:ctrlsf_confirm_save = 0
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_indent = 1
let g:ctrlsf_regex_pattern = 1

nmap     <leader>sf <Plug>CtrlSFPrompt
nmap     <silent><leader>sb <Plug>CtrlSFCCwordPath<CR>
nmap     <leader>sn <Plug>CtrlSFCwordPath
nmap     <leader>sp <Plug>CtrlSFPwordPath
nnoremap <leader>st :CtrlSFToggle<CR>
nnoremap <leader>sr :call <SID>toggle_default_root()<CR>
vmap     <leader>sf <Plug>CtrlSFVwordExec
vmap     <leader>sF <Plug>CtrlSFVwordPath

function! s:toggle_default_root()
    if g:ctrlsf_default_root == 'project'
        let g:ctrlsf_default_root = 'cwd'
        echom 'ctrlsf: change g:ctrlsf_default_root => "cwd"'
    else
        let g:ctrlsf_default_root = 'project'
        echom 'ctrlsf: change g:ctrlsf_default_root => "project"'
    endif
endfunction
