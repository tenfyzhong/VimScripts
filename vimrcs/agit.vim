"==============================================================
"    file: agit.vim
"   brief: gitk插件
"
" command: Agit [{options}] 打开一个agit的tab
"          AgitFile [{options}] 只打开当前文件相关的log
"
"    nmap: 
"        j			<Plug>(agit-scrolldown-stat)
"        k			<Plug>(agit-scrollup-stat)
"        <C-j>		<Plug>(agit-scrolldown-diff)
"        <C-k>		<Plug>(agit-scrollup-diff)
"        u			<PLug>(agit-reload)
"        yh			<Plug>(agit-yank-hash)
"        <C-g>		<Plug>(agit-print-commitmsg)
"        q			<Plug>(agit-exit)
"        C			<Plug>(agit-git-checkout)
"        cb			<Plug>(agit-git-checkout-b)
"        D			<Plug>(agit-git-branch-d)
"        rs			<Plug>(agit-git-reset-soft)
"        rm			<Plug>(agit-git-reset)
"        rh			<Plug>(agit-git-reset-hard)
"        rb			<Plug>(agit-git-rebase)
"        ri			<Plug>(agit-git-rebase-i)
"        di			<Plug>(agit-diff)
"        dl			<Plug>(agit-diff-with-local)
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2017-05-07 13:01:42
"==============================================================
PluginAdd 'cohama/agit.vim'
