" load_vimrc

" 若设置了环境变量NOVIMWARNING，则不进行任何警告
if $NOVIMWARNING
	let g:warning_message 	= 0
	let g:error_message 	= 0
	let g:success_message 	= 0
endif

" 加载插件
" 注意：插件的配置必须以插件名加.vimrc命名
" 如a.vim的配置为a.vim.vimrc，放在vimrcs目录下

" 第0步 载入全局函数
source ~/.vim/vimrcs/FUNCTIONS.vimrc

" 第1步 加载vundle
call SourceVimrc('vundle.vimrc', g:Warning_func)

" 第2步 加载其他插件
" 'plugin_name':'vimrc_name'
" vimrc_name : '' 加载plugin_name.vimrc, 不存在不警告
" 			 : '1' 加载plugin_name.vimrc, 不存在警告
" 			 : '0' 不加载
" 			 " 'vimrc' 加载vimrc
let s:bundle_dict = {
			\ 'Rip-Rip/clang_complete': '1',
			\ 'winmanager': '1',
			\ 'a.vim': '1',
			\ 'c.vim': '1',
			\ 'scrooloose/nerdtree': '1',
			\ 'fholgado/minibufexpl.vim': '1',
			\ 'vim-scripts/grep.vim': '1',
			\ 'ervandew/supertab': '1',
			\ 'kien/ctrlp.vim': '1',
			\ 'tpope/vim-fugitive': '0',
			\ 'magic-dot-files/TagHighlight': '0',
			\ 'vim-scripts/DoxygenToolkit.vim': '1',
			\ 'vim-jp/cpp-vim': '0',
			\ 'Raimondi/delimitMate': '0',
			\ 'tpope/vim-surround': '0',
			\ 'gregsexton/gitv': '0',
			\ 'tpope/vim-commentary': '0',
			\ 'Yggdroot/indentLine': '1',
			\ 'Shougo/unite.vim': '1',
			\ 'terryma/vim-multiple-cursors': '0',
			\ 'kshenoy/vim-signature': '0',
			\ 'Rykka/colorv.vim': '0',
			\ 'sjl/gundo.vim': '1',
			\ 'leshill/vim-json': '0',
			\ 'SirVer/ultisnips': '0',
			\ 'othree/xml.vim': '1',
			\ 'itchyny/calendar.vim': '1',
			\ 'vimwiki/vimwiki': '0',
			\ 'vim-scripts/VimRepress': '0',
			\ 'vim-scripts/VOoM': '0',
			\ 'vim-scripts/CmdlineComplete': '0',
			\ 'DataWraith/auto_mkdir': '0',
			\ 'vim-scripts/php.vim--Garvin': '1',
			\ 'vim-scripts/slimv.vim': '1',
			\ 'klen/python-mode': '1',
            \ 'Shougo/vimshell.vim': '1',
            \ 'Shougo/vimproc.vim': '0',
            \ 'vim-scripts/bash-support.vim': '',
            \ 'vim-scripts/Conque-GDB': '',
            \ 'tenghui0425/jce-highlight': '1',
            \ 'juneedahamed/svnj.vim': '1',
            \ 'vim-scripts/sessionman.vim': '0',
            \ 'xkdcc/Session-Viminfo-Management': '',
			\}
"			\ 'FindMate': '1',
"			\ 'honza/vim-snippets' : ''
"			\ 'airblade/vim-gitgutter': '',
"			\ 'Lokaltog/powerline': '',
"			\ 'ywvim.vimrc': '',
"			\ 'neocomplcache.vim.vimrc': '',
"			\ 'YouCompleteMe.vimrc': '',
"			\ 'syntastic.vimrc': '',

if version >= 701
	let s:bundle_dict['majutsushi/tagbar'] = "1"
else
	let s:bundle_dict['vim-scripts/taglist.vim'] = "1"
endif

if g:use_chinese_doc
    let s:bundle_dict['asins/vimcdoc'] = ""
endif

call BundlePluginsDict(s:bundle_dict)


" 第3步 加载没有插件的配置
let s:vimrc_name_list = [
	\ 'ctags.vimrc',
	\ 'cscope.vimrc',
	\ 'quickfix.vimrc',
	\	]

for vimrc_name in s:vimrc_name_list
	call SourceVimrc(vimrc_name, g:Warning_func)
endfor

