#!/bin/bash

UNIX_INSTALL_PATH=~/.vim/bin/unix

PWD=$(pwd)

cd $UNIX_INSTALL_PATH/../..

SCRIPTS=(\
	$UNIX_INSTALL_PATH/install_clone_vundle.sh \
	$UNIX_INSTALL_PATH/install_vimrc.sh \
    $UNIX_INSTALL_PATH/install_load_plugin.sh)

for script in ${SCRIPTS[@]}; do
	[[ -f $script ]] && sh $script
done

cd $PWD
