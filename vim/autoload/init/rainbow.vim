function init#rainbow#hook_add() abort
    let g:rainbow_active = 0
    let g:rainbow_conf = {
                \    'guifgs': ['darkorange2', 'orchid3', 'seagreen3'],
                \   'separately': {
                \       'nerdtree': 0,
                \   },
                \ }
endfunction
