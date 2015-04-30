#!/bin/bash - 
#===============================================================================
#
#          FILE: install_ycm.sh
# 
#         USAGE: ./install_ycm.sh 
# 
#   DESCRIPTION: install you complete me
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 04/30/2015 20:07
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


cd $HOME
mkdir ycm_build
cd ycm_build
cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON .  ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
make ycm_support_libs
cd $HOME
rm -rf ycm_build
