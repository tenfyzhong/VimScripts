"==============================================================
"    file: YouCompleteMe.vimrc
"   brief: 
" 
" command: YcmRestartServer 重启ycmd
"          YcmForceCompileAndDiagnostics 强制编译
"          YcmDiags 列出错误
"          YcmShowDetailedDiagnostic 诊断信息
"          YcmDebugInfo debug信息
"          YcmCompleter 调用编译器的命令
"          YcmCompleter GoToDeclaration 跳到声明
"          YcmCompleter GoToDefinithion 跳到定义
"          YcmCompleter GoTo 跳到定义，如果没有定义，则跳到声明
"          YcmCompleter GoToImprecise 类似于GoTo，但是不进行重新编译
"          YcmCompleter ClearCompilationFlagCache 清掉ycm_extra_conf.py中的flag
"          YcmCompleter StartServer 启动server,仅在cs中支持
"          YcmCompleter StopServer 停止server,仅在cs中支持
"          YcmCompleter RestartServer 重启server,仅在cs中支持
"          YcmCompleter ReloadSolution 重新加载,仅在cs中支持
"          YcmCompleter GoToImplementation 跳到实现,仅在cs中支持
"          YcmCompleter GoToImplementationElseDeclaration 跳到实现,否则跳到声明,仅在cs中支持
"
"    nmap: <leader>jd YcmCompleter GoToImpreciset 
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-16 17:02:00
"==============================================================
if g:MSWIN
    let g:use_supertab = 1
    call loader#core#LoadSingleVimrc(g:vimrc_path . '/supertab.vimrc', 1)
    finish
endif

if !executable('clang')
    let g:use_supertab = 1
    finish
endif

let b:youcomplete_path = expand(g:bundle_path . "/YouCompleteMe/")
" 如果ycm的project目录已经存在，则去判断ycm是否可用
" 如果ycm不可用，则去加载supertab
if isdirectory(b:youcomplete_path)
    if !has('python')
        call vimlog#InfoLog('has no python, will load supertab')
        let g:use_supertab = 1
        call loader#core#LoadSingleVimrc(g:vimrc_path . '/supertab.vimrc', 1)
        finish
    endif

    let b:youcompleteme_lib_path = b:youcomplete_path . "third_party/ycmd/"
    if !(filereadable(b:youcompleteme_lib_path . "ycm_core.so")
                \|| filereadable(b:youcompleteme_lib_path . "ycm_core.dll"))
        call vimlog#InfoLog("has no compile YCM, will load supertab")
        let g:use_supertab = 1
        call loader#core#LoadSingleVimrc('~/.vim/vimrcs/supertab.vimrc', 1)
        finish
    endif
endif

" 如果ycm的project目录不存在，直接PluginAdd ycm，以便git clone ycm
" 如果ycm的project目录存在，且ycm可用，也PluginAdd ycm，以便加载ycm
PluginAdd 'Valloric/YouCompleteMe', {'pinned': 1}

let g:ycm_min_num_of_chars_for_completion 			= 2
let g:ycm_add_preview_to_completeopt 				= 0
let g:ycm_autoclose_preview_window_after_insertion 	= 1
let g:ycm_error_symbol                              = 'EE'
let g:ycm_warning_symbol                            = 'WW'
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_key_detailed_diagnostics                  = '<leader>d'
let g:ycm_confirm_extra_conf                        = 0
let g:ycm_key_list_select_completion                = ['<C-n>', '<Down>'] 
let g:ycm_key_list_previous_completion              = ['<C-p>', '<Up>'] 
let g:ycm_server_log_level                          = 'error'

nnoremap <leader>jd :YcmCompleter GoTo<CR>

