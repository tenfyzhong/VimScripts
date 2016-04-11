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

project=.
if [ $# -gt 0 ] &&  [ -d $1 ]; then
    project=$1
fi

project=$(dirname $project)/$(basename $project)

echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > $project/.lookupfile_tags
find $project -not -regex '.*\.\(png\|gif\|mp3\|mp4\|pdf\|o\|d\|a\|so\|class\|obj\|exe\|jar\|zip\|tar.gz\|out\|lookupfile_tags\|tags\|bak\|pyc\|swp\|doc\|docx\|xls\|xlsx\|tgz\|tar.gz\|d\.\d\d*\|Plo\|Po\)' \
    -a -not -regex '\.git.*' -a -not -regex '\.hg.*' -a -not -name 'NO_RESOURCES' \
    -a -not -name "*~" -a -not -name 'cscope.*' -a -not -name ".npmignore" \
    -a -not -name ".NERDTreeBookmarks" -a -not -name ".dblite" -a -not -name ".ycm_extra_conf.py"\
    -a -not -name ".dirstamp" \
    -a -not -wholename '*.svn*' -a -not -wholename "*.git*" -a -not -wholename "*/lib/*" \
    -a -not -wholename "*/so/*" \
    -a -not -wholename "*/.undofile/*" -a -not -wholename ".hg/*" \
    -type f -printf "%f\t%p\t1\n" | sort -f >> $project/.lookupfile_tags

if [ $HOME/.vim == $project ]; then
    sed -i '/\/bundle\//d' $project/.lookupfile_tags
fi

