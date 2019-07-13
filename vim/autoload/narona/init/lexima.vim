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

function! narona#init#lexima#hook_add() abort
	let g:lexima_enable_basic_rules = 1
	let g:lexima_ctrlh_as_backspace = 1
endfunction

function! narona#init#lexima#hook_post_source() abort
	call lexima#add_rule({'char': '(', 'at': '\%#[^)].*$', 'leave': 1})
	call lexima#add_rule({'char': '{', 'at': '\%#[^}].*$', 'leave': 1})
	call lexima#add_rule({'char': '[', 'at': '\%#[^\]].*$', 'leave': 1})

	call lexima#add_rule( {'char': '(', 'input_after': ')'})
	call lexima#add_rule( {'char': '(', 'at': '\\\%#'})
	call lexima#add_rule( {'char': ')', 'at': '\%#)', 'leave': 1})
	call lexima#add_rule( {'char': '<BS>', 'at': '(\%#)', 'delete': 1})
	call lexima#add_rule( {'char': '{', 'input_after': '}'})
	call lexima#add_rule( {'char': '}', 'at': '\%#}', 'leave': 1})
	call lexima#add_rule( {'char': '<BS>', 'at': '{\%#}', 'delete': 1})
	call lexima#add_rule( {'char': '[', 'input_after': ']'})
	call lexima#add_rule( {'char': '[', 'at': '\\\%#'})
	call lexima#add_rule( {'char': ']', 'at': '\%#]', 'leave': 1})
	call lexima#add_rule( {'char': '<BS>', 'at': '\[\%#\]', 'delete': 1})
endfunction
