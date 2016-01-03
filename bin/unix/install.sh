#!/bin/bash

UNIX_INSTALL_PATH=~/.vim/bin/unix

SCRIPTS=(\
	$UNIX_INSTALL_PATH/install_clone_vundle.sh \
	$UNIX_INSTALL_PATH/install_vimrc.sh \
	$UNIX_INSTALL_PATH/install_generate_clang_complete.sh \
	$UNIX_INSTALL_PATH/install_load_plugin.sh \
	$UNIX_INSTALL_PATH/install_csupport_templates.sh \
    $UNIX_INSTALL_PATH/install_ywvim_codetable.sh \
    $UNIX_INSTALL_PATH/install_vimshell.sh \
    $UNIX_INSTALL_PATH/install_bash_support.sh )

for script in ${SCRIPTS[@]}; do
	[[ -f $script ]] && sh $script
done
