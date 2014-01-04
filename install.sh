#!/bin/sh

# 克隆vundle版本库
if ! [ -e ~/.vim/bundle/vundle/.git ]; then
	if [ -e ~/.vim/bundle/vundle ]; then
		rm -rf ~/.vim/bundle/vundle
	fi

	echo "克隆vundle"
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle 

else
	cd ~/.vim/bundle/vundle/
	echo "拉回vundle"
	git pull
	cd -
fi

if  ! [ -L ~/.vimrc ] || ! [ ~/.vimrc -ef ~/.vim/.vimrc ] ; then
	echo "创建.vimrc"
	rm -rf ~/.vimrc
	ln -s ~/.vim/.vimrc ~/.vimrc
fi

GenerateClangComplete=~/.vim/bin/generate_clang_complete.sh
if [ -f $GenerateClangComplete ]; then
	if ! [ -x $GenerateClangComplete ]; then
		echo "为generate_clang_complete.sh添加执行权限"
		chmod +x $GenerateClangComplete 
	fi
fi

echo "加载插件"
# 运行BundleInstall加载插件
vim -c BundleInstall -c qa!

# 修改csupport模板
if [ -d ~/.vim/bundle/c.vim ]; then
	echo "修改csupport模板"
	#[[ -f ~/.vim/templates/MyselfTemplates ]] && cp -f ~/.vim/templates/MyselfTemplates ~/.vim/bundle/c.vim/c-support/templates/Templates || [[ -f ~/.vim/templates/Templates ]] && cp -f ~/.vim/templates/Templates ~/.vim/bundle/c.vim/c-support/templates/Templates
	if [ -f ~/.vim/templates/MyselfTemplates ]; then
		cp -f ~/.vim/templates/MyselfTemplates ~/.vim/bundle/c.vim/c-support/templates/Templates
	else
		[[ -f ~/.vim/templates/Templates ]] && cp -f ~/.vim/templates/Templates ~/.vim/bundle/c.vim/c-support/templates/Templates
	fi
	[[ -f ~/.vim/templates/cpp.comments.template ]] && cp -f ~/.vim/templates/cpp.comments.template ~/.vim/bundle/c.vim/c-support/templates/
	[[ -f ~/.vim/templates/c.comments.template ]] && cp -f ~/.vim/templates/c.comments.template ~/.vim/bundle/c.vim/c-support/templates/
fi
