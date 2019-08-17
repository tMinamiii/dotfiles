function! MultipleCursorsBefore()
    if exists(':ALEDisableBuffer')==2
        exe 'ALEDisableBuffer'
    endif
    if exists(':CocDisable')==2
        exe 'CocDisable'
    endif
endfunction

function! MultipleCursorsAfter()
    if exists(':ALEEnableBuffer')==2
        exe 'ALEEnableBuffer'
    endif
    if exists(':CocEnable')==2
        exe 'CocEnable'
    endif
endfunction

function! init#vim_multiple_cursors#hook_add() abort
    augroup multiple_cursors
        autocmd User MultipleCursorsPre  call MultipleCursorsBefore()
        autocmd User MultipleCursorsPost call MultipleCursorsAfter()
    augroup END
endfunction
