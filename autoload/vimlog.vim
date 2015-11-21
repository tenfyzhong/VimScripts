function! vimlog#trace_level()
    return 1
endfunction

function! vimlog#debug_level()
    return 2
endfunction

function! vimlog#info_level()
    return 4
endfunction

function! vimlog#error_level()
    return 8
endfunction

function! vimlog#system_level()
    return 16
endfunction

" log function --------------------------------------------------------------{{{
function! vimlog#Log(msg)
    echohl ErrorMsg | echom a:msg | echohl None
endfunction

function! vimlog#TraceLog(msg)
    if g:log_level <= vimlog#trace_level()
        call vimlog#Log(a:msg)
    endif
endfunction

function! vimlog#DebugLog(msg)
    if g:log_level <= vimlog#debug_level()
        call vimlog#Log(a:msg)
    endif
endfunction

function! vimlog#InfoLog(msg)
    if g:log_level <= vimlog#info_level()
        call vimlog#Log(a:msg)
    endif
endfunction

function! vimlog#ErrorLog(msg)
	if g:log_level <= vimlog#error_level()
        call vimlog#Log(a:msg)
	endif
endfunction

" 系统错误log
function! vimlog#SystemLog(msg)
    if g:log_level <= vimlog#system_level()
        call vimlog#Log(a:msg)
    endif
endfunction
" }}} --------------------------------------------------------------------------

