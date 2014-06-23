#!/bin/bash - 

templateSrc=~/.vim/bundle/bash-support.vim/bash-support/templates/Templates
templateTar=~/.vim/resource/bash_support_templates
if ! [ $templateTar ] || ! [ $templateTar -ef $templateSrc ]; then
    rm -f $templateTar 
    ln -s $templateSrc $templateTar
fi
