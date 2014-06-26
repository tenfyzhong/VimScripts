#!/bin/bash 

# 修改csupport模板
TEMPLATES=~/.vim/resource/csupport/Templates
MYSELFTEMPLATES=~/.vim/resource/csupport/MyselfTemplates
BASETEMPLATES=~/.vim/resource/csupport/BaseTemplates
DEFAULTTEMPLATES=~/.vim/bundle/c.vim/c-support/templates/Templates 

COPYTEMPLATES=$BASETEMPLATES

if ! [ -f $COPYTEMPLATES ]; then
	COPYTEMPLATES=$DEFAULTTEMPLATES
fi

if [ -f $COPYTEMPLATES ]; then
	if ! [ -L $TEMPLATES ] || ! [ $TEMPLATES -ef $MYSELFTEMPLATES ]; then
		rm -f $TEMPLATES
		echo "修改csupport模板"
		if ! [ -f $MYSELFTEMPLATES ]; then
			cp $COPYTEMPLATES $MYSELFTEMPLATES
		fi

		ln -s $MYSELFTEMPLATES $TEMPLATES
	fi
fi

