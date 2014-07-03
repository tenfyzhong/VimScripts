#!/bin/bash

SCRIPTS=(\
	~/.vim/bin/install_clone_vundle.sh \
	~/.vim/bin/install_vimrc.sh \
	~/.vim/bin/install_generate_clang_complete.sh \
	~/.vim/bin/install_load_plugin.sh \
	~/.vim/bin/install_csupport_templates.sh \
    ~/.vim/bin/install_ywvim_codetable.sh \
    ~/.vim/bin/install_vimshell.sh \
    ~/.vim/bin/install_bash_support.sh )

for script in ${SCRIPTS[@]}; do
	[[ -f $script ]] && sh $script
done
