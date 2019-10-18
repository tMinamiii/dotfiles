scriptencoding utf-8

" Before        Input         After
" ------------------------------------
" |             (             (|)
" ------------------------------------
" |             "             "|"
" ------------------------------------
" ""|           "             """|"""
" ------------------------------------
" ''|           '             '''|'''
" ------------------------------------
" \|            [             \[|
" ------------------------------------
" \|            "             \"|
" ------------------------------------
" \|            '             \'|
" ------------------------------------
" I|            'm            I'm|
" ------------------------------------
" (|)           )             ()|
" ------------------------------------
" '|'           '             ''|
" ------------------------------------
" (|)           <BS>          |
" ------------------------------------
" '|'           <BS>          |
" ------------------------------------

function! init#lexima#hook_add() abort
    let g:lexima_enable_basic_rules = 0
    let g:lexima_ctrlh_as_backspace = 1
endfunction

function! init#lexima#hook_post_source() abort
    let g:lexima#default_rules = [
    \ {'char': '(', 'input_after': ')'},
    \ {'char': '(', 'at': '\\\%#'},
    \ {'char': ')', 'at': '\%#)', 'leave': 1},
    \ {'char': '<BS>', 'at': '(\%#)', 'delete': 1},
    \ {'char': '{', 'input_after': '}'},
    \ {'char': '}', 'at': '\%#}', 'leave': 1},
    \ {'char': '<BS>', 'at': '{\%#}', 'delete': 1},
    \ {'char': '[', 'input_after': ']'},
    \ {'char': '[', 'at': '\\\%#'},
    \ {'char': ']', 'at': '\%#]', 'leave': 1},
    \ {'char': '<BS>', 'at': '\[\%#\]', 'delete': 1},
    \ ]

    let g:lexima#default_rules += [
    \ {'char': '"', 'input_after': '"'},
    \ {'char': '"', 'at': '\%#"', 'leave': 1},
    \ {'char': '"', 'at': '\\\%#'},
    \ {'char': '"', 'at': '^\s*\%#', 'filetype': 'vim'},
    \ {'char': '"', 'at': '\%#\s*$', 'filetype': 'vim'},
    \ {'char': '<BS>', 'at': '"\%#"', 'delete': 1},
    \ {'char': '"', 'at': '""\%#', 'input_after': ''},
    \ {'char': "'", 'input_after': "'"},
    \ {'char': "'", 'at': '\%#''', 'leave': 1},
    \ {'char': "'", 'at': '\w\%#''\@!'},
    \ {'char': "'", 'at': '\\\%#'},
    \ {'char': "'", 'at': '\\\%#', 'leave': 1, 'filetype': ['vim', 'sh', 'csh', 'ruby', 'tcsh', 'zsh']},
    \ {'char': "'", 'filetype': ['haskell', 'lisp', 'clojure', 'ocaml', 'reason', 'scala', 'rust']},
    \ {'char': '<BS>', 'at': "'\\%#'", 'delete': 1},
    \ {'char': "'", 'at': "''\\%#", 'input_after': ""},
    \ {'char': '`', 'input_after': '`'},
    \ {'char': '`', 'at': '\%#`', 'leave': 1},
    \ {'char': '<BS>', 'at': '`\%#`', 'delete': 1},
    \ {'char': '`', 'filetype': ['ocaml', 'reason']},
    \ {'char': '`', 'at': '``\%#', 'input_after': ''},
    \ {'char': '`', 'at': '\%#```', 'leave': 3},
    \ {'char': '<BS>', 'at': '```\%#```', 'input': '<BS><BS><BS>', 'delete': 3},
    \ ]

    for rule in g:lexima#default_rules
      call lexima#add_rule(rule)
    endfor
    " call lexima#add_rule({'char': '(', 'at': '\%#[^)].*$', 'leave': 1})
    " call lexima#add_rule({'char': '{', 'at': '\%#[^}].*$', 'leave': 1})
    " call lexima#add_rule({'char': '[', 'at': '\%#[^\]].*$', 'leave': 1})

    " call lexima#add_rule( {'char': '(', 'input_after': ')'})
    " call lexima#add_rule( {'char': '(', 'at': '\\\%#'})
    " call lexima#add_rule( {'char': ')', 'at': '\%#)', 'leave': 1})
    " call lexima#add_rule( {'char': '<BS>', 'at': '(\%#)', 'delete': 1})
    " call lexima#add_rule( {'char': '{', 'input_after': '}'})
    " call lexima#add_rule( {'char': '}', 'at': '\%#}', 'leave': 1})
    " call lexima#add_rule( {'char': '<BS>', 'at': '{\%#}', 'delete': 1})
    " call lexima#add_rule( {'char': '[', 'input_after': ']'})
    " call lexima#add_rule( {'char': '[', 'at': '\\\%#'})
    " call lexima#add_rule( {'char': ']', 'at': '\%#]', 'leave': 1})
    " call lexima#add_rule( {'char': '<BS>', 'at': '\[\%#\]', 'delete': 1})
endfunction
