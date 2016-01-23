" variable ------------------------------------------------------------------{{{
let g:plugin_lists = {}

let b:type_plugin_list = []

if exists('g:type_plugin_list')
    let b:type_plugin_list = g:type_plugin_list
endif

" }}} --------------------------------------------------------------------------

" 加载一个vimrc脚本 ---------------------------------------------------------{{{
function! loader#core#LoadSingleVimrc(vimrc, will_check_exist)
    if a:will_check_exist == 1 && !filereadable(expand(a:vimrc))
        call vimlog#ErrorLog(a:vimrc . " is not exist")
    else
        execute "source " . a:vimrc
    endif
endfunction
" }}} --------------------------------------------------------------------------

function! s:LoadDirPlugin(dirpath)
    let l:vimrc_path_str    = globpath(a:dirpath, "*.vimrc")
    let l:vimrc_list        = split(l:vimrc_path_str)
    for vimrc in l:vimrc_list
            call loader#core#LoadSingleVimrc(vimrc, 0)
    endfor
endfunction


" 加载~/.vim/vimrcs/目录下的所有.vimrc脚本-----------------------------------{{{
function! loader#core#LoadVimrcs()
    if (exists("g:has_load_vimrcs"))
        return
    else
        let g:has_load_vimrcs = 1
    endif 

    call common#SetVariablesDefault("g:log_level", 8)

    " 若设置了环境变量VIML_LOG_LEVEL，则使用系统变量的log级别
    if $VIML_LOG_LEVEL
        let g:log_level 	= $VIML_LOG_LEVEL
    endif

    if loader#core#PluginExist('Vundle.vim')
        filetype off
        exec "set rtp+=" . g:bundle_path . "/Vundle.vim"
        call vundle#begin(g:bundle_path)

        " 先加载vundle，再加载其他插件
        call loader#core#LoadSingleVimrc(g:vimrc_path . 'Vundle.vim.vimrc', 1)

        call <SID>LoadDirPlugin(g:vimrc_path)

        for dir in b:type_plugin_list
            call <SID>LoadDirPlugin(g:vimrc_path . dir)
        endfor

        call vundle#end()
        filetype on					" 侦测文件类型	
        filetype plugin on			" 开启文件识别
        filetype indent on			" 针对不同的文件类型采用不同的缩进格式
        filetype plugin indent on	" 启动自动补全
    endif
endfunction
" }}} --------------------------------------------------------------------------

" 检查插件是否存在 ----------------------------------------------------------{{{
function! loader#core#PluginExist(plugin_name)
    if isdirectory(g:bundle_path . a:plugin_name)
        return 1
    else
        call vimlog#ErrorLog(a:plugin_name . ' not exist')
        return 0
    endif
endfunction
" }}} --------------------------------------------------------------------------

" BundlePlugin 加载插件的函数 -----------------------------------------------{{{
" plugin为插件的全名
" 比如https://github.com/tenfyzhong/jce-highlight
" 则plugin为tenfyzhong/jce-highlight
function! loader#core#BundlePlugin(plugin)
    " 每个插件只加载一次
    if !has_key(g:plugin_lists, a:plugin)
        let g:plugin_lists[a:plugin] = 1
        execute "Plugin " . "'" . a:plugin . "'"
        let l:plugin_name   = split(a:plugin, "/")[-1]
        call loader#core#PluginExist(l:plugin_name)
    endif
endfunction
" }}} --------------------------------------------------------------------------
