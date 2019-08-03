scriptencoding utf-8

function! init#indentLine#hook_add() abort
    let g:indentLine_showFirstIndentLevel = 1
    let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*', '_defx.*']
    let g:indentLine_bufTypeExluce = ['help', 'nerdtree', 'defx', 'terminal']
    let g:indentLine_fileTypeExluce = ['help', 'nerdtree', 'defx']
    let g:indentLine_color_term = 238
    let g:indentLine_color_gui = '#676767'
endfunction
