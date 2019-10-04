set encoding=utf-8
scriptencoding utf-8
set completeopt+=noselect
" set virtualedit=block
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
set clipboard^=unnamedplus
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

""""" [表示系]
set number                      " 行番号の表示
set nowrap                      " 長いテキストの折り返し
set textwidth=0                 " 自動的に改行が入るのを無効化
" set colorcolumn=80,120              " その代わり80文字目にラインを入れる
set t_vb=
set novisualbell                " 前時代的スクリーンベルを無効化
set display=lastline

set softtabstop=0
set showtabline=2               " 常にタブラインを表示
set laststatus=2
set whichwrap=b,s,<,>,[,]       " wrapするカッコ一覧
set list                        " 不可視文字の可視化
set listchars=tab:\|\ ,trail:￭,extends:❯,precedes:❮ ",nbsp:%,eol:￭¬↲ "不可視文字をUnicodeにする
set ttimeout
set ttimeoutlen=10
set scrolloff=5                 " 3行残して画面スクロールする
set shell=zsh
" set cursorline

set ambiwidth=double
set termguicolors

if exists('$TMUX')
    " tmux
elseif $TERM_PROGRAM ==? 'hyper'
    " hyper
else
    " hoge
endif

" set iminsert=0
" set imsearch=0
set lazyredraw
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
"noremap   h <nop>
"noremap   l <nop>
tnoremap <C-j><C-j> <C-\><C-n>

inoremap  <C-l> <DEL>
nnoremap  <C-k> {
nnoremap  <C-j> }
""""" command """""
" よく押し間違えるので
command! Q :q
command! W :w
command! Wq :wq
command! WQ :wq

set wildoptions=pum
set winblend=10
set pumblend=10
set pumheight=15

"""""" Coc Extensions """"""
let g:coc_global_extensions = [
            \ 'coc-css',
            \ 'coc-emmet',
            \ 'coc-eslint',
            \ 'coc-git',
            \ 'coc-highlight',
            \ 'coc-html',
            \ 'coc-java',
            \ 'coc-jest',
            \ 'coc-json',
            \ 'coc-phpls',
            \ 'coc-prettier',
            \ 'coc-python',
            \ 'coc-rls',
            \ 'coc-snippets',
            \ 'coc-solargraph',
            \ 'coc-stylelint',
            \ 'coc-tsserver',
            \ 'coc-vetur',
            \ 'coc-vimlsp',
            \ 'coc-wxml',
            \ 'coc-xml',
            \ 'coc-yaml',
            \ 'coc-yank',
            \ ]

"""""" dein (load plugins)"""""
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" もし設定のキャッシュファイルを読み込めなかったら
" tomlファイルを再読み込みする
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir) " 設定開始

    " プラグインリストを収めた TOML ファイル
    " 予め TOML ファイル（後述）を用意しておく
    let g:rc_dir = expand('~/.vim/rc')
    let s:dein_toml = g:rc_dir . '/dein.toml'
    let s:lazy_dein_toml = g:rc_dir . '/lazy_dein.toml'

    " TOML を読み込み、キャッシュしておく
    call dein#load_toml(s:dein_toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_dein_toml, {'lazy': 1})

    call dein#end() " 設定終了
    call dein#save_state() " キャッシュ保存
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
    call dein#install()
endif
" 最新のpythonをhostにする
if exists('$VIRTUAL_ENV')
    let g:python_host_prog=sort(split(glob($PYENV_ROOT.'/versions/2.7*/bin/python')))[-1]
    let g:python3_host_prog=$VIRTUAL_ENV.'/bin/python'
else
    let g:python_host_prog=sort(split(glob($PYENV_ROOT.'/versions/2.7*/bin/python')))[-1]
    let g:python3_host_prog=sort(split(glob($PYENV_ROOT.'/versions/3*/bin/python')))[-1]
endif

augroup autoreload
    set autoread
    autocmd FocusLost,FocusGained,CursorMoved,CursorMovedI,CursorHold,CursorHoldI  * silent! checktime
augroup END

augroup filetypes
    autocmd BufRead,BufNewFile Dockerfile* setfiletype dockerfile
    autocmd BufRead,BufNewFile *php_cs*    setfiletype php
    autocmd BufRead,BufNewFile *zshrc      setfiletype sh
    autocmd BufRead,BufNewFile *.mjs       setfiletype javascript
    autocmd BufRead,BufNewFile *.csv       setfiletype csv
    autocmd BufRead,BufNewFile .env*       setfiletype sh
    autocmd BufWritePre        * :%s/\s\+$//ge
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
    autocmd FileType json       setlocal shiftwidth=2 tabstop=2 conceallevel=0
    autocmd FileType html       setlocal shiftwidth=2 tabstop=2
    autocmd FileType go         setlocal shiftwidth=4 tabstop=4 noexpandtab
    autocmd FileType vim        setlocal shiftwidth=4 tabstop=4
    autocmd FileType python     setlocal shiftwidth=4 tabstop=4
    autocmd FileType make       setlocal shiftwidth=4 tabstop=4 noexpandtab
    autocmd FileType gitconfig  setlocal noexpandtab
augroup END

" ファイルタイププラグインおよびインデントを有効化
set background=dark
syntax on
try
  " colorscheme dracula
  " colorscheme spring-night
  colorscheme material
catch
endtry

hi! clear ALEErrorSignLineNr
hi! clear ALEWarningSignLineNr
hi! clear ALEInfoSignLineNr
hi! clear ALEStyleErrorSignLineNr
hi! clear ALEStyleWarningSignLineNr

hi! MatchParen guibg=#555555 guifg=NONE gui=bold
hi! Visual guibg=#888888 guifg=NONE
hi! SpecialKey ctermfg=239 ctermbg=NONE
hi! clear LineNr
hi! clear SignColumn
hi! Normal guibg=none ctermbg=none
hi! NormalFloat    guibg=#334455 guifg=#fffeeb gui=NONE      ctermfg=235  ctermbg=230  cterm=NONE
hi! CursorLine     guibg=NONE    guifg=NONE    gui=underline ctermbg=NONE ctermfg=NONE cterm=underline
hi! ALEWarning     guibg=NONE    guifg=NONE    gui=underline ctermbg=NONE ctermfg=NONE cterm=underline
hi! ALEError       guibg=NONE    guifg=NONE    gui=underline ctermbg=NONE ctermfg=NONE cterm=underline
hi! ALEErrorSign   guibg=#FF5555 guifg=#fffeeb gui=NONE      ctermbg=207  ctermfg=NONE cterm=NONE
hi! ALEWarningSign guibg=#11AF33 guifg=#fffeeb gui=NONE      ctermbg=119  ctermfg=NONE cterm=NONE
hi! CursorIM       guibg=#af00af guifg=#000000 gui=NONE      ctermbg=127  ctermfg=16   cterm=NONE
hi! HighlightedyankRegion cterm=reverse gui=reverse

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

filetype plugin indent on
