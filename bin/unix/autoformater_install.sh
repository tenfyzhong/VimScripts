#!/bin/bash -
#################################################################
#
#    file: autoformater_install.sh
#   usage: ./autoformater_install.sh
#   brief:
#  author: tenfyzhong
#   email: 364755805@qq.com
# created: 2016-08-20 10:21:56
#
#################################################################

set -o nounset                              # Treat unset variables as an error

# $1 需要安装的名字
# $2 installer
# $3 installer的参数
function format_install()
{
    INSTALLER=$(whereis $2 | awk '{print $2}')
    if [ -n "$INSTALLER" ]; then
        INSTALLER=$(echo $INSTALLER | awk '{print $1}')
        if [ -n "$INSTALLER" -a -x "$INSTALLER" ]; then
            FLAG=
            if (( $# > 2 )); then
                FLAG=$3
            fi
            echo "$INSTALLER install $FLAG $1"
            $INSTALLER install $FLAG $1
        else
            echo "no $2"
        fi
    else
        echo "no $2"
    fi
}

format_install autopep8 pip

format_install js-beautify npm -g
format_install typescript-formatter npm -g
format_install remark npm -g

format_install sass gem
format_install ruby-beautify gem

format_install tidy 'apt-get dnf yum' -y
