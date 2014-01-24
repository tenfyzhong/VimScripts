#!/bin/sh 

# 修改csupport模板
TEMPLATES=~/.vim/templates/csupport/Templates
MYSELFTEMPLATES=~/.vim/templates/csupport/MyselfTemplates
DEFAULTTEMPLATES=~/.vim/bundle/c.vim/c-support/templates/Templates 
if [ -f $DEFAULTTEMPLATES ]; then
	if ! [ -L $TEMPLATES ] || ! [ $MYSELFTEMPLATES -ef $MYSELFTEMPLATES ]; then
		rm -f $TEMPLATES
		echo "修改csupport模板"
		if ! [ -f $MYSELFTEMPLATES ]; then
			cp $DEFAULTTEMPLATES $MYSELFTEMPLATES
		fi

		ln -s $MYSELFTEMPLATES $TEMPLATES
	fi
fi

