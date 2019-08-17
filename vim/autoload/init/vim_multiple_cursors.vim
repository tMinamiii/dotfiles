function! s:multiple_cursors_before()
    if exists(':ALEDisableBuffer')==2
        exe 'ALEDisableBuffer'
    endif
    if exists(':CocDisable')==2
        exe 'CocDisable'
    endif
endfunction

function! s:multiple_cursors_after()
    if exists(':ALEEnableBuffer')==2
        exe 'ALEEnableBuffer'
    endif
    if exists(':CocEnable')==2
        exe 'CocEnable'
    endif
endfunction

function! init#vim_multiple_cursors#hook_add() abort
    augroup multiple_cursors
        autocmd User MultipleCursorsPre  call s:multiple_cursors_before()
        autocmd User MultipleCursorsPost call s:multiple_cursors_after()
    augroup END
endfunction
