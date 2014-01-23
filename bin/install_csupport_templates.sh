#!/bin/sh 

# 修改csupport模板
TEMPLATES=~/.vim/templates/csupport/Templates
MYSELFTEMPLATES=~/.vim/templates/csupport/MyselfTemplates
DEFAULTTEMPLATES=~/.vim/bundle/c.vim/c-support/templates/Templates 
if ! [ -L ~/.vim/templates/csupport/Templates ]; then
	echo "修改csupport模板"
	if [ -f $MYSELFTEMPLATES ]; then
		ln -s $MYSELFTEMPLATES $TEMPLATES
	elif [ -f $DEFAULTTEMPLATES ]; then
		ln -s $DEFAULTTEMPLATES $TEMPLATES
	fi
fi

