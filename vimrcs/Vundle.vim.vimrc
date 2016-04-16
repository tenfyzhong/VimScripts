"==============================================================
"    file: Vundle.vim.vimrc
"   brief: 
"
" command: Plugin {args} 注册插件
"          PluginInstall[!] {pluginname} 安装插件,叹号是更新
"          PluginUpdate 更新插件
"          PluginSearch[!] {pattern} 查找插件,叹号更新缓存
"          PluginClean[!] 删除不用的插件
"          PluginAdd {args} 类似于Plugin，会检查重复等
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-16 15:17:52
"==============================================================
" let Vundle manage Vundle
PluginAdd 'VundleVim/Vundle.vim'

if !exists("g:Vundle_vim_maps")
    let g:Vundle_vim_maps = 1
    nnoremap <silent><leader>bi :BundleInstall<cr>
endif

