"**********************************************************************
" ywvim
Bundle 'vim-scripts/ywvim'
if g:plugin_exist("ywvim")
	" echom "ywvim script"
	let g:ywvim_ims=[ 
		\['wb', '五笔', 'wubi.ywvim'], 
		\['py', '拼音', 'pinyin.ywvim'], 
		\['cj', '仓颉', 'cangjie.ywvim'], 
		\['wb98', '五笔98', 'wubi98.ywvim'], 
		\['zm', '郑码', 'zhengma.ywvim'], 
		\['zy', '注音', 'zhuyin.ywvim'], 
		\['ar30', '行列', 'array30.ywvim'], 
		\]

	let g:ywvim_py = { 'helpim':'wb', 'gb':0 }

	let g:ywvim_zhpunc = 1
	let g:ywvim_listmax = 5
	let g:ywvim_esc_autoff = 0
	let g:ywvim_autoinput = 0
	let g:ywvim_circlecandidates = 1
	let g:ywvim_helpim_on = 0
	let g:ywvim_matchexact = 0
	let g:ywvim_chinesecode = 1
	let g:ywvim_gb = 0
	let g:ywvim_preconv = 'g2b'
	let g:ywvim_conv = ''
	let g:ywvim_lockb = 1
else
	if g:load_vimrc_warn 
		echo "no ywvim"
	endif
endif
"**********************************************************************
