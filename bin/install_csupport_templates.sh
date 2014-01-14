#!/bin/sh 

# 修改csupport模板
if [ -d ~/.vim/bundle/c.vim ]; then
	echo "修改csupport模板"
	if [ -f ~/.vim/templates/csupport/MyselfTemplates ]; then
		cp -f ~/.vim/templates/csupport/MyselfTemplates ~/.vim/bundle/c.vim/c-support/templates/Templates
	else
		[[ -f ~/.vim/templates/csupport/Templates ]] && cp -f ~/.vim/templates/csupport/Templates ~/.vim/bundle/c.vim/c-support/templates/Templates
	fi
	cp -f ~/.vim/templates/csupport/c*template ~/.vim/bundle/c.vim/c-support/templates/
#	[[ -f ~/.vim/templates/cpp.idioms.template ]] && cp -f ~/.vim/templates/cpp.idioms.template ~/.vim/bundle/c.vim/c-support/templates/
#
#	[[ -f ~/.vim/templates/cpp.comments.template ]] && cp -f ~/.vim/templates/cpp.comments.template ~/.vim/bundle/c.vim/c-support/templates/
#	[[ -f ~/.vim/templates/c.comments.template ]] && cp -f ~/.vim/templates/c.comments.template ~/.vim/bundle/c.vim/c-support/templates/
fi
