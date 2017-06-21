" variable ------------------------------------------------------------------{{{
let s:plugin_lists = {}

" 先插入空目录名为当前目录
let b:type_plugin_list = [""]

let s:has_source_vimrc = {}

if !exists('g:type_plugin_list')
    let g:type_plugin_list = ['**']
endif

let b:type_plugin_list += g:type_plugin_list

" }}} --------------------------------------------------------------------------

let s:plugins = [{}, {}, {}, {}, {}, {}, {}, {}, {}, {}]

function! s:load_plugins() "{{{ 调用插件管理命令进行加载
    let level = 0
    for level_item in s:plugins
        for [k, v] in items(level_item)
            exec v
            call loader#PluginExist(k)
        endfor
        let level += 1
    endfor
endfunction "}}}

" 加载一个vimrc脚本 ---------------------------------------------------------{{{
function! loader#LoadSingleVimrc(vimrc, will_check_exist)
    let l:expand_vimrc = escape(expand(a:vimrc), ' ')
    if a:will_check_exist == 1 && !filereadable(l:expand_vimrc)
        call vimlog#ErrorLog(l:expand_vimrc . " is not exist")
    else
        if !has_key(s:has_source_vimrc, l:expand_vimrc)
            execute "source " . l:expand_vimrc
            let s:has_source_vimrc[l:expand_vimrc] = 1
        endif
    endif
endfunction
" }}} --------------------------------------------------------------------------

function! s:LoadDirPlugin(dirpath) "{{{
    let l:vimrc_path_str    = globpath(a:dirpath, "*.vimrc")
    let l:vim_path_str      = globpath(a:dirpath, "*.vim")
    let l:vimrc_list        = split(l:vimrc_path_str, '\n')
    let l:vim_list          = split(l:vim_path_str, '\n')
    let l:vimrc_list        = l:vimrc_list + l:vim_list
    for vimrc in l:vimrc_list
        call loader#LoadSingleVimrc(vimrc, 0)
    endfor
endfunction "}}}


" 加载~/.vim/vimrcs/目录下的所有.vimrc脚本-----------------------------------{{{
function! loader#LoadVimrcs()
    if exists("g:has_load_vimrcs")
        return
    endif 
    let g:has_load_vimrcs = 1

    call common#SetVariablesDefault("g:log_level", 8)

    " 若设置了环境变量VIML_LOG_LEVEL，则使用系统变量的log级别
    if $VIML_LOG_LEVEL
        let g:log_level 	= $VIML_LOG_LEVEL
    endif

    call plug#begin(g:bundle_path)

    for dir in b:type_plugin_list
        call <SID>LoadDirPlugin(g:vimrc_path . dir)
    endfor

    call <SID>load_plugins()

    call plug#end()
    filetype on					" 侦测文件类型	
    filetype plugin on			" 开启文件识别
    filetype indent on			" 针对不同的文件类型采用不同的缩进格式
    filetype plugin indent on	" 启动自动补全
endfunction
" }}} --------------------------------------------------------------------------

" 检查插件是否存在 ----------------------------------------------------------{{{
function! loader#PluginExist(plugin)
    let plugin_name = split(a:plugin, "/")[-1]
    if isdirectory(g:bundle_path . plugin_name)
        return 1
    else
        call vimlog#ErrorLog(plugin_name . ' not exist')
        return 0
    endif
endfunction
" }}} --------------------------------------------------------------------------

" BundlePlugin 加载插件的函数 -----------------------------------------------{{{
" plugin为插件的全名
" 比如https://github.com/tenfyzhong/jce-highlight
" 则plugin为tenfyzhong/jce-highlight
function! loader#BundlePlugin(plugin, ...)
    let loaded = get(s:plugin_lists, a:plugin, 0) 
    if loaded
        return
    endif
    let s:plugin_lists[a:plugin] = 1

    " 每个插件只加载一次
    let plug_args = {}
    let level = 5
    if a:0 == 1 && type(a:1) == 0
        let level = a:1
    elseif a:0 == 1 && type(a:1) == 4
        let plug_args = a:1
    elseif a:0 == 2 
        let level = a:2
        let plug_args = a:1
    endif

    let level = level % 10

    let cmd = printf("Plug '%s', %s", a:plugin, string(plug_args))
    let s:plugins[level][a:plugin] = cmd

endfunction
" }}} --------------------------------------------------------------------------
