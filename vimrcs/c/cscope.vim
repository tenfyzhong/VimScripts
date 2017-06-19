"==============================================================
"    file: cscope.vimrc
"   brief: 
"
" command: cs help 帮助
"          cs kill 断开链接
"          cs reset 重新链接
"          cs show 显示链接
"          cs find {querytype} {name}
"             querytype可以是下面的选项
"		0 or s: Find this C symbol
"		1 or g: Find this definition
"		2 or d: Find functions called by this function
"		3 or c: Find functions calling this function
"		4 or t: Find this text string
"		6 or e: Find this egrep pattern
"		7 or f: Find this file
"		8 or i: Find files #including this file
"
"    nmap: <prefix> <c-\> cs find
"                   <c-_>s csc find
"                   <a-_>v vert scs find
"
"         <c-]> 跳到定义
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-16 17:45:57
"==============================================================
if !has("cscope")
    finish
endif

set cscopetag " 使支持用Ctrl+]和Ctrl+t 快捷键在代码间跳来跳去
set csto=1
set cst

let g:cscope_timer = 0

function! s:ConnectCscope() " {{{ 查找cscope.out并连接
	set nocsverb
    cs kill -1
    let p = file#FindFile(getcwd(), 'cscope.out')
    if p != ''
        execute "cs add " . p . "/cscope.out " . p

        if version >= 800 || has('nvim')
            " 定时更新
            if g:cscope_timer == 0
                let g:cscope_timer = timer_start(600000, 'file#ResetCscope', {'repeat': -1})
            endif
        endif
    endif
	set csverb
endfunction
" }}}


augroup CSCOPE_VIMRC
    au!
    " autocmd FileType c,cpp,java call <SID>ConnectCscope()
    autocmd VimEnter * call <SID>ConnectCscope()
augroup END

if exists("g:cscope_init")
    finish
endif

nnoremap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nnoremap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

nnoremap <C-_>ss :scs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-_>sg :scs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-_>sc :scs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-_>st :scs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-_>se :scs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-_>sf :scs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <C-_>si :scs find i <C-R>=expand("<cfile>")<CR><CR>
nnoremap <C-_>sd :scs find d <C-R>=expand("<cword>")<CR><CR>

nnoremap <C-_>vs :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-_>vg :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-_>vc :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-_>vt :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-_>ve :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-_>vf :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <C-_>vi :vert scs find i <C-R>=expand("<cfile>")<CR><CR>
nnoremap <C-_>vd :vert scs find d <C-R>=expand("<cword>")<CR><CR>

