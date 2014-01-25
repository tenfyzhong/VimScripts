"**********************************************************************
" 函数
" 多次source此文件时，将之前定义的函数删除
if exists("FUNCTION_VIMRC_load")
	delfunction g:echo_plugin_message
	delfunction g:bundle_all_plugin
	delfunction g:plugin_exist
	delfunction g:load_plugin_vimrc
	delfunction g:echo_success_message
	delfunction g:echo_error_message
	delfunction g:echo_warning_message
	delfunction g:set_variables_default
endif


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

" 加载插件脚本
function! g:load_plugin_vimrc(filename)
	let l:vimrcs = "~/.vim/vimrcs/"

	if globpath(l:vimrcs, a:filename) != ""
		let l:filepathname = l:vimrcs . a:filename
		execute "source " . l:filepathname
	else
"		echohl WarningMsg | echom a:filename . " no exist" | echohl None
		let l:msg = a:filename . " no exist"
		call g:echo_warning_message(l:msg)
	endif
endfunction

" 判断bundle管理的插件是否存在
function! g:plugin_exist(plugin_name)
	let l:bundle_path 	= "~/.vim/bundle/"
	let l:msg 			= "load " . a:plugin_name
	if globpath(l:bundle_path, a:plugin_name) != ""
		let l:msg = l:msg . " success"
		call g:echo_plugin_message(a:plugin_name, 1)
		return 1
	else
		let l:msg = l:msg . " fail"
		call g:echo_plugin_message(a:plugin_name, 0)
		return 0
	endif
endfunction

function! g:bundle_all_plugin(plugins)
	if g:plugin_exist('vundle')
		for p in a:plugins

			execute "Bundle " . "'" . p . "'"
			
			let l:plugin_name = split(p, "/")[-1]
			let l:vimrc_name = l:plugin_name . ".vimrc"
			if g:plugin_exist(l:plugin_name)
				call g:load_plugin_vimrc(l:vimrc_name)	
			endif
		endfor
	endif
endfunction

" 输出加载插件信息
" 不调用g:plugin_exist，不会进行输出控制信息
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

let FUNCTION_VIMRC_load = 1
"**********************************************************************
