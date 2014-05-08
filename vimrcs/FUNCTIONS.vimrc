" functions

" 对未定义的变量设置默认值
function! g:set_variables_default(name, value)
	if !exists(a:name)
		execute "let " . a:name " = " . a:value
	endif
endfunction

call g:set_variables_default("g:warning_message", 0)
call g:set_variables_default("g:error_message", 0)
call g:set_variables_default("g:success_message", 0)

" 输出警告信息
function! g:echo_warning_message(msg)
	if g:warning_message 
		echohl WarningMsg | echom a:msg | echohl None
	endif
endfunction

" 输出错误信息
function! g:echo_error_message(msg)
	if g:error_message 
		echohl ErrorMsg | echom a:msg | echohl None
	endif
endfunction

" 输出成功信息
function! g:echo_success_message(msg)
	if g:success_message 
		echom a:msg
	endif
endfunction

" 不输出信息的输出函数
function! g:echo_null_message(msg)
endfunction

let g:Warning_func 	= function('g:echo_warning_message')
let g:Error_func 	= function('g:echo_error_message')
let g:Success_func 	= function('g:echo_success_message')
let g:Null_func 	= function('g:echo_null_message')

" 加载插件脚本
function! g:source_vimrc(vimrc_name, echo_func)
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
function! s:create_source_vimrc(plugin_key, plugin_value)
	let l:vimrcs = "~/.vim/vimrcs/"
	if a:plugin_value == ""
		let l:vimrc_name = a:plugin_key . ".vimrc"
		call g:source_vimrc(l:vimrc_name, g:Null_func)
	elseif a:plugin_value == "1"
		let l:vimrc_name = a:plugin_key . ".vimrc"
		call g:source_vimrc(l:vimrc_name, g:Warning_func)
	elseif a:plugin_value == "0"
		" 不加载配置
	else
		call g:source_vimrc(a:plugin_value, g:Warning_func)
	endif
endfunction

" 判断bundle管理的插件是否存在
function! g:plugin_exist(plugin_name)
	let l:bundle_path 	= "~/.vim/bundle/"
	if globpath(l:bundle_path, a:plugin_name) != ""
		call g:echo_plugin_message(a:plugin_name, 1)
		return 1
	else
		call g:echo_plugin_message(a:plugin_name, 0)
		return 0
	endif
endfunction

" 加载所有的插件及配置
function! g:bundle_plugins_dict(plugins)
	if g:plugin_exist('vundle')
		for [pkey, pvalue] in items(a:plugins)
			execute "Bundle " . "'" . pkey . "'"
			let l:plugin_name = split(pkey, "/")[-1]
			if g:plugin_exist(l:plugin_name)
				call s:create_source_vimrc(l:plugin_name, pvalue)
			endif
		endfor
	endif
endfunction

" 输出加载插件信息
" 不调用g:plugin_exist，不会进行输出提示信息
" 要调用g:echo_plugin_message输出
function! g:echo_plugin_message(plugin_name, success)
	let l:msg = "load " . a:plugin_name
	if a:success
		let l:msg = l:msg . " success"
		call g:echo_success_message(l:msg)
	else
		let l:msg = l:msg . " fail"
		call g:echo_error_message(l:msg)
	endif
endfunction

