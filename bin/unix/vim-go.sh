#!/bin/bash -
#################################################################
#
#    file: vim-go.sh
#   usage: ./vim-go.sh
#   brief:  
#  author: tenfyzhong
#   email: tenfy@tenfy.cn
# created: 2018-12-13 22:06:02
#
#################################################################

set -o nounset                              # Treat unset variables as an error


go get -u github.com/zmb3/gogetdoc; go install github.com/zmb3/gogetdoc
go get -u golang.org/x/tools/cmd/guru; go install golang.org/x/tools/cmd/guru
go get -u github.com/golang/lint/golint; go install github.com/golang/lint/golint
go get -u github.com/davidrjenni/reftools/cmd/fillstruct; go install github.com/davidrjenni/reftools/cmd/fillstruct
go get -u github.com/rogpeppe/godef; go install github.com/rogpeppe/godef
go get -u github.com/fatih/motion; go install github.com/fatih/motion
go get -u github.com/kisielk/errcheck; go install github.com/kisielk/errcheck
go get -u github.com/derekparker/delve/cmd/dlv; go install github.com/derekparker/delve/cmd/dlv
go get -u github.com/mdempsky/gocode; go install github.com/mdempsky/gocode
go get -u github.com/jstemmer/gotags; go install github.com/jstemmer/gotags
go get -u github.com/josharian/impl; go install github.com/josharian/impl
go get -u golang.org/x/tools/cmd/goimports; go install golang.org/x/tools/cmd/goimports
go get -u github.com/koron/iferr; go install github.com/koron/iferr
go get -u github.com/fatih/gomodifytags; go install github.com/fatih/gomodifytags
go get -u github.com/dominikh/go-tools/cmd/keyify; go install github.com/dominikh/go-tools/cmd/keyify
go get -u golang.org/x/tools/cmd/gorename; go install golang.org/x/tools/cmd/gorename
go get -u github.com/klauspost/asmfmt/cmd/asmfmt; go install github.com/klauspost/asmfmt/cmd/asmfmt
# go get -u github.com/alecthomas/gometalinter; go install github.com/alecthomas/gometalinter
curl -L https://git.io/vp6lP | sh
