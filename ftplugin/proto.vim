if exists(":Tagbar")
    let g:tagbar_type_proto = {
                \ 'ctagstype': 'proto',
                \ 'kinds': [
                \ 'm:message:0:1',
                \ 'e:enum:0:1',
                \ ],
                \ 'sro': '.',
                \}
endif
