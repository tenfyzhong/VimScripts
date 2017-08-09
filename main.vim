" Requirement {{{
if version < 704
    echoerr "请更新到vim 7.4以上"
    finish
endif
" }}} 

" global variable {{{
" 全局变量
if &shell =~# 'fish$'
    set shell=sh
endif

let g:log_level = vimlog#error_level()
let mapleader   = "'"
let g:MSWIN     = system#IsMswin()
let g:UNIX      = system#IsUnix()
let g:VIMHOME = expand('<sfile>:p:h') . '/'
let g:vimrc_path    = fnamemodify(g:VIMHOME . "vimrcs/", ':p')
let g:bundle_path   = fnamemodify(g:VIMHOME . "bundle/", ':p')
" }}} 

" base setting {{{
lang messages en_US.UTF-8
if !exists('g:has_load_vimrc_example_vim')
    let g:has_load_vimrc_example_vim = 1
    source $VIMRUNTIME/vimrc_example.vim
endif

set nocompatible " 关闭vi兼容模式
set cindent      " C语言缩进方式
set cinoptions+=:0 " case的括号不缩进
set cinoptions+=l1 " 大括号与case对齐
set cinoptions+=g0 " public,protected,private不缩进
set cinoptions+=N-s " c++ namespace里面的内容不缩进
set cinoptions+=(0,w1,W4 " 没结束的括号与上一行的内容对齐
set cinoptions+=j1 " 匿名类设置正确的缩进
set cinoptions+=J1 " 正常设置js的对齐声明
set foldmethod=syntax   " 缩进，这个开启后，打开大文件非常慢
set foldlevelstart=99
set fileencoding=utf-8
set fileencodings=utf-8,gbk,gb2312,cp936,usc-bom,euc-jp,gb18030
set mouse=           " 禁用鼠标
set wrapmargin=0
set textwidth=0
set colorcolumn=81
set backspace=2 " 使回格键正常处理indet,eol,start 等
set iskeyword+= " 设为字，遇到这些字符时不断行
set whichwrap+=<,>,h,l    " 允许backspace和光标键跨越行边界
set formatoptions=tcrqn " 自动格式化
" set autochdir " 自动切换工作目录为当前文件所在的目录
set autowrite " 文件跳转时自动保存
set scrolloff=2

set shortmess=atI    " 启动的时候不显示援助乌干达儿童提示
set autoread    " 文件修改后自动载入
set cmdheight=1
set hidden

set showmatch    " 括号匹配
set ruler        " 显示标尺
set noshowmode     
set confirm        " 在处理未保存或只读文件的时候，弹出确认

set hlsearch     " 高亮search命中的文本
set incsearch    " 随着键入即时搜索
" set ignorecase   " 搜索时忽略大小写
" set smartcase    " 有一个或以上大写字母时仍大小写敏感

set wildmenu     " 增加命令行自动补全操作
set history=500

" 显示相关
"set cursorcolumn        " 高亮当前列
set cursorline            " 高亮当前行
set t_Co=256 

" tab缩进4
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set smarttab

set showtabline=2   "标签栏
set laststatus=2    "永远显示状态栏

set number          " 显示行号
set relativenumber
set completeopt=menuone

exec "set backupdir=" . g:VIMHOME . ".backupfile"
exec "set undodir=" . g:VIMHOME . ".undofile"

" set splitbelow
set splitright
set diffopt=filler,vertical

set viminfo+=!

set noerrorbells
set novisualbell
set t_vb=

" set pastetoggle=<leader>p
set sessionoptions-=buffers

if !exists('g:once_init_syntax')
    let g:once_init_syntax = 1
    " 开启语法高亮
    syntax on
    syntax enable

    set background=dark
    highlight CursorLine term=underline cterm=NONE ctermbg=DarkGrey guibg=Grey90 
    highlight ColorColumn ctermbg=DarkGrey guibg=Grey90
    colorscheme solarized
    highlight Folded term=bold cterm=bold ctermfg=12 ctermbg=0 guifg=Cyan guibg=DarkGrey
endif
" }}}


" autocmd {{{
augroup initial
    autocmd!
    autocmd BufWritePost *vimrc,*.vim source % 
    autocmd InsertLeave * set nopaste
    autocmd InsertEnter * set number norelativenumber 
    autocmd InsertLeave * set number relativenumber 
    autocmd WinLeave * setl nocursorline
    autocmd WinEnter * setl cursorline
    autocmd BufReadPre,BufNewFile * set cmdheight=2
    autocmd BufWinEnter * set cmdheight=1
augroup END
" }}} 

" mswin setting {{{
if g:MSWIN
    colorscheme evening
    if filereadable("$VIMRUNTIME/_vimrc")
        source $VIMRUNTIME/_vimrc
    endif
    if filereadable("$VIMRUNTIME/../_vimrc")
        source $VIMRUNTIME/../_vimrc
    endif
endif
" }}} 

" global mapping {{{
nnoremap <leader>           <NOP>
nnoremap j                  gj
nnoremap gj                 j
nnoremap k                  gk
nnoremap gk                 k
cnoremap <c-k>              <Up>
cnoremap <c-j>              <Down>
nnoremap <silent><Space>    za
nnoremap ;                  :
xnoremap ;                  :
nnoremap ,                  ;
nnoremap <leader>w          :wa<CR>
nnoremap <silent>do         :diffget<cr>:diffupdate<cr>
nnoremap <silent>dp         :diffput<cr>:diffupdate<cr>
nnoremap <silent><leader>nn :call feature#PollNumber()<cr>
vnoremap <                  <gv
vnoremap >                  >gv
nnoremap <leader><Space>    zA
nnoremap <silent><leader>tn <Esc>:tabnew<cr>
nnoremap <silent><leader>tc <Esc>:tabclose<cr>
nnoremap <silent><leader>cf <Esc>:let @"=expand('%')<cr>
nnoremap <silent><leader>cp <Esc>:let @"=expand('%:p')<cr>
nnoremap <silent><m-,>      ,
nnoremap <leader>j          gT
nnoremap <leader>k          gt
nnoremap <silent><leader>xx :call feature#toggle_xxd()<cr>

function! s:clear_or_redraw() "{{{2
    if has('nvim') && &buftype == 'terminal'
        call feedkeys("i\<C-l>\<C-\>\<C-n>gg$", 'n')
    else
        redraw!
    endif
endfunction "}}}
nnoremap <c-p> <esc>:call <sid>clear_or_redraw()<cr>

nnoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]
nnoremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
noremap <leader>y "*y

" inoremap <silent><expr><Esc> pumvisible() ? "\<C-y>" : "\<Esc>"

" 上面加空行
nnoremap <leader>O<space> :<c-u>call feature#exec_list('normal m`', 'put! =repeat(nr2char(10), ' . v:count1 . ')', 'normal ``')<cr>
" 下面加空行
nnoremap <leader>o<space> :<c-u>call feature#exec_list('normal m`', 'put =repeat(nr2char(10), ' . v:count1 . ')', 'normal ``')<cr>

if &diff
    nnoremap <silent>[1 :diffget 1<CR> :diffupdate<CR> 
    nnoremap <silent>[2 :diffget 2<CR> :diffupdate<CR>
    nnoremap <silent>[3 :diffget 3<CR> :diffupdate<CR>
    nnoremap <silent>[4 :diffget 4<CR> :diffupdate<CR>
    nnoremap <silent>]1 :diffput 1<CR> :diffupdate<CR> 
    nnoremap <silent>]2 :diffput 2<CR> :diffupdate<CR>
    nnoremap <silent>]3 :diffput 3<CR> :diffupdate<CR>
    nnoremap <silent>]4 :diffput 4<CR> :diffupdate<CR>
endif

if has('gui_running')
    " gui下，调大调小字体
    command! Bigger  :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)+1', '')
    command! Smaller :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)-1', '')
endif

" 普通模式是块光标
" 插入模式竖线光标
" 替换模式下横线光标
if empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif

onoremap af :<c-u>normal! ggVG<CR>
" }}} 

" command {{{
" 数字的参数是加载级别，默认是5
" 数字越大，越后加载
com! -nargs=+ -bar PluginAdd call loader#BundlePlugin(<args>)
" }}} 

" local.vim {{{
let b:local_vim = g:VIMHOME . "local.vim"
if filereadable(b:local_vim)
    exec "so " . b:local_vim
endif
" }}}

" {{{ source dir vimrc
function! s:SourceDirVimrc(name) 
    let l:dir_vimrc_path = file#FindFile(getcwd(), a:name)
    if l:dir_vimrc_path != '' && 
                \ l:dir_vimrc_path != fnamemodify(resolve($HOME), ':p')
        let l:dir_vimrc = l:dir_vimrc_path . a:name
        exec 'source ' . l:dir_vimrc
    endif
endfunction 

if g:MSWIN
    call <SID>SourceDirVimrc('_vimrc')
else
    call <SID>SourceDirVimrc('.vimrc')
endif

source ~/.vim/abbreviations.vim
" }}}

" source plugin {{{
" 加载插件
" 建议：插件的配置最好以插件名加.vimrc命名
" 如a.vim的配置为a.vim.vimrc，放在vimrcs目录下
" 加载vimrcs目录下的所有脚本
call loader#LoadVimrcs()
" }}} 

