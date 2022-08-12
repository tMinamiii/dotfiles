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
opt.listchars:append({ tab = [[\|\]], trail = "￭", extends = "❯", precedes = "❮" })
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
local api = vim.api
vim.g["&t_8f"] = [[\<Esc>[38;2;%lu;%lu;%lum]]
vim.g["&t_8b"] = [[\<Esc>[48;2;%lu;%lu;%lum]]
vim.g["&t_ti."] = [[\e[1 q]]
vim.g["&t_SI."] = [[\e[5 q]]
vim.g["&t_EI."] = [[\e[1 q]]
vim.g["&t_te."] = [[\e[0 q]]
vim.g.mapleader = [[\<Space>]]

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

--
-- " バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
api.nvim_set_keymap("v", "/", [[getcmdtype() == '/' ? '\/' : '/']], { expr = true, noremap = true })
api.nvim_set_keymap("v", "?", [[getcmdtype() == '?' ? '\?' : '?']], { expr = true, noremap = true })

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

api.nvim_set_keymap("n", "<C-c>", "<nop>", { noremap = true })
api.nvim_set_keymap("n", "<Up>", "<nop>", { noremap = true })
api.nvim_set_keymap("n", "<Down>", "<nop>", { noremap = true })
api.nvim_set_keymap("n", "<Left>", "<nop>", { noremap = true })
api.nvim_set_keymap("n", "<Right>", "<nop>", { noremap = true })
api.nvim_set_keymap("n", "<C-[>", "<nop>", { noremap = true })
api.nvim_set_keymap("n", "<Esc>", "<nop>", { noremap = true })
api.nvim_set_keymap("i", "<C-h>", "<BS>", { noremap = true })
api.nvim_set_keymap("i", "<C-l>", "<DEL>", { noremap = true })
api.nvim_set_keymap("t", "<C-j><C-j>", [[<C-\><C-n>]], { noremap = true })

-- よく押し間違えるので
--[[
  command! Q :q
  command! W :w
  command! Wq :wq
  command! WQ :wq
  command! Term :bo terminal ++rows=20
]]

-- " ファイルツリーの表示形式、1にするとls -laのような表示になります
vim.g.netrw_liststyle = 1
-- " ヘッダを非表示にする
vim.g.netrw_banner = 0
-- " サイズを(K,M,G)で表示する
vim.g.netrw_sizestyle = "H"
-- " 日付フォーマットを yyyy/mm/dd(曜日) hh:mm:ss で表示する
vim.g.netrw_timefmt = "%Y/%m/%d(%a) %H:%M:%S"
-- " プレビューウィンドウを垂直分割で表示する
vim.g.netrw_preview = 1

--[[
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
]]
--
-- "if exists('$VIRTUAL_ENV')
-- "  let g:python_host_prog=sort(split(glob($PYENV_ROOT.'/versions/2.7*/bin/python')))[-1]
-- "  let g:python3_host_prog=$VIRTUAL_ENV.'/bin/python'
-- "else
-- "  let g:python_host_prog=sort(split(glob($PYENV_ROOT.'/versions/2.7*/bin/python')))[-1]
-- "  let g:python3_host_prog=sort(split(glob($PYENV_ROOT.'/versions/3*/bin/python')))[-1]
-- "endif
--
--[[
let s:vim_plug_root = '~/.cache/nvim/plugged'
let s:vim_plug_plugins = '~/.cache/nvim/plugins'
set rtp+=~/.cache/nvim/plugged/vim-plug
set rtp+=~/.cache/nvim/plugins

if !isdirectory(expand(s:vim_plug_root))
  echo 'install vim-plug...'
  call system('mkdir -p ' . s:vim_plug_root . 'vim-plug')
  call system('git clone https://github.com/junegunn/vim-plug.git ' . s:vim_plug_root . '/vim-plug/autoload')
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(s:vim_plug_plugins)
  Plug 'wbthomason/packer.nvim'
  Plug 'neovim/nvim-lspconfig'
call plug#end()
]]



--
-- " ファイルタイププラグインおよびインデントを有効化
-- syntax on
-- try
--   colorscheme material
-- catch
-- endtry
--
-- hi! MatchParen guibg=#555555 guifg=NONE gui=bold
-- hi! Visual guibg=#888888 guifg=NONE
-- hi! SpecialKey ctermfg=239 ctermbg=NONE
-- hi! clear LineNr
-- hi! clear SignColumn
--
-- hi! Normal guibg=NONE ctermbg=NONE
--
-- hi! NormalFloat    guibg=#334455 guifg=#fffeeb gui=NONE      ctermfg=235  ctermbg=230  cterm=NONE
--
-- hi! Terminal       guibg=#323232 guifg=#fffeeb gui=NONE      ctermfg=235  ctermbg=230  cterm=NONE
-- hi! CursorLine     guibg=NONE    guifg=NONE    gui=underline ctermbg=NONE ctermfg=NONE cterm=underline
-- hi! CursorIM       guibg=#af00af guifg=#000000 gui=NONE      ctermbg=127  ctermfg=16   cterm=NONE
-- hi! HighlightedyankRegion cterm=reverse gui=reverse
--
-- autocmd FileType * call <SID>def_base_syntax() " autocmd Syntax may be better
--
-- function! s:def_base_syntax()
--   " Simple example
--   autocmd FileType python syntax match commonOperator "\(+\|=\|-\|\^\|\*\)"
--   autocmd FileType python syntax match baseDelimiter "\(,\|\.\)"
--   autocmd FileType python hi link commonOperator Operator
--   autocmd FileType python hi link baseDelimiter Special
-- endfunction
--
-- augroup syntaxFromStart
--     autocmd FileType vue :syntax sync fromstart
-- augroup END
--
--
-- if has('multi_byte_ime')
--   highlight Cursor guifg=NONE guibg=Green
--   highlight CursorIM guifg=NONE guibg=Purple
-- endif
--
-- filetype plugin indent on
--
