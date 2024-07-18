
vim.opt.encoding = "utf-8"
vim.opt.completeopt:append({ "noselect" })

vim.opt.ignorecase = true -- 大文字小文字を区別しない
vim.opt.smartcase = true -- 検索文字に大文字がある場合は大文字小文字を区別
vim.opt.incsearch = true -- インクリメンタルサーチ
vim.opt.hlsearch = true -- 検索マッチテキストをハイライト

vim.opt.hidden = true -- バッファを閉じる代わりに隠す（Undo履歴を残すため）
vim.opt.switchbuf = "useopen" -- 新しく開く代わりにすでに開いてあるバッファを開く
vim.opt.showmatch = true -- 対応する括弧などをハイライト表示する
vim.opt.matchtime = 2 -- 対応括弧のハイライト表示を3秒にする

vim.opt.clipboard = "unnamedplus"
-- vim.opt.clipboard = "unnamed"
vim.opt.updatetime = 500
vim.opt.shortmess:append({ c = true })
vim.opt.signcolumn = "yes"

vim.opt.number = true -- 行番号の表示
vim.opt.textwidth = 0 -- 自動的に改行が入るのを無効化
vim.opt.display = "lastline"
vim.opt.softtabstop = 0
vim.opt.showtabline = 0 -- 常にタブラインを表示
vim.opt.laststatus = 2
vim.opt.cmdheight = 1
vim.opt.whichwrap = "b,s,<,>,[,]" -- wrapするカッコ一覧
vim.opt.list = true -- 不可視文字の可視化
vim.opt.listchars:append({ tab = [[| ]], trail = "￭", extends = "❯", precedes = "❮" })
vim.opt.ttimeout = nil
vim.opt.ttimeoutlen = 10
vim.opt.scrolloff = 10 -- 3行残して画面スクロールする
vim.opt.shell = "zsh"
vim.opt.ttyfast = true
vim.opt.ambiwidth = "single"
vim.opt.termguicolors = true
vim.opt.wildmenu = true
vim.opt.wildmode = "full"
vim.opt.wildoptions = "pum"

vim.opt.expandtab = true -- タブをスペースにする
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"

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

-- vim.cmd [[
-- let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
-- let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
-- let &t_ti.="\e[1 q"
-- let &t_SI.="\e[5 q"
-- let &t_EI.="\e[1 q"
-- let &t_te.="\e[0 q"
-- ]]

vim.g.netrw_liststyle = 1 -- " ファイルツリーの表示形式、1にするとls -laのような表示になります
vim.g.netrw_banner = 0 -- " ヘッダを非表示にする
vim.g.netrw_sizestyle = "H" -- " サイズを(K,M,G)で表示する
vim.g.netrw_timefmt = "%Y/%m/%d(%a) %H:%M:%S" -- " 日付フォーマットを yyyy/mm/dd(曜日) hh:mm:ss で表示する
vim.g.netrw_preview = 1 -- " プレビューウィンドウを垂直分割で表示する
vim.g.mapleader = " "

vim.keymap.set("n", "<ESC><ESC>", ":noh<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-p>", ":bp<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-n>", ":bn<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-d>", ":bd<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "[b", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "]b", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "[B", ":bfirst<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "]B", ":blast<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "{", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "}", { noremap = true, silent = true })

--  vim strict mode
vim.keymap.set("v", "<C-c>", "<nop>", { noremap = true })
vim.keymap.set("v", "<Up>", "<nop>", { noremap = true })
vim.keymap.set("v", "<Down>", "<nop>", { noremap = true })
vim.keymap.set("v", "<Left>", "<nop>", { noremap = true })
vim.keymap.set("v", "<Right>", "<nop>", { noremap = true })

vim.keymap.set("i", "<C-c>", "<nop>", { noremap = true })
vim.keymap.set("i", "<Up>", "<nop>", { noremap = true })
vim.keymap.set("i", "<Down>", "<nop>", { noremap = true })
vim.keymap.set("i", "<Left>", "<nop>", { noremap = true })
vim.keymap.set("i", "<Right>", "<nop>", { noremap = true })
vim.keymap.set("i", "<BS>", "<nop>", { noremap = true })
vim.keymap.set("i", "<C-h>", "<BS>", { noremap = true })
vim.keymap.set("i", "<C-l>", "<DEL>", { noremap = true })

vim.keymap.set("t", "<C-j><C-j>", [[<C-\><C-n>]], { noremap = true })

vim.keymap.set("n", "<C-c>", "<nop>", { noremap = true })
vim.keymap.set("n", "<Up>", "<nop>", { noremap = true })
vim.keymap.set("n", "<Down>", "<nop>", { noremap = true })
vim.keymap.set("n", "<Left>", "<nop>", { noremap = true })
vim.keymap.set("n", "<Right>", "<nop>", { noremap = true })
vim.keymap.set("n", "<C-[>", "<nop>", { noremap = true })
vim.keymap.set("n", "<Esc>", "<nop>", { noremap = true })

-- easymotion
-- vim.keymap.set("n", "<Leader>", "<Plug>(easymotion-prefix)", { noremap = true, silent = true })
vim.api.nvim_create_user_command("Q", ":q", {})
vim.api.nvim_create_user_command("W", ":w", {})
vim.api.nvim_create_user_command("Wq", ":wq", {})
vim.api.nvim_create_user_command("WQ", ":wq", {})
vim.api.nvim_create_user_command("Term", ":bo terminal ++rows=20", {})

-- バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
vim.cmd [[
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
]]

vim.cmd [[
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

colorscheme material
hi! Normal guibg=NONE ctermbg=NONE
]]

if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
      name = 'win32yank-wsl',
      copy = {
          ['+'] = '/mnt/c/win32yank/win32yank.exe -i --crlf',
          ['*'] = '/mnt/c/win32yank/win32yank.exe -i --crlf',
      },
      paste = {
          ['+'] = '/mnt/c/win32yank/win32yank.exe -o --lf',
          ['*'] = '/mnt/c/win32yank/win32yank.exe -o --lf',
      },
      cache_enabled = true,
  }
end

require('packer').startup(function(use)
  use "wbthomason/packer.nvim"

  use 'folke/flash.nvim'

  use 'vscode-neovim/vscode-multi-cursor.nvim'

  use 'terryma/vim-multiple-cursors'

  use { "kylechui/nvim-surround", tag = "*" }

  use 'kaicataldo/material.vim'
  vim.g.material_terminal_italics = 0
  vim.g.material_theme_style = 'palenight'


  use 'osyo-manga/vim-over'
  vim.keymap.set("n", "<Leader>o", ":OverCommandLine<CR>", { noremap = true, silent = true })

  use 'terryma/vim-expand-region'
  vim.keymap.set("v", "v", "<Plug>(expand_region_expand)", { noremap = true, silent = true })
  vim.keymap.set("v", "<C-v>", "<Plug>(expand_region_shrink)", { noremap = true, silent = true })

  use 'sheerun/vim-polyglot'
  vim.g.vim_json_syntax_conceal = 0

  use 'tpope/vim-fugitive'

  use 'deris/vim-shot-f'

  use 'machakann/vim-highlightedyank'

  use 'andymass/vim-matchup'
  vim.g.loaded_matchit = 1

  use 'easymotion/vim-easymotion'
  vim.keymap.set("n", "<Leader>", "<Plug>(easymotion-prefix)", { noremap = true, silent = true })

end)

require("nvim-surround").setup()

require('vscode-multi-cursor').setup { -- Config is optional
  -- Whether to set default mappings
  default_mappings = true,
  -- If set to true, only multiple cursors will be created without multiple selections
  no_selection = false
}

if vim.g.vscode then
  vim.keymap.set("n", "gi", "<Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>")
  vim.keymap.set("n", "gr", "<Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>")
  vim.keymap.set("n", "gt", "<Cmd>call VSCodeNotify('editor.action.goToTypeDefinition')<CR>")
  vim.keymap.set("n", "gp", "<Cmd>call VSCodeNotify('editor.action.peekDefinition')<CR>")

  vim.keymap.set("n", "]g", "<Cmd>call VSCodeNotify('editor.action.marker.next')<CR>")
  vim.keymap.set("n", "[g", "<Cmd>call VSCodeNotify('editor.action.marker.previous')<CR>")

  vim.keymap.set("n", "<leader>rn", "<Cmd>call VSCodeNotify('editor.action.rename')<CR>")
  vim.keymap.set("n", "<leader>c", "<Cmd>call VSCodeNotify('editor.action.triggerSuggest')<CR>")
  vim.keymap.set("n", "<leader>f", "<Cmd>call VSCodeNotify('outline.focus')<CR>")
  vim.keymap.set("n", "<leader>p", "<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>")
  vim.keymap.set("n", "<leader>m", "<Cmd>call VSCodeNotify('workbench.action.closePanel')<CR>")
  vim.keymap.set("n", "<leader>n", "<Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>")
  vim.keymap.set("n", "<leader>/", "<Cmd>call VSCodeNotify('editor.action.format')<CR><Cmd>call VSCodeNotify('editor.action.organizeImports')<CR>")
end

