scriptencoding utf-8

function! init#denite#hook_add() abort
    nnoremap [denite] <Nop>
    nmap <Leader> [denite]

    augroup denite_hook_add
        autocmd FileType denite call s:denite_my_settings()
    augroup END
    function! s:denite_my_settings() abort
        nnoremap <silent><buffer><expr> <CR>    denite#do_map('do_action')
        nnoremap <silent><buffer><expr> d       denite#do_map('do_action', 'delete')
        nnoremap <silent><buffer><expr> p       denite#do_map('do_action', 'preview')
        nnoremap <silent><buffer><expr> q       denite#do_map('quit')
        nnoremap <silent><buffer><expr> i       denite#do_map('open_filter_buffer')
        nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
    endfunction

    """ Grep """
    nnoremap <silent> [denite]p :<C-u>Denite grep -auto-action=preview<CR>

    """ Current Directory """
    nnoremap <silent> [denite]f :<C-u>Denite file/rec<CR>

    """ References """
    nnoremap <silent> [denite]r :<C-u>Denite references<CR>

    """ Buffer """
    nnoremap <silent> [denite]b :<C-u>Denite buffer -auto-action=preview<CR>

    """ Register """
    nnoremap <silent> [denite]R :<C-u>Denite -buffer-name=register=register<CR>

    """ MRU """
    nnoremap <silent> [denite]m :<C-u>Denite file_mru -auto-action=preview<CR>

    """ Bookmark """
    nnoremap <silent> [denite]c :<C-u>Denite bookmark<CR>

    """ Add Bookmark """
    nnoremap <silent> [denite]a :<C-u>DeniteBookmarkAdd<CR>

    """ .git以下のディレクトリ検索
    nnoremap <silent> [denite]k :<C-u>Denite
                \ -path=`substitute(finddir('.git', './;'), '.git', '', 'g')`
                \ file/rec/git<CR>
endfunction

function! init#denite#hook_post_source() abort
    call denite#custom#map('insert', '<C-N>', '<denite:move_to_next_line>', 'noremap')
    call denite#custom#map('insert', '<C-P>', '<denite:move_to_previous_line>', 'noremap')
    call denite#custom#map('insert', '<C-W>', '<denite:move_up_path>', 'noremap')

    call denite#custom#var('file/rec/git', 'command', ['git', 'ls-files', '-co',    '--exclude-standard'])
    call denite#custom#var('file/rec',     'command', ['rg',  '--files',  '--glob', '!.git'])

    call denite#custom#var('grep', 'command', ['rg'])
    call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep', '--no-heading'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])

    call denite#custom#source('file',     'matchers', ['matcher_cpsm', 'matcher_fuzzy'])
    call denite#custom#source('buffer',   'matchers', ['matcher_regexp'])
    call denite#custom#source('file_mru', 'matchers', ['matcher_regexp'])
    " call denite#custom#alias('source', 'file/rec/git', 'file/rec')

    " call denite#custom#option('default', 'auto_action', 'preview')
    call denite#custom#option('default', 'prompt', '>>')
    call denite#custom#option('default', 'split', 'floating')
endfunction
