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
[global]
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

[a.vim]
<leader>as: 	在源文件和头文件中切换

[clang_complete]
<leader>gc: 	在当前目录生成.clang_complete

[cscope]
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

[ctags]
<leader>tg: 	在当前目录生成tags

[minibufexpl.vim]
<leader>mbo: 	打开minibuf窗口
<leader>mbc: 	关闭minibuf窗口
<leader>mbt: 	触发minibuf窗口
<c-k>: 			minibuf中的下一个文件
<c-j>: 			minibuf中的上一个文件

[nerdtree]
<leader>nt: 	触发nerdtree

[tagbar or taglist]
<leader>tt: 	触发tagbar or taglist
<leader>ta: 	触发tagbar和nerdtree

[vundle.vimrc]
<leader>bi: 	Bundle安装插件

[winmanager]
<leader>wm: 	触发winmanager
