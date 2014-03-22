#VimScripts
安装说明：
将克隆下来的VimScripts重命名为.vim，然后运行install.sh: 
	mv ~/.vim ~/.vim.bak # 备份之前自己的vim配置，若不存在则不用此操作
	mv VimScripts ~/.vim
	sh ~/.vim/install.sh

bin/generate_clang_complete.sh用于生成c/c++自动补全的.clang_complete文件，请
在工程根目录下运行，或者在工程根目录下的vim命令模式下运行<leader>gc,<leader>
为vim的一个设置变量，默认为'\'

使用csupport，可以在.vim/templates下修改Templates模板，使其支持自己的信 息，
也可复制一个Templates为MyselfTemplates:
	cp ~/.vim/templates/Templates ~/.vim/templates/MyselfTemplates
在MyselfTemplates下进行编辑。MyselfTemplates不会被git进行跟踪。
修改完后，运行install.sh进行加载。

neocomplcache和clang_complete会冲突，只能使用一个

vim-powerline会与clang_complete冲突，建议不使用

需要安装的软件：
git
ctags
clang
cscope(可选，没有则不能使用cscope)


快捷键绑定
[global : normal]
<leader>ev: 	水平切分窗口打开.vimrc
<leader>sv: 	加载.vimrc
<F12>: 			逆时间切换窗口
<c-left>: 		移到左边窗口
<c-down>: 		移到下边窗口
<c-up>: 		移到上边窗口
<c-right>: 		移到右边窗口
<leader>h: 		移到左边窗口
<leader>j: 		移到下边窗口
<leader>k: 		移到上边窗口
<leader>l: 		移到右边窗口

[a.vim : normal]
<leader>as: 	在源文件和头文件中切换

[clang_complete : normal]
<leader>gc: 	在当前目录生成.clang_complete

[cscope : normal]
<C-_>s:
<C-_>g:
<C-_>c:
<C-_>t:
<C-_>e:
<C-_>f:
<C-_>i:
<C-_>d:
<C-Space>s:
<C-Space>g:
<C-Space>c:
<C-Space>t:
<C-Space>e:
<C-Space>f:
<C-Space>i:
<C-Space>d:
<C-Space><C-Space>s:
<C-Space><C-Space>g:
<C-Space><C-Space>c:
<C-Space><C-Space>t:
<C-Space><C-Space>e:
<C-Space><C-Space>i:
<C-Space><C-Space>d:

[ctags : normal]
<leader>tg: 	在当前目录生成tags

[minibufexpl.vim : normal]
<leader>mbo: 	打开minibuf窗口
<leader>mbc: 	关闭minibuf窗口
<leader>mbt: 	触发minibuf窗口
<leader>mbk: 	minibuf中的下一个文件
<leader>mbj: 	minibuf中的上一个文件
<c-l>: 			minibuf中的下一个文件
<c-h>: 			minibuf中的上一个文件

[minibufexpl.vim : insert]
<c-l>: 			minibuf中的下一个文件
<c-h>: 			minibuf中的上一个文件

[nerdtree : normal]
<leader>nt: 	触发nerdtree

[tagbar or taglist : normal]
<leader>tt: 	触发tagbar or taglist
<leader>ta: 	触发tagbar和nerdtree

[vundle.vimrc : normal]
<leader>bi: 	Bundle安装插件

[winmanager : normal]
<leader>wm: 	触发winmanager

[quickfix : normal]
<leader>qk:		上一条错误警告处
<leader>qj: 	下一条错误警告处
<leader>qc:		关闭quickfix
<leader>qo:		打开quckfix

[Doxygen : normal]
<leader>dox: 	生成函数和类注释
<leader>doa: 	生成文件注释
<leader>dol: 	生成证书注释

[Doxygen : insert]
<leader>dox: 	生成函数和类注释
<leader>doa: 	生成文件注释
<leader>dol: 	生成证书注释

[Gundo : normal]
<leader>gu: 	GundoToogle
