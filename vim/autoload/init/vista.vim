scriptencoding utf-8

function! init#vista#hook_add() abort
    nmap <silent> <C-f><C-v> :<C-u>Vista coc<CR>

    let g:vista_close_on_jump = 1
    let g:vista_icon_indent = ['`-> ', '|-> ']
    let g:vista#renderer#enable_icon = 0
    let g:vista#renderer#icons = {
                \   'function': 'func',
                \   'variable': 'var',
                \   'field': 'field',
                \   'struct': 'struct',
                \   'constant': 'const',
                \  }
endfunction
