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
find . -not -regex '.*\.\(png\|gif\|mp3\|mp4\|o\|d\|a\|class\|obj\|exe\|jar\|zip\|tar.gz\|out\|lookupfile_tags\|tags\|gitignore\|git\|gitconfig\|bak\)' \
    -not -name 'NO_RESOURCES' -not -name "cscope.files" -type f -printf "%f\t%p\t1\n" | sort -f >> .lookupfile_tags

