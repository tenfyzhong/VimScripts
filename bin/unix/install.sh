#!/bin/bash

UNIX_INSTALL_PATH=~/.vim/bin/unix

PWD=$(pwd)

cd $UNIX_INSTALL_PATH/../.. || exit 1

SCRIPTS=(\
	$UNIX_INSTALL_PATH/install_plug.sh \
    $UNIX_INSTALL_PATH/install_load_plugin.sh\
    $UNIX_INSTALL_PATH/nvim.sh)

for script in "${SCRIPTS[@]}"; do
	[[ -f "$script" ]] && sh "$script"
done

cd "$PWD" || exit 1
