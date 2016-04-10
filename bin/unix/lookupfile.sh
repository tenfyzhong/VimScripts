#!/bin/bash - 
#===============================================================================
#
#          FILE: lookup.sh
# 
#         USAGE: ./lookup.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: tenfyzhong (tenfy), 
#  ORGANIZATION: 
#       CREATED: 2016年04月10日 10:33
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > .lookupfile_tags
find . -not -regex '.*\.\(png\|gif\|mp3\|mp4\|pdf\|o\|d\|a\|so\|class\|obj\|exe\|jar\|zip\|tar.gz\|out\|lookupfile_tags\|tags\|bak\|pyc\|swp\)' \
    -a -not -regex '\.git.*' -a -not -regex '\.hg.*' -a -not -name 'NO_RESOURCES' \
    -a -not -name "*~" -a -not -name 'cscope.*' -a -not -name ".npmignore" \
    -a -not -wholename '*.svn*' -a -not -wholename "*.git*" \
    -a -not -wholename "*/.undofile/*" -a -not -wholename ".hg/*" \
    -type f -printf "%f\t%p\t1\n" | sort -f >> .lookupfile_tags

if [ $HOME/.vim == $(pwd) ]; then
    sed -i '/\/bundle\//d' .lookupfile_tags
fi

