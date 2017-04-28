#!/bin/bash -
#################################################################
#
#    file: autoformater_install.sh
#   usage: ./autoformater_install.sh
#   brief:
#  author: tenfyzhong
#   email: tenfyzhong@qq.com
# created: 2016-08-20 10:21:56
#
#################################################################

set -o nounset                              # Treat unset variables as an error

# $1 需要安装的名字
# $2 installer
# $3 installer的参数
function format_install()
{
    echo ""
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
            echo "$2 install $1"
            echo "has no $2"
        fi
    else
        echo "$2 install $1"
        echo "has no $2"
    fi
}

if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root"
    exit 1
fi

format_install autopep8 pip

format_install js-beautify npm -g
format_install typescript-formatter npm -g
format_install remark npm -g

format_install sass gem
format_install ruby-beautify gem

format_install tidy 'apt-get dnf yum' -y
