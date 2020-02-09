function! init#lightline#config() abort
    let g:lightline = {
                \ 'colorscheme': 'material',
                \ 'active': {
                \   'left': [ [ 'mode', 'paste' ], ['fugitive', 'filename', 'modified', 'readonly' ] ],
                \   'right': [ [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
                \ },
                \ 'inactive': {
                \     'left': [ [ 'filename' ] ],
                \     'right': [ [ 'lineinfo' ], [ 'percent' ] ]
                \ },
                \ 'tabline': {'left': [['buffers']], 'right': [['close']]},
                \ 'component_function': {
                \   'cocstatus': 'coc#status',
                \   'fugitive': 'LightlineFugitive',
                \   'filename': 'LightlineFilename',
                \   'fileformat': 'LightlineFileformat',
                \   'filetype': 'LightlineFiletype',
                \   'fileencoding': 'LightlineFileencoding',
                \   'mode': 'LightlineMode',
                \ },
                \ 'component_expand': {
                \   'buffers': 'lightline#bufferline#buffers',
                \ },
                \ 'component_type': {
                \   'syntastic': 'error',
                \   'buffers': 'tabsel',
                \ },
                \ 'subseparator': { 'left': '|', 'right': '|' }
                \ }

    function! LightlineModified()
        return &filetype =~? 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
    endfunction

    function! LightlineReadonly()
        return &filetype !~? 'help' && &readonly ? 'RO' : ''
    endfunction

    function! LightlineFilename()
        let fname = expand('%:t')
        return fname ==? '__Tagbar__' ? g:lightline.fname :
                \ fname =~? '__Gundo\|NERD_tree' ? '' :
                \ ('' !=? LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
                \ ('' !=? fname ? fname : '[No Name]') .
                \ ('' !=? LightlineModified() ? ' ' . LightlineModified() : '')
    endfunction

    function! LightlineFugitive()
        try
            if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &filetype !~? 'vimfiler' && exists('*fugitive#head')
                let mark = ''  " edit here for cool mark
                let branch = fugitive#head()
                return branch !=# '' ? mark.branch : ''
            endif
        catch
        endtry
        return ''
    endfunction

    function! LightlineFileformat()
        return winwidth(0) > 70 ? &fileformat : ''
    endfunction

    function! LightlineFiletype()
        return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
    endfunction

    function! LightlineFileencoding()
        return winwidth(0) > 70 ? (&fileencoding !=# '' ? &fileencoding : &encoding) : ''
    endfunction

    function! LightlineMode()
        let fname = expand('%:t')
        return fname ==? '__Tagbar__' ? 'Tagbar' :
                    \ fname ==? '__Gundo__' ? 'Gundo' :
                    \ fname ==? '__Gundo_Preview__' ? 'Gundo Preview' :
                    \ fname =~? 'NERD_tree' ? 'NERDTree' :
                    \ winwidth(0) > 60 ? lightline#mode() : ''
    endfunction

    let g:tagbar_status_func = 'TagbarStatusFunc'

    function! TagbarStatusFunc(current, sort, fname, ...) abort
        let g:lightline.fname = a:fname
        return lightline#statusline(0)
    endfunction

    let g:unite_force_overwrite_statusline = 0
    let g:vimfiler_force_overwrite_statusline = 0
    let g:vimshell_force_overwrite_statusline = 0
endfunction
