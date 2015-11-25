" 对未定义的变量设置默认值 --------------------------------------------------{{{
function! common#SetVariablesDefault(name, value)
	if !exists(a:name)
		execute "let " . a:name " = " . a:value
	endif
endfunction
" }}} --------------------------------------------------------------------------

