#!/bin/bash 

# 修改csupport模板
MYSELFTEMPLATES=~/.vim/resource/csupport/MyselfTemplates
BASETEMPLATES=~/.vim/resource/csupport/BaseTemplates

if ! [ -f $MYSELFTEMPLATES ]; then
    cp $BASETEMPLATES $MYSELFTEMPLATES
fi
