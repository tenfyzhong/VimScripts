" load_vimrc

let g:plugin_lists = {}
let b:vimrc_path    = "~/.vim/vimrcs/"
let b:bundle_path 	= "~/.vim/bundle/"

" 对未定义的变量设置默认值
function! SetVariablesDefault(name, value)
	if !exists(a:name)
		execute "let " . a:name " = " . a:value
	endif
endfunction


" 加载一个vimrc脚本 
function! LoadSingleVimrc(vimrc, will_check_exist)
    if a:will_check_exist == 1
        if !filereadable(expand(a:vimrc))
            call ErrorLog(a:vimrc . " is not exist")
            return
        endif
    endif
    execute "source " . a:vimrc
endfunction


" 加载~/.vim/vimrcs/目录下的所有.vimrc脚本
function! LoadVimrcs()
    " 先加载vundle，再加载其他插件
    call LoadSingleVimrc(b:vimrc_path . 'vundle.vim', 1)
    if PluginExist('vundle')
        let l:vimrc_path_str    = globpath(b:vimrc_path, "*.vimrc")
        let l:vimrc_list        = split(l:vimrc_path_str)
        for vimrc in l:vimrc_list
            call LoadSingleVimrc(vimrc, 0)
        endfor
    endif
endfunction

function! PluginExist(plugin_name)
    return globpath(b:bundle_path, a:plugin_name) != "" 
endfunction

function! LOG_TRACE()
    return 1
endfunction

function! LOG_DEBUG()
    return 2
endfunction

function! LOG_ERROR()
    return 4
endfunction

function! LOG_SYSTEM()
    return 8
endfunction

function! Log(msg)
    echohl ErrorMsg | echom a:msg | echohl None
endfunction

function! TraceLog(msg)
    if g:log_level <= LOG_TRACE()
        call Log(a:msg)
    endif
endfunction

function! DebugLog(msg)
    if g:log_level <= LOG_DEBUG()
        call Log(a:msg)
    endif
endfunction

function! ErrorLog(msg)
	if g:log_level <= LOG_ERROR()
        call Log(a:msg)
	endif
endfunction

" 系统错误log
function! SystemLog(msg)
    if g:log_level <= LOG_SYSTEM()
        call Log(a:msg)
    endif
endfunction


" plugin为插件的全名
" 比如https://github.com/tenfyzhong/jce-highlight
" 则plugin为tenfyzhong/jce-highlight
function! BundlePlugin(plugin)
    if has_key(g:plugin_lists, a:plugin)
        return 1
    endif
    
    let g:plugin_lists[a:plugin] = 1
	execute "Bundle " . "'" . a:plugin . "'"
	let l:plugin_name   = split(a:plugin, "/")[-1]
    if PluginExist(l:plugin_name) == 0
        call ErrorLog(l:plugin_name . ' not exist')
        return 0
    else
        return 1
    endif
endfunction

com! -nargs=1 PluginAdd if BundlePlugin(<args>) == 0 | finish | endif

call SetVariablesDefault("g:log_level", 4)

" 若设置了环境变量VIML_LOG_LEVEL，则不进行任何警告
if $VIML_LOG_LEVEL
	let g:log_level 	= $VIML_LOG_LEVEL
endif

" 加载插件
" 注意：插件的配置必须以插件名加.vimrc命名
" 如a.vim的配置为a.vim.vimrc，放在vimrcs目录下


"  加载vimrcs目录下的所有脚本
call LoadVimrcs()

