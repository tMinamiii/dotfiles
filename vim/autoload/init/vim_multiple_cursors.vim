function! Multiple_cursors_before()
    if exists(':CocDisable')==2
        exe 'CocDisable'
    endif
endfunction

function! Multiple_cursors_after()
    if exists(':CocEnable')==2
        exe 'CocEnable'
    endif
endfunction

function! init#vim_multiple_cursors#hook_add() abort
    augroup mygroup
        autocmd User MultipleCursorsPre  call Multiple_cursors_before()
        autocmd User MultipleCursorsPost call Multiple_cursors_after()
    augroup END
endfunction
