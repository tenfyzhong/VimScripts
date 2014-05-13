" functions

" 对未定义的变量设置默认值
function! SetVariablesDefault(name, value)
	if !exists(a:name)
		execute "let " . a:name " = " . a:value
	endif
endfunction

call SetVariablesDefault("g:warning_message", 0)
call SetVariablesDefault("g:error_message", 0)
call SetVariablesDefault("g:success_message", 0)

" 输出警告信息
function! EchoWarningMessage(msg)
	if g:warning_message 
		echohl WarningMsg | echom a:msg | echohl None
	endif
endfunction

" 输出错误信息
function! EchoErrorMessage(msg)
	if g:error_message 
		echohl ErrorMsg | echom a:msg | echohl None
	endif
endfunction

" 输出成功信息
function! EchoSuccessMessage(msg)
	if g:success_message 
		echom a:msg
	endif
endfunction

" 不输出信息的输出函数
function! EchoNullMessage(msg)
endfunction

let g:Warning_func 	= function('EchoWarningMessage')
let g:Error_func 	= function('EchoErrorMessage')
let g:Success_func 	= function('EchoSuccessMessage')
let g:Null_func 	= function('EchoNullMessage')

" 加载插件脚本
function! SourceVimrc(vimrc_name, echo_func)
	let l:vimrcs = "~/.vim/vimrcs/"
	if globpath(l:vimrcs, a:vimrc_name) != ""
		let l:vimrc_path = l:vimrcs . a:vimrc_name
		execute "source " . l:vimrc_path
	else
		let l:msg = a:vimrc_name . " no exist"
		call call(a:echo_func, [l:msg])
	endif
endfunction

" 构建插件脚本名字, 并加载
" 若脚本值为"", 加载插件名+.vimrc，不存在不警告提示
" 若脚本值为"1", 加载插件名+.vimrc，不存在警告提示
" 若脚本值为"0", 不加载脚本
" 其它则直接加载脚本值
function! CreateSourceVimrc(plugin_key, plugin_value)
	let l:vimrcs = "~/.vim/vimrcs/"
	if a:plugin_value == ""
		let l:vimrc_name = a:plugin_key . ".vimrc"
		call SourceVimrc(l:vimrc_name, g:Null_func)
	elseif a:plugin_value == "1"
		let l:vimrc_name = a:plugin_key . ".vimrc"
		call SourceVimrc(l:vimrc_name, g:Warning_func)
	elseif a:plugin_value == "0"
		" 不加载配置
	else
		call SourceVimrc(a:plugin_value, g:Warning_func)
	endif
endfunction

" 判断bundle管理的插件是否存在
function! PluginExist(plugin_name)
	let l:bundle_path 	= "~/.vim/bundle/"
	if globpath(l:bundle_path, a:plugin_name) != ""
		call EchoPluginMessage(a:plugin_name, 1)
		return 1
	else
		call EchoPluginMessage(a:plugin_name, 0)
		return 0
	endif
endfunction

" 加载所有的插件及配置
function! BundlePluginsDict(plugins)
	if PluginExist('vundle')
		for [pkey, pvalue] in items(a:plugins)
			execute "Bundle " . "'" . pkey . "'"
			let l:plugin_name = split(pkey, "/")[-1]
			if PluginExist(l:plugin_name)
				call CreateSourceVimrc(l:plugin_name, pvalue)
			endif
		endfor
	endif
endfunction

" 输出加载插件信息
" 不调用PluginExist，不会进行输出提示信息
" 要调用EchoPluginMessage输出
function! EchoPluginMessage(plugin_name, success)
	let l:msg = "load " . a:plugin_name
	if a:success
		let l:msg = l:msg . " success"
		call EchoSuccessMessage(l:msg)
	else
		let l:msg = l:msg . " fail"
		call EchoErrorMessage(l:msg)
	endif
endfunction

