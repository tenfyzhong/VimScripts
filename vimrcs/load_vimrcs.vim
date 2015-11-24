" load_vimrc

" variable ------------------------------------------------------------------{{{
let g:plugin_lists = {}
let b:vimrc_path    = expand("~/.vim/vimrcs/")
let b:bundle_path 	= expand("~/.vim/bundle/")
" }}} --------------------------------------------------------------------------

" 对未定义的变量设置默认值 --------------------------------------------------{{{
function! s:SetVariablesDefault(name, value)
	if !exists(a:name)
		execute "let " . a:name " = " . a:value
	endif
endfunction
" }}} --------------------------------------------------------------------------


" 加载一个vimrc脚本 ---------------------------------------------------------{{{
function! LoadSingleVimrc(vimrc, will_check_exist)
    if a:will_check_exist == 1 && !filereadable(expand(a:vimrc))
        call vimlog#ErrorLog(a:vimrc . " is not exist")
    else
        execute "source " . a:vimrc
    endif
endfunction
" }}} --------------------------------------------------------------------------


" 加载~/.vim/vimrcs/目录下的所有.vimrc脚本-----------------------------------{{{
function! s:LoadVimrcs()
    if <SID>PluginExist('Vundle.vim')
        filetype off
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()

        " 先加载vundle，再加载其他插件
        call LoadSingleVimrc(b:vimrc_path . 'vundle.vim', 1)

        let l:vimrc_path_str    = globpath(b:vimrc_path, "*.vimrc")
        let l:vimrc_list        = split(l:vimrc_path_str)
        for vimrc in l:vimrc_list
            call LoadSingleVimrc(vimrc, 0)
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
function! s:PluginExist(plugin_name)
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
function! s:BundlePlugin(plugin)
    " 每个插件只加载一次
    if !has_key(g:plugin_lists, a:plugin)
        let g:plugin_lists[a:plugin] = 1
        execute "Plugin " . "'" . a:plugin . "'"
        let l:plugin_name   = split(a:plugin, "/")[-1]
        call <SID>PluginExist(l:plugin_name)
    endif
endfunction
" }}} --------------------------------------------------------------------------

" command -------------------------------------------------------------------{{{
com! -nargs=1 PluginAdd call <SID>BundlePlugin(<args>)
" }}} --------------------------------------------------------------------------

" call function -------------------------------------------------------------{{{
call <SID>SetVariablesDefault("g:log_level", 8)

" 若设置了环境变量VIML_LOG_LEVEL，则不进行任何警告
if $VIML_LOG_LEVEL
	let g:log_level 	= $VIML_LOG_LEVEL
endif

" 加载插件
" 建议：插件的配置最好以插件名加.vimrc命名
" 如a.vim的配置为a.vim.vimrc，放在vimrcs目录下
" 加载vimrcs目录下的所有脚本
call <SID>LoadVimrcs()
" }}} --------------------------------------------------------------------------

