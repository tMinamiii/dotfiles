function! Multiple_cursors_before()
    syntax off
    if exists(':ALEDisableBuffer')==2
        exe 'ALEDisableBuffer'
    endif
    if exists(':CocDisable')==2
        exe 'CocDisable'
    endif
endfunction

function! Multiple_cursors_after()
    syntax on
    if exists(':ALEEnableBuffer')==2
        exe 'ALEEnableBuffer'
    endif
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
