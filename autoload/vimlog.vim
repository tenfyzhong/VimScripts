" vimlog#trace_level --------------------------------------------------------{{{
function! vimlog#trace_level()
    return 1
endfunction
" }}} --------------------------------------------------------------------------

" vimlog#debug_level --------------------------------------------------------{{{
function! vimlog#debug_level()
    return 2
endfunction
" }}} --------------------------------------------------------------------------

" vimlog#info_level --_------------------------------------------------------{{{
function! vimlog#info_level()
    return 4
endfunction
" }}} --------------------------------------------------------------------------

" vimlog#error_level --------------------------------------------------------{{{
function! vimlog#error_level()
    return 8
endfunction
" }}} --------------------------------------------------------------------------

" vimlog#system_level -------------------------------------------------------{{{
function! vimlog#system_level()
    return 16
endfunction
" }}} --------------------------------------------------------------------------

" vimlog#log ----------------------------------------------------------------{{{
function! vimlog#Log(msg)
    if $NOVIMWARNING
        return
    endif
    echohl ErrorMsg | echom a:msg | echohl None
endfunction
" }}} --------------------------------------------------------------------------

" vimlog#TraceLog -----------------------------------------------------------{{{
function! vimlog#TraceLog(msg)
    if g:log_level <= vimlog#trace_level()
        call vimlog#Log(a:msg)
    endif
endfunction
" }}} --------------------------------------------------------------------------

" vimlog#DebugLog -----------------------------------------------------------{{{
function! vimlog#DebugLog(msg)
    if g:log_level <= vimlog#debug_level()
        call vimlog#Log(a:msg)
    endif
endfunction
" }}} --------------------------------------------------------------------------

" vimlog#InfoLog ------------------------------------------------------------{{{
function! vimlog#InfoLog(msg)
    if g:log_level <= vimlog#info_level()
        call vimlog#Log(a:msg)
    endif
endfunction
" }}} --------------------------------------------------------------------------

" vimlog#ErrorLog -----------------------------------------------------------{{{
function! vimlog#ErrorLog(msg)
	if g:log_level <= vimlog#error_level()
        call vimlog#Log(a:msg)
	endif
endfunction
" }}} --------------------------------------------------------------------------

" vimlog#SystemLog ----------------------------------------------------------{{{
function! vimlog#SystemLog(msg)
    if g:log_level <= vimlog#system_level()
        call vimlog#Log(a:msg)
    endif
endfunction
" }}} --------------------------------------------------------------------------

