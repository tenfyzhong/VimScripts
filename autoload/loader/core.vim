" variable ------------------------------------------------------------------{{{
let g:plugin_lists = {}
let b:vimrc_path    = expand("~/.vim/vimrcs/")
let b:bundle_path 	= expand("~/.vim/bundle/")
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


" 加载~/.vim/vimrcs/目录下的所有.vimrc脚本-----------------------------------{{{
function! loader#core#LoadVimrcs()

    call common#SetVariablesDefault("g:log_level", 8)

    " 若设置了环境变量VIML_LOG_LEVEL，则使用系统变量的log级别
    if $VIML_LOG_LEVEL
        let g:log_level 	= $VIML_LOG_LEVEL
    endif

    if loader#core#PluginExist('Vundle.vim')
        filetype off
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()

        " 先加载vundle，再加载其他插件
        call loader#core#LoadSingleVimrc(b:vimrc_path . 'Vundle.vim.vimrc', 1)

        let l:vimrc_path_str    = globpath(b:vimrc_path, "*.vimrc")
        let l:vimrc_list        = split(l:vimrc_path_str)
        for vimrc in l:vimrc_list
            call loader#core#LoadSingleVimrc(vimrc, 0)
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
    if isdirectory(b:bundle_path . a:plugin_name)
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
