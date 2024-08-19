local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local user_command = vim.api.nvim_create_user_command
local keyset = vim.keymap.set
local command = vim.api.nvim_command
local opt = vim.opt

opt.encoding = "utf-8"
opt.completeopt:append({ "noselect" })

opt.ignorecase = true     -- 大文字小文字を区別しない
opt.smartcase = true      -- 検索文字に大文字がある場合は大文字小文字を区別
opt.incsearch = true      -- インクリメンタルサーチ
opt.hlsearch = true       -- 検索マッチテキストをハイライト

opt.hidden = true         -- バッファを閉じる代わりに隠す（Undo履歴を残すため）
opt.switchbuf = "useopen" -- 新しく開く代わりにすでに開いてあるバッファを開く
opt.showmatch = true      -- 対応する括弧などをハイライト表示する
opt.matchtime = 2         -- 対応括弧のハイライト表示を3秒にする

opt.clipboard = "unnamedplus"
-- vim.opt.clipboard = "unnamed"
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
opt.list = true               -- 不可視文字の可視化
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

opt.expandtab = true -- タブをスペースにする
opt.tabstop = 2
opt.shiftwidth = 2
opt.conceallevel = 0
opt.concealcursor = "nc"

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

vim.g.netrw_liststyle = 1                     -- " ファイルツリーの表示形式、1にするとls -laのような表示になります
vim.g.netrw_banner = 0                        -- " ヘッダを非表示にする
vim.g.netrw_sizestyle = "H"                   -- " サイズを(K,M,G)で表示する
vim.g.netrw_timefmt = "%Y/%m/%d(%a) %H:%M:%S" -- " 日付フォーマットを yyyy/mm/dd(曜日) hh:mm:ss で表示する
vim.g.netrw_preview = 1                       -- " プレビューウィンドウを垂直分割で表示する
vim.g.mapleader = " "

keyset("n", "<ESC><ESC>", ":noh<CR>", { noremap = true, silent = true })
keyset("n", "<M-p>", ":bp<CR>", { noremap = true, silent = true })
keyset("n", "<M-n>", ":bn<CR>", { noremap = true, silent = true })
keyset("n", "<M-d>", ":bd<CR>", { noremap = true, silent = true })
keyset("n", "[b", ":bprevious<CR>", { noremap = true, silent = true })
keyset("n", "]b", ":bnext<CR>", { noremap = true, silent = true })
keyset("n", "[B", ":bfirst<CR>", { noremap = true, silent = true })
keyset("n", "]B", ":blast<CR>", { noremap = true, silent = true })
keyset("n", "j", "gj", { noremap = true, silent = true })
keyset("n", "k", "gk", { noremap = true, silent = true })
keyset("n", "<C-k>", "{", { noremap = true, silent = true })
keyset("n", "<C-j>", "}", { noremap = true, silent = true })

--  vim strict mode
keyset("v", "<C-c>", "<nop>", { noremap = true })
keyset("v", "<Up>", "<nop>", { noremap = true })
keyset("v", "<Down>", "<nop>", { noremap = true })
keyset("v", "<Left>", "<nop>", { noremap = true })
keyset("v", "<Right>", "<nop>", { noremap = true })

keyset("i", "<C-c>", "<nop>", { noremap = true })
keyset("i", "<Up>", "<nop>", { noremap = true })
keyset("i", "<Down>", "<nop>", { noremap = true })
keyset("i", "<Left>", "<nop>", { noremap = true })
keyset("i", "<Right>", "<nop>", { noremap = true })
keyset("i", "<BS>", "<nop>", { noremap = true })
keyset("i", "<C-h>", "<BS>", { noremap = true })
keyset("i", "<C-l>", "<DEL>", { noremap = true })

keyset("t", "<C-j><C-j>", [[<C-\><C-n>]], { noremap = true })

keyset("n", "<C-c>", "<nop>", { noremap = true })
keyset("n", "<Up>", "<nop>", { noremap = true })
keyset("n", "<Down>", "<nop>", { noremap = true })
keyset("n", "<Left>", "<nop>", { noremap = true })
keyset("n", "<Right>", "<nop>", { noremap = true })
keyset("n", "<C-[>", "<nop>", { noremap = true })
keyset("n", "<Esc>", "<nop>", { noremap = true })
-- easymotion
-- vim.keymap.set("n", "<Leader>", "<Plug>(easymotion-prefix)", { noremap = true, silent = true })
user_command("Q", ":q", {})
user_command("W", ":w", {})
user_command("Wq", ":wq", {})
user_command("WQ", ":wq", {})
user_command("Term", ":bo terminal ++rows=20", {})

-- バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
vim.cmd [[
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
]]

augroup('filetypes', {})
autocmd({ 'BufRead', 'BufNewFile' }, { group = 'filetypes', pattern = '*Dockerfile', command = 'setfiletype dockerfile' })
autocmd({ 'BufRead', 'BufNewFile' }, { group = 'filetypes', pattern = { '*zshrc', '*zsh' }, command = 'setfiletype zsh' })
autocmd({ 'BufRead', 'BufNewFile' }, { group = 'filetypes', pattern = '*.mjs', command = 'setfiletype javascript' })
autocmd({ 'BufRead', 'BufNewFile' }, { group = 'filetypes', pattern = '*.csv', command = 'setfiletype csv' })
autocmd({ 'BufRead', 'BufNewFile' }, { group = 'filetypes', pattern = '.env.*', command = 'setfiletype sh' })
autocmd('BufWritePre', { group = 'filetypes', pattern = '*', command = ':%s/\\s\\+$//ge' })
autocmd('BufWritePre', { group = 'filetypes', pattern = '*', command = ':%s/\\r//ge' })

augroup('indent', {})
autocmd('FileType', {
  group = 'indent',
  pattern = { 'sh', 'vue', 'yaml', 'javascript', 'typescript', 'json', 'html', 'vim', 'markdown' },
  command = 'setlocal shiftwidth=2 tabstop=2'
})
autocmd('FileType', {
  group = 'indent',
  pattern = { 'python', 'c' },
  command = 'setlocal shiftwidth=4 tabstop=4'
})
autocmd('FileType', {
  group = 'indent',
  pattern = { 'go', 'make' },
  command = 'setlocal shiftwidth=4 tabstop=4 noexpandtab'
})

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

local sep = vim.loop.os_uname().sysname == 'Windows_NT' and [[\]] or [[/]]
local function join(...)
  return table.concat({ ... }, sep)
end

local home = os.getenv 'HOME'
local len = #home

local homepath = ''
local cachepath = ''
if vim.g.vscode then
  homepath = join(home, '.config', 'packer.vscode-nvim')
  cachepath = join(home, '.cache', 'packer.vscode-nvim')
else
  homepath = join(home, '.config', 'packer.nvim')
  cachepath = join(home, '.cache', 'packer.nvim')
end

-- Add path locations for configuration
local rtp = { homepath, cachepath }

-- Add paths that dont start with home.
for _, p in ipairs(vim.opt.runtimepath:get()) do
  if p:sub(1, len) ~= home then
    rtp[#rtp + 1] = p
  end
end

vim.opt.runtimepath = rtp

-- Packer paths and files
local pack_path = join(cachepath, 'site')
local package_root = join(pack_path, 'pack')
local compile_path = join(cachepath, 'plugin', 'packer_compiled.lua')
vim.g.loaded_remote_plugins = 1

vim.opt.packpath:prepend(pack_path)

local packer_install_path = join(package_root, 'packer', 'start', 'packer.nvim')

local ensure_packer = function()
  local fn = vim.fn
  if fn.empty(fn.glob(packer_install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', packer_install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

if vim.g.vscode then
  require('packer').startup {
    function(use)
      use 'wbthomason/packer.nvim'

      use { 'kylechui/nvim-surround', tag = "*" }

      use 'terryma/vim-expand-region'

      use 'machakann/vim-highlightedyank'

      -- use 'deris/vim-shot-f'

      use 'rhysd/clever-f.vim'

      use 'easymotion/vim-easymotion'

      use 'folke/flash.nvim'

      use 'vscode-neovim/vscode-multi-cursor.nvim'
    end,
    config = {
      package_root = package_root,
      compile_path = compile_path,
    },
  }
else
  require('packer').startup {
    function(use)
      use 'wbthomason/packer.nvim'

      use { 'kylechui/nvim-surround', tag = "*" }

      use 'kaicataldo/material.vim'

      use 'terryma/vim-expand-region'

      use 'machakann/vim-highlightedyank'

      -- use 'deris/vim-shot-f'

      use 'rhysd/clever-f.vim'

      use 'easymotion/vim-easymotion'

      use 'simeji/winresizer'

      use 'yorickpeterse/nvim-window'

      use { 'romgrk/barbar.nvim', requires = { 'nvim-tree/nvim-web-devicons', 'lewis6991/gitsigns.nvim', opt = true } }

      use 'terryma/vim-multiple-cursors'

      use 'tpope/vim-fugitive'

      use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } }

      use 'rhysd/git-messenger.vim'

      use 'mechatroner/rainbow_csv'

      use 'Yggdroot/indentLine'

      use { 'nvim-treesitter/nvim-treesitter',
        run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
        end
      }

      use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
          -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
      }

      -- use 'preservim/nerdtree'

      -- use { 'junegunn/fzf.vim', requires = { 'junegunn/fzf', run = ':call fzf#install()' } }

      use { 'nvim-telescope/telescope.nvim', tag = '0.1.8', requires = { 'nvim-lua/plenary.nvim' } }

      use { 'neoclide/coc.nvim', branch = 'release', require = { 'fannheyward/coc-marketplace' } }
    end,
    config = {
      package_root = package_root,
      compile_path = compile_path,
    },
  }
end

if vim.g.vscode then
  ---------------------
  --- nvim-surround ---
  ---------------------
  require("nvim-surround").setup()


  -------------------------
  --- vim-expand-region ---
  -------------------------
  keyset("v", "v", "<Plug>(expand_region_expand)", { noremap = true, silent = true })
  keyset("v", "<C-v>", "<Plug>(expand_region_shrink)", { noremap = true, silent = true })


  ---------------------------
  --- vscode-multi-cursor ---
  ---------------------------
  require('vscode-multi-cursor').setup { -- Config is optional
    -- Whether to set default mappings
    default_mappings = true,
    -- If set to true, only multiple cursors will be created without multiple selections
    no_selection = false
  }


  --------------------
  -- VSCode keymap ---
  --------------------
  keyset("n", "gd", "<Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>")
  keyset("n", "gi", "<Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>")
  keyset("n", "gr", "<Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>")
  keyset("n", "gt", "<Cmd>call VSCodeNotify('editor.action.goToTypeDefinition')<CR>")
  keyset("n", "gp", "<Cmd>call VSCodeNotify('editor.action.peekDefinition')<CR>")
  keyset("n", "]g", "<Cmd>call VSCodeNotify('editor.action.marker.next')<CR>")
  keyset("n", "[g", "<Cmd>call VSCodeNotify('editor.action.marker.previous')<CR>")

  keyset("n", "<leader>rn", "<Cmd>call VSCodeNotify('editor.action.rename')<CR>")
  keyset("n", "<leader>c", "<Cmd>call VSCodeNotify('editor.action.triggerSuggest')<CR>")
  keyset("n", "<leader>f", "<Cmd>call VSCodeNotify('outline.focus')<CR>")
  keyset("n", "<leader>p", "<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>")
  keyset("n", "<leader>m", "<Cmd>call VSCodeNotify('workbench.action.closePanel')<CR>")
  keyset("n", "<leader>n", "<Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>")
  keyset("n", "<leader>/",
    "<Cmd>call VSCodeNotify('editor.action.format')<CR><Cmd>call VSCodeNotify('editor.action.organizeImports')<CR>")

  keyset("n", "<C-w><C-h>", "<nop>", { noremap = true })
  keyset("n", "<C-w><C-j>", "<nop>", { noremap = true })
  keyset("n", "<C-w><C-k>", "<nop>", { noremap = true })
  keyset("n", "<C-w><C-l>", "<nop>", { noremap = true })
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
else
  ---------------------
  --- nvim-surround ---
  ---------------------
  require("nvim-surround").setup()

  ----------------
  --- material ---
  ----------------
  vim.g.material_terminal_italics = 0
  vim.g.material_theme_style = 'palenight'

  -------------------------
  --- vim-expand-region ---
  -------------------------
  keyset("v", "v", "<Plug>(expand_region_expand)", { noremap = true, silent = true })
  keyset("v", "<C-v>", "<Plug>(expand_region_shrink)", { noremap = true, silent = true })


  -------------------
  --- nvim-window ---
  -------------------
  keyset("n", "<Leader>w", ":lua require('nvim-window').pick()<CR>", { noremap = true, silent = true })


  ---------------
  --- lualine ---
  ---------------
  require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = { 'filename' },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  }

  ---------------------
  --- git-messenger ---
  ---------------------
  keyset("n", "<Leader>gm", "<Plug>(git-messenger)", { noremap = true, silent = true })
  vim.g.git_messenger_include_diff = 'current'
  vim.g.git_messenger_always_into_popup = true
  vim.g.git_messenger_into_popup_after_show = true


  -------------------
  --- rainbow_csv ---
  -------------------
  vim.g.rainbow_active = 0
  vim.g.rainbow_conf = {
    guifgs = { 'darkorange2', 'orchid3', 'seagreen3' },
    separately = { nerdtree = 0 }
  }


  ------------------
  --- IndentLine ---
  ------------------
  vim.g.indentLine_showFirstIndentLevel = 1
  vim.g.indentLine_bufNameExclude = { '_.*', 'NERD_tree.*' }
  vim.g.indentLine_bufTypeExluce = { 'help', 'nerdtree', 'terminal' }
  vim.g.indentLine_fileTypeExluce = { 'help', 'nerdtree' }
  vim.g.indentLine_color_term = 238
  vim.g.indentLine_color_gui = '#676767'
  vim.g.indentLine_setConceal = 0


  -----------------------
  --- nvim-treesitter ---
  -----------------------
  require('nvim-treesitter.configs').setup {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = {
      "c",
      "dockerfile",
      "gitignore",
      "go",
      "javascript",
      "json",
      "lua",
      "make",
      "markdown",
      "markdown_inline",
      "python",
      "sql",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
      enable = true,

      -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
  }


  ---------------
  --- neotree ---
  ---------------
  keyset("n", "<leader>n", ":Neotree toggle<CR>", { noremap = true, silent = true })
  keyset("n", "<leader>h", ":Neotree toggle reveal<CR>", { noremap = true, silent = true })
  require("neo-tree").setup({
    window = {
      mappings = {
        ["l"] = "open",
      }
    }
  })

  ----------------
  --- NERDTree ---
  ----------------
  -- keyset("n", "<Leader>n", ":NERDTreeToggle<CR>", { noremap = true, silent = true })
  -- keyset("n", "<Leader>h", ":NERDTreeFind<CR>", { noremap = true, silent = true })
  -- vim.g.NERDTreeWinSize = 35
  -- vim.g.NERDTreeLimitedSyntax = 1
  -- vim.g.NERDTreeQuitOnOpen = 0
  -- augroup('nerdtree_hook', {})
  -- autocmd('FileType', { group = 'nerdtree_hook', pattern = 'nerdtree', command = 'nmap <buffer> l o' })
  -- autocmd('FileType', { group = 'nerdtree_hook', pattern = 'nerdtree', command = 'nmap <buffer> <C-0> o' })
  -- autocmd('FileType', { group = 'nerdtree_hook', pattern = 'nerdtree', command = 'nmap <buffer> <C-n> j' })
  -- autocmd('FileType', { group = 'nerdtree_hook', pattern = 'nerdtree', command = 'nmap <buffer> <C-p> k' })


  -----------
  --- fzf ---
  -----------
  -- vim.g.fzf_layout = { down = '~40%' }
  -- user_command('Files', 'call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)',
  --   { bang, nargs = '?', complete = 'dir' })
  -- user_command('GFiles', 'call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)',
  --   { bang, nargs = '?', complete = 'dir' })
  -- user_command('Rg', "call fzf#vim#grep('rg --column --line-number -g \"!.git\" --hidden --smart-case --no-heading --color=always '.shellescape(<q-args>), 1, <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%') : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'), <bang>0)",
  -- { bang, nargs = '*' })
  -- keyset("n", "<C-p>", ":GFiles<CR>", { noremap = true, silent = true })
  -- keyset("n", "<Leader>f", ":Files<CR>", { noremap = true, silent = true })
  -- keyset("n", "<Leader>g", ":Rg<CR>", { noremap = true, silent = true })
  -- keyset("n", "<Leader>b", ":Buffers<CR>", { noremap = true, silent = true })
  -- keyset("n", "<Leader>x", ":Commands<CR>", { noremap = true, silent = true })


  -----------------
  --- telescope ---
  -----------------
  local builtin = require('telescope.builtin')
  keyset('n', '<C-p>', builtin.find_files, { noremap = true, silent = true })
  keyset('n', '<leader>g', builtin.live_grep, { noremap = true, silent = true })
  keyset('n', '<leader>b', builtin.buffers, { noremap = true, silent = true })
  -- keyset('n', '<leader>h', builtin.help_tags, { noremap = true, silent = true })


  -----------
  --- coc ---
  -----------
  -- Autocomplete
  function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
  end

  local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
  keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
    opts)
  keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
  keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
  -- keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")

  keyset('n', 'gd', '<Plug>(coc-definition)', { silent = true })
  keyset('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
  keyset('n', 'gr', '<Plug>(coc-references)', { silent = true })
  keyset('n', 'gt', '<Plug>(coc-type-definition)', { silent = true })
  keyset('n', 'gp', '<Plug>(coc-peek-definition)', { silent = true })
  keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
  keyset("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

  -- Symbol renaming
  keyset("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })

  -- Formatting
  keyset("x", "<leader>/", "<Cmd>call CocAction('format')<CR>", { silent = true })
  keyset("n", "<leader>/", "<Cmd>call CocAction('format')<CR>", { silent = true })
  user_command('Eslint', 'call CocAction("runCommand", "eslint.executeAutofix")', {})

  -- Use K to show documentation in preview window
  function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
      command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
      vim.fn.CocActionAsync('doHover')
    else
      command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
  end

  keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })

  -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
  augroup("CocGroup", {})
  autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
  })

  vim.g.coc_global_extensions = {
    'coc-clangd',
    'coc-deno',
    'coc-docker',
    'coc-eslint',
    'coc-git',
    'coc-json',
    'coc-lua',
    'coc-markdownlint',
    'coc-marketplace',
    'coc-pairs',
    'coc-prettier',
    'coc-pyright',
    'coc-rust-analyzer',
    'coc-sh',
    'coc-sql',
    'coc-tsserver',
    'coc-vimlsp',
    'coc-xml',
    'coc-yaml',
  }

  -- autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
  autocmd("BufWritePre", {
    pattern = "*.go",
    command = "silent call CocAction('runCommand', 'editor.action.organizeImport')",
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end
vim.cmd [[colorscheme material]]
vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
