#!/bin/bash 

TEMPLATESRC=~/.vim/bundle/bash-support.vim/bash-support/templates/Templates
MYSELFTEMPLATES=~/.vim/resource/bash-support/MyselfTemplates
if ! [ -f $MYSELFTEMPLATES ]; then
    cp $TEMPLATESRC $MYSELFTEMPLATES
fi
