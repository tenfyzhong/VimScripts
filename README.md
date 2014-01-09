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

需要安装的软件：
git
ctags
clang
cscope(可选，没有则不能使用cscope)
