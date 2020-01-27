function! init#vim_projectroot#hook_add() abort
    let g:rootmarkers = ['.projectroot','.git','.hg','.svn','.bzr','_darcs', 'build.xml', '.venv', 'node_modules', 'pyproject.toml', 'package.json', 'go.mod']
    function! <SID>AutoProjectRootCD()
        try
            if &filetype !=? 'help'
                ProjectRootCD
            endif
        catch
            " Silently ignore invalid buffers
        endtry
    endfunction
    augroup mygroup
        autocmd BufEnter * call <SID>AutoProjectRootCD()
    augroup END
endfunction
