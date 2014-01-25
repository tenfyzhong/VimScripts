" load_vimrc
if !exists('LOAD_VIMRCS_VIMRC')
let LOAD_VIMRCS_VIMRC = 1

" 加载插件
" 注意：插件的配置必须以插件名加.vimrc命名
" 如a.vim的配置为a.vim.vimrc，放在vimrcs目录下

" 第0步 载入全局函数
source ~/.vim/vimrcs/functions.vimrc

" 第1步 加载vundle
call g:source_vimrc('vundle.vimrc', g:Warning_func)

" 第2步 加载其他插件
" 'plugin_name':'vimrc_name'
" vimrc_name : '' 加载plugin_name.vimrc, 不存在不警告
" 			 : '1' 加载plugin_name.vimrc, 不存在警告
" 			 : '0' 不加载
" 			 " 'vimrc' 加载vimrc
let s:bundle_dict = {
			\ 'Rip-Rfp/clang_complete': '',
			\ 'winmanager': '',
			\ 'a.vim': '',
			\ 'c.vim': '',
			\ 'scrooloose/nerdtree': '',
			\ 'FindMate': '',
			\ 'fholgado/minibufexpl.vim': '',
			\ 'vim-scripts/grep.vim': '',
			\ 'ervandew/supertab': '',
			\ 'kien/ctrlp.vim': '',
			\ 'tpope/vim-fugitive': '0',
			\ 'magic-dot-files/TagHighlight': '0',
			\ 'vim-scripts/DoxygenToolkit.vim': '',
			\ 'vim-jp/cpp-vim': '0',
			\ 'Raimondi/delimitMate': '0',
			\ 'tpope/vim-surround': '0',
			\ 'gregsexton/gitv': '0',
			\ 'tpope/vim-commentary': '0',
			\ 'Yggdroot/indentLine': '',
			\ 'Shougo/unite.vim': '0',
			\ 'terryma/vim-multiple-cursors': '0',
			\ 'kshenoy/vim-signature': '0',
			\ 'Rykka/colorv.vim': '0',
			\ 'sjl/gundo.vim': '',
			\ 'leshill/vim-json': '0',
			\ 'SirVer/ultisnips': '0',
			\ 'othree/xml.vim': '',
			\ 'itchyny/calendar.vim': '',
			\ 'vimwiki/vimwiki': '0',
			\ 'vim-scripts/VimRepress': '0',
			\ 'vim-scripts/VOoM': '0',
			\ 'vim-scripts/CmdlineComplete': '0',
			\ 'DataWraith/auto_mkdir': '0',
			\}
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

call g:bundle_plugins_dict(s:bundle_dict)


" 第3步 加载没有插件的配置
let s:vimrc_name_list = [
	\ 'ctags.vimrc',
	\ 'cscope.vimrc',
	\ 'quickfix.vimrc',
	\	]

for vimrc_name in s:vimrc_name_list
	call g:source_vimrc(vimrc_name, g:Warning_func)
endfor

endif
