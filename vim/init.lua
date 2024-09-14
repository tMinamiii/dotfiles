local user_command = vim.api.nvim_create_user_command
local colorscheme = vim.cmd.colorscheme
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local command = vim.api.nvim_command
local keyset = vim.keymap.set
local opt = vim.opt
local hl = vim.api.nvim_set_hl
local g = vim.g

opt.encoding = "utf-8"
opt.completeopt:append({ "noselect" })

opt.cursorline = true
opt.ignorecase = true -- 大文字小文字を区別しない
opt.smartcase = true  -- 検索文字に大文字がある場合は大文字小文字を区別
opt.incsearch = true  -- インクリメンタルサーチ
opt.hlsearch = true   -- 検索マッチテキストをハイライト

opt.hidden = true     -- バッファを閉じる代わりに隠す（Undo履歴を残すため）
-- opt.switchbuf = "usetab" -- 新しく開く代わりにすでに開いてあるバッファを開く
opt.showmatch = true  -- 対応する括弧などをハイライト表示する
opt.matchtime = 2     -- 対応括弧のハイライト表示を3秒にする

opt.clipboard = "unnamedplus"
-- vim.opt.clipboard = "unnamed"
opt.updatetime = 500
opt.shortmess:append({ c = true })
opt.signcolumn = "yes"
opt.swapfile = false

opt.number = true -- 行番号の表示
opt.textwidth = 0 -- 自動的に改行が入るのを無効化
opt.display = "lastline"
opt.softtabstop = 0
opt.showtabline = 0 -- 常にタブラインを表示
opt.laststatus = 2
opt.cmdheight = 1
opt.whichwrap = "b,s,<,>,[,]" -- wrapするカッコ一覧
opt.list = true               -- 不可視文字の可視化
opt.listchars:append({ space = "·", tab = [[▏ ]], trail = "￭", extends = "❯", precedes = "❮" })
opt.ttimeout = nil
opt.ttimeoutlen = 10
opt.scrolloff = 15 -- 15行残して画面スクロールする
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

--- ufo ---
opt.foldcolumn = '1' -- '0' is not bad
opt.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

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

g.netrw_liststyle = 1                     -- " ファイルツリーの表示形式、1にするとls -laのような表示になります
g.netrw_banner = 0                        -- " ヘッダを非表示にする
g.netrw_sizestyle = "H"                   -- " サイズを(K,M,G)で表示する
g.netrw_timefmt = "%Y/%m/%d(%a) %H:%M:%S" -- " 日付フォーマットを yyyy/mm/dd(曜日) hh:mm:ss で表示する
g.netrw_preview = 1                       -- " プレビューウィンドウを垂直分割で表示する
g.mapleader = " "
vim.g.maplocalleader = "\\"

keyset("n", "<F3>", ":noh<CR>", { noremap = true, silent = true })
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
-- keyset("v", "<Up>", "<nop>", { noremap = true })
-- keyset("v", "<Down>", "<nop>", { noremap = true })
-- keyset("v", "<Left>", "<nop>", { noremap = true })
-- keyset("v", "<Right>", "<nop>", { noremap = true })

keyset("i", "<C-c>", "<nop>", { noremap = true })
-- keyset("i", "<Up>", "<nop>", { noremap = true })
-- keyset("i", "<Down>", "<nop>", { noremap = true })
-- keyset("i", "<Left>", "<nop>", { noremap = true })
-- keyset("i", "<Right>", "<nop>", { noremap = true })
keyset("i", "<BS>", "<nop>", { noremap = true })
keyset("i", "<C-h>", "<BS>", { noremap = true })
keyset("i", "<C-l>", "<DEL>", { noremap = true })

keyset("t", "<C-j><C-j>", [[<C-\><C-n>]], { noremap = true })

keyset("n", "<C-c>", "<nop>", { noremap = true })
-- keyset("n", "<Up>", "<nop>", { noremap = true })
-- keyset("n", "<Down>", "<nop>", { noremap = true })
-- keyset("n", "<Left>", "<nop>", { noremap = true })
-- keyset("n", "<Right>", "<nop>", { noremap = true })
-- keyset("n", "<C-[>", "<nop>", { noremap = true })
-- keyset("n", "<Esc>", "<nop>", { noremap = true })

-- easymotion
-- vim.keymap.set("n", "<Leader>", "<Plug>(easymotion-prefix)", { noremap = true, silent = true })

-- lazy.nvim
keyset("n", "<Leader>li", ":Lazy install<CR>", { noremap = true, silent = true, desc = "lazy install" })
keyset("n", "<Leader>lu", ":Lazy update<CR>", { noremap = true, silent = true, desc = "lazy update" })
keyset("n", "<Leader>ls", ":Lazy sync<CR>", { noremap = true, silent = true, desc = "lazy sync" })
keyset("n", "<Leader>lc", ":Lazy clean<CR>", { noremap = true, silent = true, desc = "lazy clean" })


user_command("Q", ":q", {})
user_command("W", ":w", {})
user_command("Wq", ":wq", {})
user_command("WQ", ":wq", {})
user_command("Term", ":bo terminal ++rows=20", {})
user_command("Pi", ":Lazy install", {})
user_command("Pu", ":Lazy update", {})
user_command("Ps", ":Lazy sync", {})
user_command("Pc", ":Lazy clean", {})

augroup("filetypes", {})
autocmd({ "BufRead", "BufNewFile" }, { group = "filetypes", pattern = "*Dockerfile", command = "setfiletype dockerfile" })
autocmd({ "BufRead", "BufNewFile" }, { group = "filetypes", pattern = { "*zshrc", "*zsh" }, command = "setfiletype zsh" })
autocmd({ "BufRead", "BufNewFile" }, { group = "filetypes", pattern = "*.mjs", command = "setfiletype javascript" })
autocmd({ "BufRead", "BufNewFile" }, { group = "filetypes", pattern = "*.csv", command = "setfiletype csv" })
autocmd({ "BufRead", "BufNewFile" }, { group = "filetypes", pattern = ".env.*", command = "setfiletype sh" })
autocmd("BufWritePre", { group = "filetypes", pattern = "*", command = ":%s/\\s\\+$//ge" })
autocmd("BufWritePre", { group = "filetypes", pattern = "*", command = ":%s/\\r//ge" })

augroup("indent", {})
autocmd("FileType", {
  group = "indent",
  pattern = { "sh", "vue", "yaml", "javascript", "typescript", "json", "html", "vim", "markdown" },
  command = "setlocal shiftwidth=2 tabstop=2"
})
autocmd("FileType", {
  group = "indent",
  pattern = { "python", "c" },
  command = "setlocal shiftwidth=4 tabstop=4"
})
autocmd("FileType", {
  group = "indent",
  pattern = { "go", "make" },
  command = "setlocal shiftwidth=4 tabstop=4 noexpandtab"
})

if vim.fn.has("wsl") == 1 then
  g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "/mnt/c/win32yank/win32yank.exe -i --crlf",
      ["*"] = "/mnt/c/win32yank/win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "/mnt/c/win32yank/win32yank.exe -o --lf",
      ["*"] = "/mnt/c/win32yank/win32yank.exe -o --lf",
    },
    cache_enabled = true,
  }
end

local lazyroot = ""
if g.vscode then
  lazyroot = vim.fn.stdpath("data") .. "/lazy.vscode"
else
  lazyroot = vim.fn.stdpath("data") .. "/lazy"
end

local lazypath = lazyroot .. "/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

if g.vscode then
  -- Setup lazy.nvim
  require("lazy").setup({
    root = lazyroot,
    spec = {
      { "kylechui/nvim-surround",       version = "*", opts = {} },
      {
        "terryma/vim-expand-region",
        lazy = false,
        keys = {
          { "v",     "<Plug>(expand_region_expand)", mode = "v", noremap = true, silent = true, desc = "vim-expand-region expand" },
          { "<C-v>", "<Plug>(expand_region_shrink)", mode = "v", noremap = true, silent = true, desc = "vim-expand-region shrink" },
        }
      },
      { "machakann/vim-highlightedyank" },
      { "rhysd/clever-f.vim" },
      {
        "monaqa/dial.nvim",
        lazy = false,
        keys = {
          { "<C-a>",  function() require("dial.map").manipulate("increment", "normal") end,  mode = "n", noremap = true, silent = true },
          { "<C-x>",  function() require("dial.map").manipulate("decrement", "normal") end,  mode = "n", noremap = true, silent = true },
          { "g<C-a>", function() require("dial.map").manipulate("increment", "gnormal") end, mode = "n", noremap = true, silent = true },
          { "g<C-x>", function() require("dial.map").manipulate("decrement", "gnormal") end, mode = "n", noremap = true, silent = true },
          { "<C-a>",  function() require("dial.map").manipulate("increment", "visual") end,  mode = "v", noremap = true, silent = true },
          { "<C-x>",  function() require("dial.map").manipulate("decrement", "visual") end,  mode = "v", noremap = true, silent = true },
          { "g<C-a>", function() require("dial.map").manipulate("increment", "gvisual") end, mode = "v", noremap = true, silent = true },
          { "g<C-x>", function() require("dial.map").manipulate("decrement", "gvisual") end, mode = "v", noremap = true, silent = true },
        },
        config = function()
          local augend = require("dial.augend")
          require("dial.config").augends:register_group {
            -- default augends used when no group name is specified
            default = {
              augend.constant.alias.bool,    -- boolean value (true <-> false)
              augend.semver.alias.semver,
              augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
              augend.integer.alias.decimal_int,
              augend.integer.alias.hex,
            },
          }
        end
      },

      { "numToStr/Comment.nvim", opts = {} },
      {
        "smoka7/hop.nvim",
        lazy = false,
        version = "*",
        keys = {
          {
            "<Leader>f",
            function()
              require("hop").hint_char1({
                direction = require("hop.hint").HintDirection
                    .AFTER_CURSOR
              })
            end,
            mode = "n",
            noremap = true,
            silent = true,
            desc = "hop after"
          },
          {
            "<Leader>F",
            function()
              require("hop").hint_char1({
                direction = require("hop.hint").HintDirection
                    .BEFORE_CURSOR
              })
            end,
            mode = "n",
            noremap = true,
            silent = true,
            desc = "hop before"
          },
        },
        opts = { { keys = "etovxqpdygfblzhckisuran" } }
      },
      {
        "vscode-neovim/vscode-multi-cursor.nvim",
        opts = {
          default_mappings = true,
          no_selection = false
        }
      },
    },
    checker = { enabled = true },
  })
  --------------------
  -- VSCode keymap ---
  --------------------
  local function vsckeyset(mode, lhs, actions, opts)
    opts.noremap = true
    opts.silent = true
    local vscode = require('vscode')
    local rhs
    if type(actions) == "string" then
      -- asynchronously executes a vscode command.
      rhs = function()
        vscode.action(actions)
      end
    else
      -- synchronously executes a vscode command.
      rhs = function()
        for _, act in pairs(actions) do
          vscode.call(act)
        end
      end
    end
    keyset(mode, lhs, rhs, opts)
  end

  -- vsckeyset("n", "gd", "editor.action.revealDefinition", { desc = "reveal definition" })
  vsckeyset("n", "gi", "editor.action.goToImplementation", { desc = "go to implementation" })
  vsckeyset("n", "gr", "editor.action.goToReferences", { desc = "go to references" })
  vsckeyset("n", "gt", "editor.action.goToTypeDefinition", { desc = "go to type definition" })
  vsckeyset("n", "gp", "editor.action.peekDefinition", { desc = "peek definition" })
  vsckeyset("n", "]g", "editor.action.marker.next", { desc = "marker next" })
  vsckeyset("n", "[g", "editor.action.marker.previous", { desc = "marker previous" })
  vsckeyset("n", "za", "editor.toggleFold", { desc = "toggle fold" })
  vsckeyset("n", "zr", "editor.unfoldAll", { desc = "unfold all" })
  vsckeyset("n", "zm", "editor.foldAll", { desc = "fold all" })

  vsckeyset("n", "<leader>rn", "editor.action.rename", { desc = "rename" })
  vsckeyset("n", "<leader>tr", "testing.runAtCursor", { desc = "test run at cursor" })
  vsckeyset("n", "<leader>dr", "testing.debugAtCursor", { desc = "test debug at cursor" })
  vsckeyset("n", "<leader>c", "editor.action.triggerSuggest", { desc = "trigger suggest" })
  vsckeyset("n", "<leader>a", "outline.focus", { desc = "'outline focus" })
  vsckeyset("n", "<leader>p", "workbench.action.quickOpen", { desc = "quick open" })
  vsckeyset("n", "<leader>m", "workbench.action.closePanel", { desc = "close panel" })
  vsckeyset("n", "<leader>n", "workbench.action.toggleSidebarVisibility", { desc = "toggle sidebar visibility" })
  vsckeyset("n", "<leader>/", { "editor.action.organizeImports", "editor.action.format" }, { desc = "organize imports" })

  keyset("n", "<C-w><C-h>", "<nop>", { noremap = true, silent = true })
  keyset("n", "<C-w><C-j>", "<nop>", { noremap = true, silent = true })
  keyset("n", "<C-w><C-k>", "<nop>", { noremap = true, silent = true })
  keyset("n", "<C-w><C-l>", "<nop>", { noremap = true, silent = true })
else
  require("lazy").setup({
    root = lazyroot,
    spec = {
      { "kylechui/nvim-surround",      version = "*", opts = {} },
      { "terryma/vim-multiple-cursors" },
      { "tpope/vim-fugitive" },
      {
        "mechatroner/rainbow_csv",
        init = function()
          g.rainbow_active = 0
          g.rainbow_conf = {
            guifgs = { "darkorange2", "orchid3", "seagreen3" },
            separately = { nerdtree = 0 }
          }
        end
      },
      { "machakann/vim-highlightedyank" },
      {
        "terryma/vim-expand-region",
        lazy = false,
        keys = {
          { "v",     "<Plug>(expand_region_expand)", mode = "v", noremap = true, silent = true, desc = "vim-expand-region expand" },
          { "<C-v>", "<Plug>(expand_region_shrink)", mode = "v", noremap = true, silent = true, desc = "vim-expand-region shrink" },
        }
      },
      { "rhysd/clever-f.vim" },
      {
        "monaqa/dial.nvim",
        lazy = false,
        keys = {
          { "<C-a>",  function() require("dial.map").manipulate("increment", "normal") end,  mode = "n", noremap = true, silent = true },
          { "<C-x>",  function() require("dial.map").manipulate("decrement", "normal") end,  mode = "n", noremap = true, silent = true },
          { "g<C-a>", function() require("dial.map").manipulate("increment", "gnormal") end, mode = "n", noremap = true, silent = true },
          { "g<C-x>", function() require("dial.map").manipulate("decrement", "gnormal") end, mode = "n", noremap = true, silent = true },
          { "<C-a>",  function() require("dial.map").manipulate("increment", "visual") end,  mode = "v", noremap = true, silent = true },
          { "<C-x>",  function() require("dial.map").manipulate("decrement", "visual") end,  mode = "v", noremap = true, silent = true },
          { "g<C-a>", function() require("dial.map").manipulate("increment", "gvisual") end, mode = "v", noremap = true, silent = true },
          { "g<C-x>", function() require("dial.map").manipulate("decrement", "gvisual") end, mode = "v", noremap = true, silent = true },
        },
        config = function()
          local augend = require("dial.augend")
          require("dial.config").augends:register_group {
            -- default augends used when no group name is specified
            default = {
              augend.constant.alias.bool,    -- boolean value (true <-> false)
              augend.semver.alias.semver,
              augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
              augend.integer.alias.decimal_int,
              augend.integer.alias.hex,
            },
          }
        end
      },
      { "numToStr/Comment.nvim",      opts = {} },
      {
        "smoka7/hop.nvim",
        lazy = false,
        version = "*",
        keys = {
          {
            "<Leader>f",
            function()
              require("hop").hint_char1({
                direction = require("hop.hint").HintDirection.AFTER_CURSOR
              })
            end,
            mode = "n",
            noremap = true,
            silent = true,
            desc = "hop after"
          },
          {
            "<Leader>F",
            function()
              require("hop").hint_char1({
                direction = require("hop.hint").HintDirection.BEFORE_CURSOR
              })
            end,
            mode = "n",
            noremap = true,
            silent = true,
            desc = "hop before"
          },
        },
        opts = { { keys = "etovxqpdygfblzhckisuran" } }
      },
      { 'marko-cerovac/material.nvim' },
      { 'Mofiqul/vscode.nvim' },
      {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        keys = {
          { "<C-s>", "<Plug>MarkdownPreviewToggle", mode = "n", noremap = true, silent = true, desc = "markdown-preview toggle" }
        },
        build = function()
          require("lazy").load({ plugins = { "markdown-preview.nvim" } })
          vim.fn["mkdp#util#install"]()
        end,
      },
      {
        "xiyaowong/transparent.nvim",
        opts = { extra_groups = { "NeoTreeNormal", "NeoTreeNormalNC" }, exclude_groups = { "CursorLine" } },
        init = function()
          g.transparent_enabled = true
        end
      },
      { "simeji/winresizer" },
      {
        "yorickpeterse/nvim-window",
        lazy = false,
        keys = {
          { "<Leader>w", function() require("nvim-window").pick() end, mode = "n", noremap = true, silent = true, desc = "nvim-window" }
        }
      },
      {
        "romgrk/barbar.nvim",
        dependencies = {
          'lewis6991/gitsigns.nvim',
          'nvim-tree/nvim-web-devicons',
        },
      },
      {
        "lewis6991/gitsigns.nvim",
        opts = {
          on_attach = function(bufnr)
            local gitsigns = require("gitsigns")

            local function map(mode, l, r, opts)
              opts = opts or {}
              opts.buffer = bufnr
              opts.noremap = true
              opts.silent = true
              vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map("n", "]c", function()
              if vim.wo.diff then
                vim.cmd.normal({ "]c", bang = true })
              else
                gitsigns.nav_hunk("next")
              end
            end, { desc = "gitsigns navigation hunk next" })

            map("n", "[c", function()
              if vim.wo.diff then
                vim.cmd.normal({ "[c", bang = true })
              else
                gitsigns.nav_hunk("prev")
              end
            end, { desc = "gitsigns navigation hunk prev" })

            -- Actions
            map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "gitsigns stage_hunk" })
            map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "gitsigns reset_hunk" })
            map("v", "<leader>gs", function() gitsigns.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end,
              { desc = "gitsigns stage_hunk" })
            map("v", "<leader>gr", function() gitsigns.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end,
              { desc = "gitsigns reset_hunk" })
            map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "gitsigns stage_buffer" })
            map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "gitsigns undo_stage_hunk" })
            map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "gitsigns reset_buffer" })
            map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "gitsigns preview_hunk" })
            map("n", "<leader>gb", function() gitsigns.blame_line { full = true } end, { desc = "gitsigns blame_line" })
            map("n", "<leader>gtb", gitsigns.toggle_current_line_blame, { desc = "gitsigns toggle_current_line_blame" })
            map("n", "<leader>gd", gitsigns.diffthis, { desc = "gitsigns diffthis" })
            map("n", "<leader>gD", function() gitsigns.diffthis("~") end, { desc = "gitsigns diffthis" })
            map("n", "<leader>gtd", gitsigns.toggle_deleted, { desc = "gitsigns toggle_deleted" })

            -- Text object
            map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "gitsigns select hunk" })
          end
        },
      },
      {
        "nvim-lualine/lualine.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
          options = {
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
          },
        }
      },
      {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        config = function()
          require("ibl").setup(
            {
              indent = {
                highlight = { "WhiteSpace" },
                char = "▏",
              },
              scope = { enabled = false },
            })
        end
      },
      {
        "nvim-treesitter/nvim-treesitter",
        build = function()
          local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
          ts_update()
        end,
        config = function()
          require("nvim-treesitter.configs").setup({
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
            sync_install = true,
            auto_install = true,
            ignore_install = {},
            highlight = {
              enable = true,
              disable = function(lang, buf)
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                  return true
                end
              end,
              additional_vim_regex_highlighting = false,
            },
          })
        end
      },
      {
        "nvim-neo-tree/neo-tree.nvim",
        lazy = false,
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
          -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        keys = {
          { "<leader>n", ":Neotree toggle<CR>",        mode = "n", noremap = true, silent = true, desc = "neo-tree toggle" },
          { "<leader>h", ":Neotree toggle reveal<CR>", mode = "n", noremap = true, silent = true, desc = "neo-tree toggle reveal" },
        },
        opts = {
          window = {
            mappings = {
              ["l"] = "open",
            }
          }
        }
      },
      {
        "stevearc/aerial.nvim",
        lazy = false,
        dependencies = {
          "nvim-treesitter/nvim-treesitter",
          "nvim-tree/nvim-web-devicons"
        },
        keys = {
          { "<leader>a", "<cmd>AerialToggle!<CR>", mode = "n", noremap = true, silent = true, desc = "aerial toggle" }
        },
        opts = {
          layout = {
            max_width = { 60, 0.3 },
            min_width = 40,
          },
        }
      },
      {
        "akinsho/toggleterm.nvim",
        lazy = false,
        version = '*',
        keys = {
          { "<Esc><Esc>", "<C-\\><C-n>", mode = "t", noremap = true, silent = true, desc = "terminal leave insert mode" }
        },
        opts = { open_mapping = [[<c-t>]], }
      },
      {
        "rcarriga/nvim-dap-ui",
        dependencies = {
          "mfussenegger/nvim-dap",
          "nvim-neotest/nvim-nio",
          "leoluz/nvim-dap-go",
          "mxsdev/nvim-dap-vscode-js",
        },
        init = function()
          local dap, dapui = require("dap"), require("dapui")
          vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
          dap.listeners.before.attach.dapui_config = function()
            dapui.open()
          end
          dap.listeners.before.launch.dapui_config = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
          end
          dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
          end
        end,
        opts = {
          layouts = {
            {
              elements = {
                { id = "scopes",      size = 0.25 },
                { id = "breakpoints", size = 0.25 },
                { id = "stacks",      size = 0.25 },
                { id = "watches",     size = 0.25 }
              },
              position = "left",
              size = 60
            },
            {
              elements = {
                { id = "repl",    size = 0.5 },
                { id = "console", size = 0.5 }
              },
              position = "bottom",
              size = 15
            }
          },
        }
      },
      {
        "nvim-neotest/neotest",
        lazy = false,
        dependencies = {
          "nvim-neotest/nvim-nio",
          "nvim-lua/plenary.nvim",
          "antoinemadec/FixCursorHold.nvim",
          "fredrikaverpil/neotest-golang",
          "thenbe/neotest-playwright",
          "nvim-neotest/neotest-jest",
          "marilari88/neotest-vitest",
        },
        keys = {
          { "<leader>tr", function() require("neotest").run.run() end,                     mode = "n", noremap = true, silent = true, desc = "run test at cursor" },
          { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,   mode = "n", noremap = true, silent = true, desc = "run test file" },
          { "<leader>tp", function() require("neotest").output_panel.toggle() end,         mode = "n", noremap = true, silent = true, desc = "neotest toggle output pannel" },
          { "<leader>to", function() require("neotest").output.open({ enter = true }) end, mode = "n", noremap = true, silent = true, desc = "neotest open output" },
          { "<leader>ts", function() require("neotest").summary.toggle() end,              mode = "n", noremap = true, silent = true, desc = "neotest toggle summary" },
          { "<leader>dr", function() require("neotest").run.run({ strategy = "dap" }) end, mode = "n", noremap = true, silent = true, desc = "neotest run debug" },
          { "<leader>db", function() require("dap").toggle_breakpoint() end,               mode = "n", noremap = true, silent = true, desc = "dap toggle breakpoint" },
          { "<leader>du", function() require("dapui").toggle() end,                        mode = "n", noremap = true, silent = true, desc = "dap toggle nvim-dap-ui" },
        },
        config = function()
          require("neotest").setup({
            adapters = {
              require("neotest-golang"),
              require("neotest-playwright").adapter({
                options = {
                  persist_project_selection = true,
                  enable_dynamic_test_discovery = true,
                },
              }),
              require("neotest-jest")({
                jestCommand = "npm test --",
                jestConfigFile = "custom.jest.config.ts",
                env = { CI = true },
                cwd = function(path)
                  return vim.fn.getcwd()
                end,
              }),
              require("neotest-vitest"),
            },
            output = {
              enabled = true,
              open_on_run = true
            },
          })
        end
      },
      {
        "folke/which-key.nvim",
        lazy = false,
        keys = {
          { "<leader>?", function() require("which-key").show({ global = false }) end, mode = "n", noremap = true, silent = true, desc = "Buffer Local Keymaps (which-key)" }
        }
      },
      { "petertriho/nvim-scrollbar", opts = {} },
      {
        "kevinhwang91/nvim-ufo",
        lazy = false,
        dependencies = { "kevinhwang91/promise-async" },
        keys = {
          { "zR", function() require("ufo").openAllFolds() end,         mode = "n", noremap = true, silent = true, desc = "open all folds" },
          { "zM", function() require("ufo").closeAllFolds() end,        mode = "n", noremap = true, silent = true, desc = "close all folds" },
          { "zr", function() require("ufo").openFoldsExceptKinds() end, mode = "n", noremap = true, silent = true, desc = "open folds except kinds" },
          { "zm", function() require("ufo").closeFoldsWith() end,       mode = "n", noremap = true, silent = true, desc = "close folds with" },
        },
        opts = {
          provider_selector = function()
            return { "treesitter", "indent" }
          end,
        }
      },
      {
        "luukvbaal/statuscol.nvim",
        lazy = false,
        config = function()
          local builtin = require("statuscol.builtin")
          require("statuscol").setup({
            relculright = true,
            segments = {
              { text = { "%s" },                   click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " },  click = "v:lua.ScLa" },
              { text = { builtin.foldfunc, "  " }, click = "v:lua.ScFa" },
            },
          })
        end
      },
      { "sindrets/diffview.nvim" },
      {
        "linrongbin16/gitlinker.nvim",
        lazy = false,
        keys = {
          { "<leader>gl", "<cmd>GitLink<cr>",  mode = { "n", "v" }, silent = true, noremap = true, desc = "Yank git permlink" },
          { "<leader>gL", "<cmd>GitLink!<cr>", mode = { "n", 'v' }, silent = true, noremap = true, desc = "Open git permlink" },
        },
        opts = {}
      },
      {
        "nvim-telescope/telescope.nvim",
        lazy = false,
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
          { "<C-p>",     function() require("telescope.builtin").find_files() end, mode = "n", noremap = true, silent = true, desc = "telescope find files" },
          { "<leader>p", function() require("telescope.builtin").live_grep() end,  mode = "n", noremap = true, silent = true, desc = "telescope live grep" },
          -- keyset("n", "<leader>pb", builtin.buffers, { noremap = true, silent = true, desc = "telescope buffers" })
          -- keyset("n", "<leader>h", builtin.help_tags, { noremap = true, silent = true })
        },
        version = "0.1.8"
      },
      {
        "neoclide/coc.nvim",
        lazy = false,
        dependencies = { "fannheyward/coc-marketplace" },
        keys = {
          {
            "<TAB>",
            "coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? '<TAB>' : coc#refresh()",
            mode = "i",
            noremap = true,
            silent = true,
            expr = true,
            replace_keycodes = false
          },
          {
            "<S-TAB>",
            [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]],
            mode = "i",
            noremap = true,
            silent = true,
            expr = true,
            replace_keycodes = false
          },
          {
            "<cr>",
            [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
            mode = "i",
            noremap = true,
            silent = true,
            expr = true,
            replace_keycodes = false
          },
          -- keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
          { "gd",         "<Plug>(coc-definition)",            mode = "n",          noremap = true, silent = true, desc = "coc goto definition" },
          { "gi",         "<Plug>(coc-implementation)",        mode = "n",          noremap = true, silent = true, desc = "coc goto implementa,tion" },
          { "gr",         "<Plug>(coc-references)",            mode = "n",          noremap = true, silent = true, desc = "coc goto references" },
          { "gt",         "<Plug>(coc-type-definition)",       mode = "n",          noremap = true, silent = true, desc = "coc goto type definition" },
          { "gp",         "<Plug>(coc-peek-definition)",       mode = "n",          noremap = true, silent = true, desc = "coc goto peek definition" },
          { "[g",         "<Plug>(coc-diagnostic-prev)",       mode = "n",          noremap = true, silent = true, desc = "coc goto prev diagnostic" },
          { "]g",         "<Plug>(coc-diagnostic-next)",       mode = "n",          noremap = true, silent = true, desc = "coc goto next diagnostic" },
          { "<leader>rn", "<Plug>(coc-rename)",                mode = "n",          noremap = true, silent = true, desc = "coc rename" },
          { "<F2>",       "<Plug>(coc-rename)",                mode = "n",          noremap = true, silent = true, desc = "coc rename" },
          { "<leader>/",  "<Cmd>call CocAction('format')<CR>", mode = { "n", "x" }, noremap = true, silent = true, desc = "coc format" },
          {
            "K",
            function()
              local cw = vim.fn.expand("<cword>")
              if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
                command("h " .. cw)
              elseif vim.api.nvim_eval("coc#rpc#ready()") then
                vim.fn.CocActionAsync("doHover")
              else
                command("!" .. vim.o.keywordprg .. " " .. cw)
              end
            end,
            mode = "n",
            noremap = true,
            silent = true,
            desc = "coc hover"
          },
        },
        branch = "release",
        init = function()
          -- Autocomplete for tab keyset
          function _G.check_back_space()
            local col = vim.fn.col(".") - 1
            return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
          end

          user_command("Eslint", "call CocAction('runCommand', 'eslint.executeAutofix')", {})
          -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
          augroup("CocGroup", {})
          autocmd("CursorHold", {
            group = "CocGroup",
            command = "silent call CocActionAsync('highlight')",
            desc = "Highlight symbol under cursor on CursorHold"
          })

          g.coc_global_extensions = {
            "coc-clangd",
            "coc-deno",
            "coc-docker",
            "coc-eslint",
            "coc-git",
            "coc-html",
            "coc-json",
            "coc-lua",
            "coc-markdownlint",
            "coc-marketplace",
            "coc-pairs",
            "coc-prettier",
            "coc-pyright",
            "coc-rust-analyzer",
            "coc-sh",
            "coc-sql",
            "coc-tailwindcss",
            "coc-toml",
            "coc-tsserver",
            "coc-vimlsp",
            "coc-xml",
            "coc-yaml",
          }

          -- autocmd BufWritePre *.go :call CocAction("runCommand", "editor.action.organizeImport")
          autocmd("BufWritePre", {
            pattern = "*.go",
            command = "silent call CocAction('runCommand', 'editor.action.organizeImport')",
          })
        end
      },
    },
    checker = { enabled = true },
  })
end

if not g.vscode then
  -- colorscheme("material")
  colorscheme("vscode")

  hl(0, "CocMenuSel", { bg = "#353535" })
  hl(0, "LineNr", { fg = "#505050" })
  hl(0, "FoldColumn", { fg = "#808080" })
  hl(0, "WhiteSpace", { fg = "#383838" })
  hl(0, "CursorLine", { bg = "#383838" })
end
