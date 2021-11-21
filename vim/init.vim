set encoding=utf-8
scriptencoding utf-8
set completeopt+=noselect
"
""""" [検索系]
set ignorecase                  " 大文字小文字を区別しない
set smartcase                   " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch                   " インクリメンタルサーチ
set hlsearch                    " 検索マッチテキストをハイライト

""""" [編集系]
set hidden                      " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen           " 新しく開く代わりにすでに開いてあるバッファを開く
set showmatch                   " 対応する括弧などをハイライト表示する
set matchtime=2                 " 対応括弧のハイライト表示を3秒にする
set nowritebackup               " Backupを無効化
set nobackup                    " Backupを無効化
set noswapfile                  " swapを無効化
set backspace=0
" set backspace=indent,eol,start  " バックスペースでなんでも消せるようにする

set clipboard&
set clipboard^=unnamedplus,unnamed
set updatetime=500
set shortmess+=c
set signcolumn=yes

""""" [表示系]
set number                      " 行番号の表示
set nowrap                      " 長いテキストの折り返し
set textwidth=0                 " 自動的に改行が入るのを無効化
" set colorcolumn=80,120              " その代わり80文字目にラインを入れる
set t_vb=
set novisualbell                " 前時代的スクリーンベルを無効化
set visualbell t_vb=
set display=lastline
set softtabstop=0
set showtabline=0               " 常にタブラインを表示
set laststatus=2
set cmdheight=1
set whichwrap=b,s,<,>,[,]       " wrapするカッコ一覧
set list                        " 不可視文字の可視化
set listchars=tab:\|\ ,trail:￭,extends:❯,precedes:❮ ",nbsp:%,eol:￭¬↲ "不可視文字をUnicodeにする
set ttimeout
set ttimeoutlen=10
set scrolloff=10                 " 3行残して画面スクロールする
set shell=zsh
" set cursorline
set noequalalways
"set lazyredraw
set ttyfast
set ambiwidth=double
set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

if exists('$TMUX')
    " tmux
elseif $TERM_PROGRAM ==? 'hyper'
    " hyper
else
    " hoge
endif

" set iminsert=0
" set imsearch=0
" set lazyredraw
let mapleader = "\<Space>"

"---------------------------------------------------------------------------"
" Commands \ Modes | Normal | Insert | Command | Visual | Select | Operator |
"------------------|--------|--------|---------|--------|--------|----------|
" map  / noremap   |    @   |   -    |    -    |   @    |   @    |    @     |
" nmap / nnoremap  |    @   |   -    |    -    |   -    |   -    |    -     |
" vmap / vnoremap  |    -   |   -    |    -    |   @    |   @    |    -     |
" omap / onoremap  |    -   |   -    |    -    |   -    |   -    |    @     |
" xmap / xnoremap  |    -   |   -    |    -    |   @    |   -    |    -     |
" smap / snoremap  |    -   |   -    |    -    |   -    |   @    |    -     |
" map! / noremap!  |    -   |   @    |    @    |   -    |   -    |    -     |
" imap / inoremap  |    -   |   @    |    -    |   -    |   -    |    -     |
" cmap / cnoremap  |    -   |   -    |    @    |   -    |   -    |    -     |
"---------------------------------------------------------------------------"
"
""""" key remap
nnoremap <silent> <ESC><ESC> :noh<CR>
nnoremap <silent> <M-p> :bp<CR>
nnoremap <silent> <M-n> :bn<CR>
nnoremap <silent> <M-d> :bd<CR>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <silent> j gj
nnoremap <silent> k gk

" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" vim strict mode
vnoremap  <C-c>    <nop>
vnoremap  <Up>     <nop>
vnoremap  <Down>   <nop>
vnoremap  <Left>   <nop>
vnoremap  <Right>  <nop>
inoremap  <C-c>    <nop>
inoremap  <Up>     <nop>
inoremap  <Down>   <nop>
inoremap  <Left>   <nop>
inoremap  <Right>  <nop>
" inoremap  <BS>     <nop>
noremap   <C-c>    <nop>
noremap   <Up>     <nop>
noremap   <Down>   <nop>
noremap   <Left>   <nop>
noremap   <Right>  <nop>
nmap      <C-[>    <nop>
nmap      <Esc>    <nop>

"noremap   h <nop>
"noremap   l <nop>
tnoremap <C-j><C-j> <C-\><C-n>

imap  <C-h> <BS>
imap  <C-l> <DEL>
nnoremap  <C-k> {
nnoremap  <C-j> }
""""" command """""
" よく押し間違えるので
command! Q :q
command! W :w
command! Wq :wq
command! WQ :wq
command! Term :bo terminal

" ファイルツリーの表示形式、1にするとls -laのような表示になります
let g:netrw_liststyle=1
" ヘッダを非表示にする
let g:netrw_banner=0
" サイズを(K,M,G)で表示する
let g:netrw_sizestyle="H"
" 日付フォーマットを yyyy/mm/dd(曜日) hh:mm:ss で表示する
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"
" プレビューウィンドウを垂直分割で表示する
let g:netrw_preview=1
if has('terminal')
  function! s:set_default_ansi_colors() abort
    if exists('g:terminal_ansi_colors')
      return
    endif

    let g:terminal_ansi_colors = [
      \ "#073642", "#c50f1f", "#13a10e", "#c19c00",
      \ "#3399ff", "#881798", "#3a96dd", "#cccccc",
      \ "#989898", "#e74856", "#16c60c", "#eadf84",
      \ "#3b78ff", "#b4009e", "#61d6d6", "#e8e8e8"
      \ ]
  endfunction
  call s:set_default_ansi_colors()

  augroup vimrc
    autocmd ColorScheme * call s:set_default_ansi_colors()
  augroup END
endif

augroup autoreload
  set autoread
  autocmd FocusLost,FocusGained,CursorMoved,CursorMovedI,CursorHold,CursorHoldI  * silent! checktime
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

set expandtab                   " タブをスペースにする
set tabstop=2
set shiftwidth=2
set conceallevel=2
set concealcursor=nc
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

if has('nvim')
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
    let g:python_host_prog=sort(split(glob($PYENV_ROOT.'/versions/2.7*/bin/python')))[-1]
    let g:python3_host_prog=$VIRTUAL_ENV.'/bin/python'
  else
    let g:python_host_prog=sort(split(glob($PYENV_ROOT.'/versions/2.7*/bin/python')))[-1]
    let g:python3_host_prog=sort(split(glob($PYENV_ROOT.'/versions/3*/bin/python')))[-1]
  endif

  let s:vim_plug_root = '~/.cache/nvim/plugged'
  let s:vim_plug_plugins = '~/.cache/nvim/plugins'
  set rtp+=~/.cache/nvim/plugged/vim-plug
  set rtp+=~/.cache/nvim/plugins
else
  if $WSL_DISTRO_NAME != ""
    augroup Yank
      au!
      autocmd TextYankPost * :call system('win32yank.exe -i', @")
    augroup END
    noremap <silent> p :call setreg('"',system('win32yank.exe -o'))<CR>""p
  endif

  let s:vim_plug_root = '~/.cache/vim/plugged'
  let s:vim_plug_plugins = '~/.cache/vim/plugins'
  set rtp+=~/.cache/vim/plugged/vim-plug
  set rtp+=~/.cache/vim/plugins
endif

if !isdirectory(expand(s:vim_plug_plugins))
  call system('mkdir -p ' . s:vim_plug_plugins)
endif

if !isdirectory(expand(s:vim_plug_root))
  echo 'install vim-plug...'
  call system('mkdir -p ' . s:vim_plug_root . 'vim-plug')
  call system('git clone https://github.com/junegunn/vim-plug.git ' . s:vim_plug_root . '/vim-plug/autoload')
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(s:vim_plug_plugins)
    Plug 'kaicataldo/material.vim' " , { 'branch': 'master' }
      let g:material_terminal_italics = 0
      let g:material_theme_style = 'palenight'

    Plug 'itchyny/lightline.vim'
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

    Plug 'buoto/gotests-vim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
      let g:go_highlight_methods = 1
      let g:go_highlight_structs = 1
      let g:go_highlight_operators = 1
      let g:go_highlight_functions = 1
      let g:go_highlight_function_parameters = 1
      let g:go_highlight_function_arguments = 1
      let g:go_highlight_function_calls = 1
      let g:go_highlight_types = 1
      let g:go_highlight_fields = 1
      let g:go_highlight_variable_declarations = 1
      let g:go_highlight_variable_assignments = 1

      let g:go_echo_command_info = 0
      let g:go_def_mapping_enabled = 0
      let g:go_gocode_propose_builtins = 0
      let g:go_echo_go_info = 0

      let g:go_diagnostics_enabled = 0
      let g:go_metalinter_autosave = 0

      "" format ""
      let g:go_fmt_autosave = 0
      let g:go_term_height = 15
      let g:go_term_mode = 'on | belowright split'
      let g:go_term_enabled = 0

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

    Plug 'honza/vim-snippets'

    Plug 'liuchengxu/vista.vim'
      nmap <silent> <C-f><C-v> :<C-u>Vista vim_lsp<CR>
      let g:vista_close_on_jump = 1
      let g:vista_icon_indent = ['`-> ', '|-> ']
      let g:vista#renderer#enable_icon = 0
      let g:vista#renderer#icons = {
                  \   'function': 'func',
                  \   'variable': 'var',
                  \   'field': 'field',
                  \   'struct': 'struct',
                  \   'constant': 'const',
                  \  }

    Plug 'terryma/vim-multiple-cursors'

    Plug 'osyo-manga/vim-over'
      nnoremap <silent> <Leader>o :OverCommandLine<CR>

    Plug 'terryma/vim-expand-region'
      vmap v <Plug>(expand_region_expand)
      vmap <C-v> <Plug>(expand_region_shrink)

    Plug 'sheerun/vim-polyglot'
      if has("nvim")
        let g:polyglot_disabled = ['python']
      endif
      let g:vim_json_syntax_conceal = 0

    Plug 'tpope/vim-fugitive'

    Plug 'scrooloose/nerdtree'
      nmap <silent><Leader>n :NERDTreeToggle<CR>
      nmap <silent><Leader>h :NERDTreeFind<CR>
      let g:NERDTreeWinSize = 35
      let g:NERDTreeLimitedSyntax = 1
      let g:NERDTreeQuitOnOpen = 0
      augroup nerdtree_hook_add
          autocmd FileType nerdtree nmap <buffer> l o
          autocmd FileType nerdtree nmap <buffer> <C-0> o
          autocmd FileType nerdtree nmap <buffer> <C-n> j
          autocmd FileType nerdtree nmap <buffer> <C-p> k
      augroup END

    Plug 'rhysd/vim-color-spring-night'
      let g:spring_night_kill_italic = 1
      let g:spring_night_high_contrast = 1

    Plug 'deris/vim-shot-f'

    Plug 'machakann/vim-highlightedyank'

    Plug 'simeji/winresizer'
      let g:winresizer_vert_resize = 1
      let g:winresizer_horiz_resize = 1

    Plug 'Yggdroot/indentLine'
      let g:indentLine_showFirstIndentLevel = 1
      let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*', '_defx.*']
      let g:indentLine_bufTypeExluce = ['help', 'nerdtree', 'defx', 'terminal']
      let g:indentLine_fileTypeExluce = ['help', 'nerdtree', 'defx']
      let g:indentLine_color_term = 238
      let g:indentLine_color_gui = '#676767'
      let g:indentLine_setConceal = 0

    Plug 'andymass/vim-matchup'
      let g:loaded_matchit = 1

    Plug 'tpope/vim-surround'

    Plug 'junegunn/vim-easy-align'
      nmap ga <Plug>(EasyAlign)
      xmap ga <Plug>(EasyAlign)
      let g:easy_align_ignore_groups = []

    Plug 'tomtom/tcomment_vim'
        vnoremap ? :'<,'>TComment<CR>

    Plug 'previm/previm'
      if system('uname -a | grep microsoft') != ""
        let g:previm_open_cmd = '/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe'
        let g:previm_wsl_mode = 1
      endif

    Plug 'tyru/open-browser.vim'

    Plug 'ctrlpvim/ctrlp.vim'
      let g:ctrlp_map = '<c-p>'
      let g:ctrlp_cmd = 'CtrlP'
      let g:ctrlp_working_path_mode = 'ra'
      let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn)$|node_modules',
        \ 'file': '\v\.(exe|so|dll)$',
        \ 'link': 'some_bad_symbolic_links',
        \ }

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
      command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
      command! -bang -nargs=? -complete=dir GFiles call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
      command! -bang -nargs=* Rg
          \ call fzf#vim#grep(
          \ 'rg --column --line-number --hidden --smart-case --no-heading --color=always '.shellescape(<q-args>), 1,
          \ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
          \         : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
          \ <bang>0)
      let g:fzf_layout = { 'down': '~40%' }
      " let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
      " let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo' } }
      " let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo', 'border': 'sharp' } }
      nnoremap <silent> <Leader>p :GFiles<CR>
      nnoremap <silent> <Leader>f m:Files<CR>
      nnoremap <silent> <Leader>g :Rg<CR>
      " nnoremap <silent> <Leader>b :Buffers<CR>
      " nnoremap <silent> <Leader>x :Commands<CR>

    Plug 'rhysd/git-messenger.vim'
      nmap <Leader>gm <Plug>(git-messenger)
      let g:git_messenger_include_diff = 'current'
      let g:git_messenger_always_into_popup = v:true
      let g:git_messenger_into_popup_after_show = v:true

    Plug 'mattn/emmet-vim'

    Plug 'mechatroner/rainbow_csv', { 'for': 'csv' }
      let g:rainbow_active = 0
      let g:rainbow_conf = {
                  \    'guifgs': ['darkorange2', 'orchid3', 'seagreen3'],
                  \   'separately': {
                  \       'nerdtree': 0,
                  \   },
                  \ }

    Plug 'plasticboy/vim-markdown', {'for' : ['markdown','mkd']}
      let g:vim_markdown_conceal = 0
      let g:vim_markdown_folding_disabled = 1

    Plug 'cohama/lexima.vim'
    " Plug 'jiangmiao/auto-pairs'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    " Plug 'thomasfaingnaert/vim-lsp-snippets'
    " Plug 'thomasfaingnaert/vim-lsp-ultisnips'
      inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
      inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
      inoremap <expr> <CR>    pumvisible() ? asyncomplete#close_popup() : "\<CR>"
      let g:lsp_settings = {
            \  'efm-langserver': {
            \    'disabled': v:false
            \  },
            \  'pyls-all': {
            \    'disabled': v:true
            \  },
            \  'pyls': {
            \    'disabled': v:true
            \  },
            \  'pyls-ms': {
            \    'disabled': v:true
            \  },
            \  'jedi-language-server': {
            \    'disabled': v:true
            \  }
            \}
            " \  'pyls-all': {
            " \    'workspace_config': {
            " \      'pyls': {
            " \        'configurationSources': ['flake8','pydocstyle', 'mypy']
            " \      }
            " \    }
            " \  },
            " \}
      let g:lsp_diagnostics_enabled = 1
      let g:lsp_diagnostics_echo_cursor = 1
      let g:lsp_diagnostics_float_cursor = 1
      let g:lsp_diagnostics_float_delay = 200
      let g:lsp_settings_filetype_python = "pyright-langserver"

      function! s:on_lsp_buffer_enabled() abort
          setlocal omnifunc=lsp#complete
          setlocal signcolumn=yes
          if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
          nmap <buffer> gd <plug>(lsp-definition)
          nmap <buffer> gr <plug>(lsp-references)
          nmap <buffer> gi <plug>(lsp-implementation)
          nmap <buffer> gt <plug>(lsp-type-definition)
          nmap <buffer> <leader>rn <plug>(lsp-rename)
          nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
          nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
          nmap <buffer> K <plug>(lsp-hover)
          nmap <buffer> <C-l><C-l> <plug>(lsp-document-diagnostics)
          let g:lsp_format_sync_timeout = 1000
          autocmd! BufWritePre *.rs,*.go,*.py,*.c,*.ts,*.js call execute('LspDocumentFormatSync')
      endfunction

      augroup lsp_install
          au!
          " call s:on_lsp_buffer_enabled only for languages that has the server registered.
          autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
      augroup END

call plug#end()


" ファイルタイププラグインおよびインデントを有効化
syntax on
try
  " colorscheme dracula
  " colorscheme spring-night
  colorscheme material
catch
endtry

hi! MatchParen guibg=#555555 guifg=NONE gui=bold
hi! Visual guibg=#888888 guifg=NONE
hi! SpecialKey ctermfg=239 ctermbg=NONE
hi! clear LineNr
hi! clear SignColumn

hi! Normal guibg=NONE ctermbg=NONE

if has('nvim')
  hi! NormalFloat    guibg=#334455 guifg=#fffeeb gui=NONE      ctermfg=235  ctermbg=230  cterm=NONE
endif

hi! Terminal       guibg=#323232 guifg=#fffeeb gui=NONE      ctermfg=235  ctermbg=230  cterm=NONE
hi! CursorLine     guibg=NONE    guifg=NONE    gui=underline ctermbg=NONE ctermfg=NONE cterm=underline
hi! CursorIM       guibg=#af00af guifg=#000000 gui=NONE      ctermbg=127  ctermfg=16   cterm=NONE
hi! HighlightedyankRegion cterm=reverse gui=reverse

autocmd FileType * call <SID>def_base_syntax() " autocmd Syntax may be better

function! s:def_base_syntax()
  " Simple example
  autocmd FileType python syntax match commonOperator "\(+\|=\|-\|\^\|\*\)"
  autocmd FileType python syntax match baseDelimiter "\(,\|\.\)"
  autocmd FileType python hi link commonOperator Operator
  autocmd FileType python hi link baseDelimiter Special
endfunction

function! PhpSyntaxOverride()
    syn match phpPropExt "@\%(property-read\|property-write\)" containedin=phpDocComment nextgroup=phpDocParam,phpDocIdentifier skipwhite contained
    hi! link phpDocTags phpPropExt
    hi! link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END

augroup syntaxFromStart
    autocmd FileType vue :syntax sync fromstart
augroup END


if has('multi_byte_ime')
  highlight Cursor guifg=NONE guibg=Green
  highlight CursorIM guifg=NONE guibg=Purple
endif

filetype plugin indent on
