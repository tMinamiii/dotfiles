local opt = vim.opt

opt.encoding = "utf-8"
opt.completeopt:append({ "noselect" })

opt.ignorecase = true -- 大文字小文字を区別しない
opt.smartcase = true -- 検索文字に大文字がある場合は大文字小文字を区別
opt.incsearch = true -- インクリメンタルサーチ
opt.hlsearch = true -- 検索マッチテキストをハイライト

opt.hidden = true -- バッファを閉じる代わりに隠す（Undo履歴を残すため）
opt.switchbuf = "useopen" -- 新しく開く代わりにすでに開いてあるバッファを開く
opt.showmatch = true -- 対応する括弧などをハイライト表示する
opt.matchtime = 2 -- 対応括弧のハイライト表示を3秒にする
opt.backspace = "0"

opt.clipboard:append({ unnamedplus = true, unnamed = true })
opt.updatetime = 500
opt.shortmess:append({ c = true })
opt.signcolumn = "yes"

opt.number = true -- 行番号の表示
opt.textwidth = 0 -- 自動的に改行が入るのを無効化
opt.display = "lastline"
opt.softtabstop = 0
opt.showtabline = 0 -- 常にタブラインを表示
opt.laststatus = 2
opt.cmdheight = 1
opt.whichwrap = "b,s,<,>,[,]" -- wrapするカッコ一覧
opt.list = true -- 不可視文字の可視化
opt.listchars:append({ tab = [[| ]], trail = "￭", extends = "❯", precedes = "❮" })
opt.ttimeout = nil
opt.ttimeoutlen = 10
opt.scrolloff = 10 -- 3行残して画面スクロールする
opt.shell = "zsh"
opt.ttyfast = true
opt.ambiwidth = "single"
opt.termguicolors = true
opt.wildmenu = true
opt.wildmode = "full"
opt.wildoptions = "pum"


-----------------------------------------------------------------------------"
-- Commands \ Modes | Normal | Insert | Command | Visual | Select | Operator |
--------------------|--------|--------|---------|--------|--------|----------|
-- map  / noremap   |    @   |   -    |    -    |   @    |   @    |    @     |
-- nmap / nnoremap  |    @   |   -    |    -    |   -    |   -    |    -     |
-- vmap / vnoremap  |    -   |   -    |    -    |   @    |   @    |    -     |
-- omap / onoremap  |    -   |   -    |    -    |   -    |   -    |    @     |
-- xmap / xnoremap  |    -   |   -    |    -    |   @    |   -    |    -     |
-- smap / snoremap  |    -   |   -    |    -    |   -    |   @    |    -     |
-- map! / noremap!  |    -   |   @    |    @    |   -    |   -    |    -     |
-- imap / inoremap  |    -   |   @    |    -    |   -    |   -    |    -     |
-- cmap / cnoremap  |    -   |   -    |    @    |   -    |   -    |    -     |
-----------------------------------------------------------------------------"

vim.cmd [[
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
]]

vim.g.netrw_liststyle = 1 -- " ファイルツリーの表示形式、1にするとls -laのような表示になります
vim.g.netrw_banner = 0 -- " ヘッダを非表示にする
vim.g.netrw_sizestyle = "H" -- " サイズを(K,M,G)で表示する
vim.g.netrw_timefmt = "%Y/%m/%d(%a) %H:%M:%S" -- " 日付フォーマットを yyyy/mm/dd(曜日) hh:mm:ss で表示する
vim.g.netrw_preview = 1 -- " プレビューウィンドウを垂直分割で表示する
vim.g.mapleader = "<Space>"

local api = vim.api
api.nvim_set_keymap("n", "<ESC><ESC>", ":noh<CR>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<M-p>", ":bp<CR>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<M-n>", ":bn<CR>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<M-d>", ":bd<CR>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "[b", ":bprevious<CR>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "]b", ":bnext<CR>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "[B", ":bfirst<CR>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "]B", ":blast<CR>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })
api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<C-k>", "{", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<C-j>", "}", { noremap = true, silent = true })

-- バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
vim.cmd [[cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/']]
vim.cmd [[cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?']]

--  vim strict mode
api.nvim_set_keymap("v", "<C-c>", "<nop>", { noremap = true })
api.nvim_set_keymap("v", "<Up>", "<nop>", { noremap = true })
api.nvim_set_keymap("v", "<Down>", "<nop>", { noremap = true })
api.nvim_set_keymap("v", "<Left>", "<nop>", { noremap = true })
api.nvim_set_keymap("v", "<Right>", "<nop>", { noremap = true })

api.nvim_set_keymap("i", "<C-c>", "<nop>", { noremap = true })
api.nvim_set_keymap("i", "<Up>", "<nop>", { noremap = true })
api.nvim_set_keymap("i", "<Down>", "<nop>", { noremap = true })
api.nvim_set_keymap("i", "<Left>", "<nop>", { noremap = true })
api.nvim_set_keymap("i", "<Right>", "<nop>", { noremap = true })
api.nvim_set_keymap("i", "<BS>", "<nop>", { noremap = true })
api.nvim_set_keymap("i", "<C-h>", "<BS>", { noremap = true })
api.nvim_set_keymap("i", "<C-l>", "<DEL>", { noremap = true })

api.nvim_set_keymap("t", "<C-j><C-j>", [[<C-\><C-n>]], { noremap = true })

api.nvim_set_keymap("n", "<C-c>", "<nop>", { noremap = true })
api.nvim_set_keymap("n", "<Up>", "<nop>", { noremap = true })
api.nvim_set_keymap("n", "<Down>", "<nop>", { noremap = true })
api.nvim_set_keymap("n", "<Left>", "<nop>", { noremap = true })
api.nvim_set_keymap("n", "<Right>", "<nop>", { noremap = true })
api.nvim_set_keymap("n", "<C-[>", "<nop>", { noremap = true })
api.nvim_set_keymap("n", "<Esc>", "<nop>", { noremap = true })

-- easymotion
-- api.nvim_set_keymap("n", "<Leader>", "<Plug>(easymotion-prefix)", { noremap = true, silent = true })
api.nvim_create_user_command("Q", ":q", {})
api.nvim_create_user_command("W", ":w", {})
api.nvim_create_user_command("Wq", ":wq", {})
api.nvim_create_user_command("WQ", ":wq", {})
api.nvim_create_user_command("Term", ":bo terminal ++rows=20", {})

opt.expandtab = true -- タブをスペースにする
opt.tabstop = 2
opt.shiftwidth = 2
opt.conceallevel = 2
opt.concealcursor = "nc"

vim.cmd [[
augroup nerdtree_hook_add
    autocmd FileType nerdtree nmap <buffer> l o
    autocmd FileType nerdtree nmap <buffer> <C-0> o
    autocmd FileType nerdtree nmap <buffer> <C-n> j
    autocmd FileType nerdtree nmap <buffer> <C-p> k
augroup END

augroup filetypes
  autocmd BufRead,BufNewFile Dockerfile* setfiletype dockerfile
  autocmd BufRead,BufNewFile *php_cs*    setfiletype php
  autocmd BufRead,BufNewFile *zshrc      setfiletype zsh
  autocmd BufRead,BufNewFile *zsh        setfiletype zsh
  autocmd BufRead,BufNewFile *.mjs       setfiletype javascript
  autocmd BufRead,BufNewFile *.csv       setfiletype csv
  autocmd BufRead,BufNewFile .env*       setfiletype sh
  autocmd BufWritePre        * :%s/\s\+$//ge
  autocmd BufWritePre        * :%s/\r//ge
augroup END

augroup indentsize
  autocmd FileType sh         setlocal shiftwidth=2 tabstop=2
  autocmd FileType vue        setlocal shiftwidth=2 tabstop=2
  autocmd FileType blade      setlocal shiftwidth=2 tabstop=2
  autocmd FileType yaml       setlocal shiftwidth=2 tabstop=2
  autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
  autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
  autocmd FileType json       setlocal shiftwidth=2 tabstop=2
  autocmd FileType html       setlocal shiftwidth=2 tabstop=2
  autocmd FileType go         setlocal shiftwidth=4 tabstop=4 noexpandtab
  autocmd FileType vim        setlocal shiftwidth=2 tabstop=2
  autocmd FileType python     setlocal shiftwidth=4 tabstop=4
  autocmd FileType c          setlocal shiftwidth=4 tabstop=4
  autocmd FileType make       setlocal shiftwidth=4 tabstop=4 noexpandtab
  autocmd FileType markdown   setlocal shiftwidth=2 tabstop=2 conceallevel=0
  autocmd FileType gitconfig  setlocal noexpandtab
augroup END

if $WSL_DISTRO_NAME != ""
    let g:clipboard = {
        \   'name': 'myClipboard',
        \   'copy': {
        \      '+': 'win32yank.exe -i',
        \      '*': 'win32yank.exe -i',
        \    },
        \   'paste': {
        \      '+': 'win32yank.exe -o',
        \      '*': 'win32yank.exe -o',
        \   },
        \   'cache_enabled': 1,
        \ }
endif

if exists('$VIRTUAL_ENV')
  let g:python3_host_prog=$VIRTUAL_ENV.'/bin/python'
else
  let g:python3_host_prog=sort(split(glob($PYENV_ROOT.'/versions/3*/bin/python')))[-1]
endif
]]

vim.cmd [[packadd packer.nvim]]
vim.cmd [[colorscheme material]]

return require('packer').startup(function(use)
  use 'plasticboy/vim-markdown'
  vim.g.vim_markdown_conceal = 0
  vim.g.vim_markdown_folding_disabled = 1

  use 'cohama/lexima.vim'

  use 'kaicataldo/material.vim'
  vim.g.material_terminal_italics = 0
  vim.g.material_theme_style = 'palenight'

  use 'buoto/gotests-vim'

  use 'fatih/vim-go'
  vim.g.go_highlight_methods = 1
  vim.g.go_highlight_structs = 1
  vim.g.go_highlight_operators = 1
  vim.g.go_highlight_functions = 1
  vim.g.go_highlight_function_parameters = 1
  vim.g.go_highlight_function_arguments = 1
  vim.g.go_highlight_function_calls = 1
  vim.g.go_highlight_types = 1
  vim.g.go_highlight_fields = 1
  vim.g.go_highlight_variable_declarations = 1
  vim.g.go_highlight_variable_assignments = 1

  vim.g.go_echo_command_info = 0
  vim.g.go_def_mapping_enabled = 0
  vim.g.go_gocode_propose_builtins = 0
  vim.g.go_echo_go_info = 0

  vim.g.go_diagnostics_enabled = 0
  vim.g.go_metalinter_autosave = 0

  vim.g.go_fmt_autosave = 0
  vim.g.go_term_height = 15
  vim.g.go_term_mode = 'on | belowright split'
  vim.g.go_term_enabled = 0

  vim.cmd [[
        function! s:vim_go_keymap()
            nnoremap <buffer><silent> <Leader><C-r> :GoRun<CR>
            nnoremap <buffer><silent> <Leader>rt :GoTestFunc<CR>
            nnoremap <buffer><silent> <F5> :GoDebugContinue<CR>
            nnoremap <buffer><silent> <F6> :GoDebugPrint<CR>
            nnoremap <buffer><silent> <F9> :GoDebugBreakpoint<CR>
            nnoremap <buffer><silent> <F10> :GoDebugNext<CR>
            nnoremap <buffer><silent> <F11> :GoDebugStep<CR>
            nnoremap <buffer><silent> <F12> :GoDebugStop<CR>
        endfunction

        augroup vim_go_hook_add
            autocmd FileType go :call s:vim_go_keymap()
        augroup END
      ]]

  use 'terryma/vim-multiple-cursors'

  use 'osyo-manga/vim-over'
  api.nvim_set_keymap("n", "<Leader>o", ":OverCommandLine<CR>", { noremap = true, silent = true })

  use 'terryma/vim-expand-region'
  api.nvim_set_keymap("v", "v", "<Plug>(expand_region_expand)", { noremap = true, silent = true })
  api.nvim_set_keymap("v", "<C-v>", "<Plug>(expand_region_shrink)", { noremap = true, silent = true })

  use 'sheerun/vim-polyglot'
  vim.g.vim_json_syntax_conceal = 0

  use 'tpope/vim-fugitive'

  use 'deris/vim-shot-f'

  use 'machakann/vim-highlightedyank'

  use 'simeji/winresizer'
  vim.g.winresizer_vert_resize = 1
  vim.g.winresizer_horiz_resize = 1

  use 'Yggdroot/indentLine'
  vim.g.indentLine_showFirstIndentLevel = 1
  vim.g.indentLine_bufNameExclude = "_.*"
  vim.g.indentLine_bufTypeExluce = "help,terminal"
  vim.g.indentLine_fileTypeExluce = "help"
  vim.g.indentLine_color_term = 238
  vim.g.indentLine_color_gui = '#676767'
  vim.g.indentLine_setConceal = 0

  use 'andymass/vim-matchup'
  vim.g.loaded_matchit = 1

  use 'tpope/vim-surround'

  use 'easymotion/vim-easymotion'
  api.nvim_set_keymap("n", "<Leader>", "<Plug>(easymotion-prefix)", { noremap = true, silent = true })

  use 'junegunn/vim-easy-align'
  api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", { noremap = true, silent = true })
  api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", { noremap = true, silent = true })
  vim.cmd "let g:easy_align_ignore_groups = []"

end)

--     Plug 'tomtom/tcomment_vim'
--         vnoremap ? :'<,'>TComment<CR>
--
--     Plug 'previm/previm'
--       if system('uname -a | grep microsoft') != ""
--         let g:previm_open_cmd = '/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe'
--         let g:previm_wsl_mode = 1
--       endif
--
--     Plug 'tyru/open-browser.vim'
--
--     Plug 'ctrlpvim/ctrlp.vim'
--       let g:ctrlp_map = '<C-p>'
--       let g:ctrlp_cmd = 'CtrlP'
--       let g:ctrlp_working_path_mode = 'ra'
--       let g:ctrlp_custom_ignore = {
--         \ 'dir':  '\v[\/]\.(git|hg|svn)$|node_modules',
--         \ 'file': '\v\.(exe|so|dll)$',
--         \ 'link': 'some_bad_symbolic_links',
--         \ }
--     Plug 'mattn/ctrlp-matchfuzzy'
--       let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}
--
--     Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
--     Plug 'junegunn/fzf.vim'
--       command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
--       command! -bang -nargs=? -complete=dir GFiles call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
--       command! -bang -nargs=* Rg
--           \ call fzf#vim#grep(
--           \ 'rg --column --line-number --hidden --smart-case --no-heading --color=always '.shellescape(<q-args>), 1,
--           \ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
--           \         : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
--           \ <bang>0)
--       let g:fzf_layout = { 'down': '~40%' }
--       nnoremap <silent> <Leader>p :GFiles<CR>
--       nnoremap <silent> <Leader>f m:Files<CR>
--       nnoremap <silent> <Leader>g :Rg<CR>
--       " nnoremap <silent> <Leader>b :Buffers<CR>
--       " nnoremap <silent> <Leader>x :Commands<CR>
--
--     Plug 'rhysd/git-messenger.vim'
--       nmap <Leader>gm <Plug>(git-messenger)
--       let g:git_messenger_include_diff = 'current'
--       let g:git_messenger_always_into_popup = v:true
--       let g:git_messenger_into_popup_after_show = v:true
--
--     Plug 'mattn/emmet-vim'
--
--     Plug 'mechatroner/rainbow_csv', { 'for': 'csv' }
--       let g:rainbow_active = 0
--       let g:rainbow_conf = {
--                   \    'guifgs': ['darkorange2', 'orchid3', 'seagreen3'],
--                   \   'separately': {
--                   \       'nerdtree': 0,
--                   \   },
--                   \ }
--
--     Plug 'plasticboy/vim-markdown', {'for' : ['markdown','mkd']}
--       let g:vim_markdown_conceal = 0
--       let g:vim_markdown_folding_disabled = 1
--
--     Plug 'cohama/lexima.vim'
--     Plug 'prabirshrestha/vim-lsp'
--     Plug 'mattn/vim-lsp-settings'
--     Plug 'prabirshrestha/async.vim'
--     Plug 'prabirshrestha/asyncomplete.vim'
--     Plug 'prabirshrestha/asyncomplete-lsp.vim'
--     Plug 'SirVer/ultisnips'
--     Plug 'thomasfaingnaert/vim-lsp-snippets'
--     Plug 'thomasfaingnaert/vim-lsp-ultisnips'
--       inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
--       inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
--       inoremap <expr> <CR>    pumvisible() ? asyncomplete#close_popup() : "\<CR>"
--       let g:lsp_settings = {
--             \  'efm-langserver': {
--             \    'disabled': v:false
--             \  },
--             \  'pyls-all': {
--             \    'disabled': v:true
--             \  },
--             \  'pyls': {
--             \    'disabled': v:true
--             \  },
--             \  'pyls-ms': {
--             \    'disabled': v:true
--             \  },
--             \  'jedi-language-server': {
--             \    'disabled': v:true
--             \  },
--             \  'zls': {
--             \    'zip_lib_path': '/usr/loca/zig/lib',
--             \    'zip_exe_path': '/usr/loca/zig/zig'
--             \  }
--             \}
--
--       let g:lsp_diagnostics_enabled = 1
--       let g:lsp_diagnostics_echo_cursor = 1
--       let g:lsp_diagnostics_float_cursor = 0
--       let g:lsp_diagnostics_float_delay = 200
--       let g:lsp_settings_filetype_python = "pyright-langserver"
--       let g:UltiSnipsExpandTrigger="<tab>"
--       let g:UltiSnipsJumpForwardTrigger="<tab>"
--       let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
--
--       function! s:on_lsp_buffer_enabled() abort
--           setlocal omnifunc=lsp#complete
--           setlocal signcolumn=yes
--           if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
--           nmap <buffer> gd <plug>(lsp-definition)
--           nmap <buffer> gr <plug>(lsp-references)
--           nmap <buffer> gi <plug>(lsp-implementation)
--           nmap <buffer> gt <plug>(lsp-type-definition)
--           nmap <buffer> <leader>rn <plug>(lsp-rename)
--           nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
--           nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
--           nmap <buffer> K <plug>(lsp-hover)
--           nmap <buffer> <C-l><C-l> <plug>(lsp-document-diagnostics)
--           let g:lsp_format_sync_timeout = 1000
--           autocmd! BufWritePre *.rs,*.go,*.py,*.c,*.ts,*.js call execute('LspDocumentFormatSync')
--       endfunction
--
--       augroup lsp_install
--           au!
--           " call s:on_lsp_buffer_enabled only for languages that has the server registered.
--           autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
--       augroup END
-- call plug#end()
