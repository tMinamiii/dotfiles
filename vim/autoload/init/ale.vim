scriptencoding utf-8

function! init#ale#hook_add() abort
    nmap <silent> <Leader>/ :ALEFix<CR>
    nmap <silent> <leader>jj :ALENext<CR>
    nmap <silent> <leader>kk :ALEPrevious<CR>

    let g:ale_linters = {
                \   'javascript': ['eslint'],
                \   'javascript.jsx': ['eslint'],
                \   'php': ['phan', 'phpcs', 'phpstan', 'php'],
                \   'go': ['govet', 'golangci-lint'],
                \   'python': ['pycodestyle',  'pylint', 'mypy', 'flake8', 'isort'],
                \   'ruby': ['ruby'],
                \   'typescript': ['eslint', 'tsserver'],
                \   'vue': ['eslint', 'vls'],
                \   'zsh': ['shellcheck'],
                \   'vim': ['vint'],
                \   'yaml': ['prettier'],
                \}

    let g:ale_fixers = {
                \ 'bash': ['shfmt'],
                \ 'go': ['gofmt', 'goimports'],
                \ 'javascript': ['eslint'],
                \ 'javascript.jsx': ['eslint'],
                \ 'json': ['prettier'],
                \ 'php': ['php_cs_fixer', 'phpcbf'],
                \ 'python': ['autopep8', 'yapf', 'isort'],
                \ 'sh': ['shfmt'],
                \ 'typescript': ['eslint'],
                \ 'vue': ['eslint'],
                \ 'yaml': ['prettier'],
                \ }

    let g:ale_sign_error = 'E*'       " エラー行に表示するマーク
    let g:ale_sign_warning = 'W*'     " エラー行に表示するマーク

    let g:ale_set_highlights = 1
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]' " エラー行にカーソルをあわせた際に表示されるメッセージフォーマット
    let g:ale_sign_column_always = 1 " エラー表示の列を常時表示
    let g:ale_completion_enabled = 0
    let g:ale_virtualtext_cursor = 1

    let g:ale_disable_lsp = 1
    let g:ale_lint_on_enter = 1      " ファイルを開いたときにlint実行
    let g:ale_lint_on_save = 1       " ファイルを保存したときにlint実行
    let g:ale_fix_on_save = 0        " ファイルを保存したときにfix実行
    let g:ale_lint_delay = 50
    let g:ale_lint_on_text_changed = 'never' " always or never

    " lint結果をロケーションリストとQuickFixには表示しない。QuickFixを書き換えられるのは困る
    let g:ale_set_loclist = 0
    let g:ale_set_quickfix = 0
    let g:ale_open_list = 0
    let g:ale_keep_list_window_open = 0
    let g:ale_javascript_eslint_options = '--cache'
    let g:ale_javascript_eslint_suppress_eslintignore = 1
    let g:ale_python_mypy_options='--ignore-missing-imports --follow-imports=silent --show-column-numbers'
    let g:ale_php_phpcs_use_global = 1
    " let g:ale_php_phpcs_standard = 'PSR12'
    " let g:ale_php_cs_fixer_options = '--rules=@PSR2'
    " let g:ale_php_phpcs_executable = './vendor/bin/phpcs'
    " let g:ale_php_phpstan_executable = './vendor/bin/phpstan'
    let g:ale_php_phpstan_level = 5
    let g:ale_php_phan_use_client = 1
    let g:ale_go_golangci_lint_options = '
                \ --enable-all
                \ -D=typecheck
                \ -D=dupl
                \ -D=gochecknoglobals
                \ -D=deadcode
                \ -D=unused
                \ -D=lll
                \ -D=prealloc
                \'

endfunction
