" load_vimrc

let g:plugin_lists = {}
let b:vimrc_path    = expand("~/.vim/vimrcs/")
let b:bundle_path 	= expand("~/.vim/bundle/")

" 对未定义的变量设置默认值
function! SetVariablesDefault(name, value)
	if !exists(a:name)
		execute "let " . a:name " = " . a:value
	endif
endfunction


" 加载一个vimrc脚本 
function! LoadSingleVimrc(vimrc, will_check_exist)
    if a:will_check_exist == 1 && !filereadable(expand(a:vimrc))
        call ErrorLog(a:vimrc . " is not exist")
    else
        execute "source " . a:vimrc
    endif
endfunction


" 加载~/.vim/vimrcs/目录下的所有.vimrc脚本
function! LoadVimrcs()
    if PluginExist('vundle')
        " 先加载vundle，再加载其他插件
        call LoadSingleVimrc(b:vimrc_path . 'vundle.vim', 1)
        let l:vimrc_path_str    = globpath(b:vimrc_path, "*.vimrc")
        let l:vimrc_list        = split(l:vimrc_path_str)
        for vimrc in l:vimrc_list
            call LoadSingleVimrc(vimrc, 0)
        endfor
    endif
endfunction

function! PluginExist(plugin_name)
    if isdirectory(b:bundle_path . a:plugin_name)
        return 1
    else
        call ErrorLog(a:plugin_name . ' not exist')
        return 0
    endif
endfunction

function! LOG_TRACE()
    return 1
endfunction

function! LOG_DEBUG()
    return 2
endfunction

function! LOG_INFO()
    return 4
endfunction

function! LOG_ERROR()
    return 8
endfunction

function! LOG_SYSTEM()
    return 16
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

function! InfoLog(msg)
    if g:log_level <= LOG_INFO()
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
    " 每个插件只加载一次
    if !has_key(g:plugin_lists, a:plugin)
        let g:plugin_lists[a:plugin] = 1
        execute "Bundle " . "'" . a:plugin . "'"
        let l:plugin_name   = split(a:plugin, "/")[-1]
        call PluginExist(l:plugin_name)
    endif
endfunction

" 从path目录开始向上查找filename，找到则返回对应的path
function! FindFile(path, filename)
    if a:path == '/'
        if filereadable (a:path . '/' . a:filename)
            return '/'
        else
            return ''
        endif
    endif

    if filereadable (a:path . '/' . a:filename)
        return a:path 
    else
        let id = strridx(a:path, '/')
        if id > 0 && a:path[id] == '/'
            let id = id - 1
        endif
        return FindFile(a:path[0:id], a:filename)
    endif
endfunction

com! -nargs=1 PluginAdd call BundlePlugin(<args>)

call SetVariablesDefault("g:log_level", 8)

" 若设置了环境变量VIML_LOG_LEVEL，则不进行任何警告
if $VIML_LOG_LEVEL
	let g:log_level 	= $VIML_LOG_LEVEL
endif

" 加载插件
" 建议：插件的配置最好以插件名加.vimrc命名
" 如a.vim的配置为a.vim.vimrc，放在vimrcs目录下
" 加载vimrcs目录下的所有脚本
call LoadVimrcs()

