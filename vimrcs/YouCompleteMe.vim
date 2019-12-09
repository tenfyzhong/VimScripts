"==============================================================
"    file: YouCompleteMe.vim
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
"          YcmGenerateConfig 生成.ycm_extra_conf.py的配置
"
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-16 17:02:00
"==============================================================
PluginAdd 'ycm-core/YouCompleteMe', {'frozen': 1, 'do': 'git submodule update --init --recursive && ./install.py --all'}
PluginAdd 'rdnetto/YCM-Generator', { 'branch': 'stable', 'for': ['c', 'cpp'] }

augroup load_ycm_local
    autocmd!
    autocmd BufWritePre *.go silent YcmCompleter Format 
augroup END

let g:ycm_disable_signature_help                    = 1
let g:ycm_min_num_of_chars_for_completion 			= 1
let g:ycm_add_preview_to_completeopt 				= 0
let g:ycm_autoclose_preview_window_after_insertion 	= 1
let g:ycm_error_symbol                              = '>>'
let g:ycm_warning_symbol                            = '--'
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_key_detailed_diagnostics                  = '<leader>dd'
let g:ycm_confirm_extra_conf                        = 0
let g:ycm_key_list_select_completion                = ['<C-n>', '<Down>'] 
let g:ycm_key_list_previous_completion              = ['<C-p>', '<Up>'] 
let g:ycm_server_log_level                          = 'error'
let g:ycm_python_binary_path                        = 'python'

let g:ycm_semantic_triggers =  {
      \   'vim':        ['re![a-zA-Z_1-9]{2,}', ':', '#', '<SID>', '<Plug>'],
      \   'c':          ['re![a-zA-Z_1-9]{2,}', '->', '.'],
      \   'objc':       ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s', 're!\[.*\]\s'],
      \   'ocaml':      ['re![a-zA-Z_1-9]', '.', '#'],
      \   'cpp,objcpp': ['re![a-zA-Z_1-9]{2,}', '->', '.', '::'],
      \   'perl':       ['re![a-zA-Z_1-9]{2,}', '->'],
      \   'php':        ['re![a-zA-Z_1-9]{2,}', '->', '::'],
      \   'cs':         ['re![a-zA-Z_1-9]{2,}', '.'],
      \   'java':       ['re![a-zA-Z_1-9]{2,}', '.'],
      \   'javascript': ['re![a-zA-Z_1-9]{2,}', '.'],
      \   'typescript': ['re![a-zA-Z_1-9]{2,}', '.'],
      \   'd':          ['re![a-zA-Z_1-9]{2,}', '.'],
      \   'python':     ['re![a-zA-Z_1-9]{2,}', '.'],
      \   'perl6':      ['re![a-zA-Z_1-9]{2,}', '.'],
      \   'scala':      ['re![a-zA-Z_1-9]{2,}', '.'],
      \   'vb':         ['re![a-zA-Z_1-9]{2,}', '.'],
      \   'elixir':     ['re![a-zA-Z_1-9]{2,}', '.'],
      \   'go':         ['re![a-zA-Z_1-9]{2,}', '.'],
      \   'ruby':       ['re![a-zA-Z_1-9]{2,}', '.', '::'],
      \   'lua':        ['re![a-zA-Z_1-9]{2,}', '.', ':'],
      \   'erlang':     ['re![a-zA-Z_1-9]{2,}', ':'],
      \ }
let g:ycm_show_diagnostics_ui = 0
