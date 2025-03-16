local user_command = vim.api.nvim_create_user_command
local colorscheme = vim.cmd.colorscheme
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local command = vim.api.nvim_command
local keyset = vim.keymap.set
local opt = vim.opt
local hl = vim.api.nvim_set_hl
local diagnostic = vim.diagnostic
local lsp = vim.lsp
local g = vim.g
opt.encoding = "utf-8"
-- opt.completeopt:append({ "noselect" })
-- opt.completeopt = { "menu", "menuone", "noselect" }

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
opt.cursorline = true
opt.ignorecase = true -- 大文字小文字を区別しない
opt.smartcase = true -- 検索文字に大文字がある場合は大文字小文字を区別
opt.incsearch = true -- インクリメンタルサーチ
opt.hlsearch = true -- 検索マッチテキストをハイライト
opt.hidden = true -- バッファを閉じる代わりに隠す（Undo履歴を残すため）
-- opt.switchbuf = "usetab" -- 新しく開く代わりにすでに開いてあるバッファを開く
opt.showmatch = true -- 対応する括弧などをハイライト表示する
opt.matchtime = 2 -- 対応括弧のハイライト表示を3秒にする

opt.clipboard = "unnamedplus"
-- opt.clipboard = "unnamed"
opt.updatetime = 300
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
opt.list = true -- 不可視文字の可視化
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
opt.modifiable = true
opt.backup = false
opt.writebackup = false

opt.expandtab = true -- タブをスペースにする
opt.tabstop = 2
opt.shiftwidth = 2
opt.conceallevel = 0

opt.autoindent = true
opt.smartindent = true

--- ufo ---
opt.foldcolumn = "1" -- '0' is not bad
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
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

g.netrw_liststyle = 1 -- " ファイルツリーの表示形式、1にするとls -laのような表示になります
g.netrw_banner = 0 -- " ヘッダを非表示にする
g.netrw_sizestyle = "H" -- " サイズを(K,M,G)で表示する
g.netrw_timefmt = "%Y/%m/%d(%a) %H:%M:%S" -- " 日付フォーマットを yyyy/mm/dd(曜日) hh:mm:ss で表示する
g.netrw_preview = 1 -- " プレビューウィンドウを垂直分割で表示する
g.mapleader = " "
g.maplocalleader = "\\"

vim.wo.wrap = false

keyset("n", "<ESC>", ":noh<CR>", { noremap = true, silent = true })
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
-- keyset("i", "<BS>", "<nop>", { noremap = true })
-- keyset("i", "<C-h>", "<BS>", { noremap = true })
keyset("i", "<C-l>", "<DEL>", { noremap = true })

keyset("t", "<C-j><C-j>", [[<C-\><C-n>]], { noremap = true })

keyset("n", "<C-c>", "<nop>", { noremap = true })
-- keyset("n", "<Up>", "<nop>", { noremap = true })
-- keyset("n", "<Down>", "<nop>", { noremap = true })
-- keyset("n", "<Left>", "<nop>", { noremap = true })
-- keyset("n", "<Right>", "<nop>", { noremap = true })
-- keyset("n", "<C-[>", "<nop>", { noremap = true })
-- keyset("n", "<Esc>", "<nop>", { noremap = true })

-- 引用符で囲まれた箇所全体を選択する
for _, quote in ipairs({ '"', "'", "`" }) do
  keyset({ "x", "o" }, "a" .. quote, "2i" .. quote)
end

keyset("n", "<leader>*", "*''cgn")
keyset("x", "<leader>r", 'y:%s/<C-r><C-r>"//g<Left><Left>')
keyset("n", "<leader>r", 'yiw:%s/<C-r><C-r>"//g<Left><Left>')

user_command("Q", ":q", {})
user_command("W", ":w", {})
user_command("X", ":x", {})
user_command("Wq", ":x", {})
user_command("WQ", ":x", {})
user_command("LI", ":Lazy install", {})
user_command("LU", ":Lazy update", {})
user_command("LS", ":Lazy sync", {})
user_command("LC", ":Lazy clean", {})

autocmd("FileType", {
  callback = function()
    local bufnr = vim.fn.bufnr("%")
    keyset("n", "e", function()
      vim.api.nvim_command([[execute "normal! \<cr>"]])
      vim.api.nvim_command(bufnr .. "bd")
    end, { buffer = bufnr })
  end,
  pattern = "qf",
})

if not g.vscode then
  augroup("filetypes", {})
  autocmd({ "BufRead", "BufNewFile" }, { group = "filetypes", pattern = "*Dockerfile", command = "setfiletype dockerfile" })
  autocmd({ "BufRead", "BufNewFile" }, { group = "filetypes", pattern = { "*zshrc", "*zsh" }, command = "setfiletype zsh" })
  autocmd({ "BufRead", "BufNewFile" }, { group = "filetypes", pattern = "*.mjs", command = "setfiletype javascript" })
  autocmd({ "BufRead", "BufNewFile" }, { group = "filetypes", pattern = "*.csv", command = "setfiletype csv" })
  autocmd({ "BufRead", "BufNewFile" }, { group = "filetypes", pattern = ".env.*", command = "setfiletype sh" })
  autocmd({ "BufRead", "BufNewFile" }, { group = "filetypes", pattern = "*.json", command = "setfiletype jsonc" })
  autocmd("BufWritePre", { group = "filetypes", pattern = "*", command = ":%s/\\s\\+$//ge" })
  autocmd("BufWritePre", { group = "filetypes", pattern = "*", command = ":%s/\\r//ge" })

  augroup("indent", {})
  autocmd("FileType", {
    group = "indent",
    pattern = {
      "sh",
      "vue",
      "yaml",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "json",
      "html",
      "vim",
      "markdown",
      "lua",
    },
    command = "setlocal shiftwidth=2 tabstop=2",
  })
  autocmd("FileType", {
    group = "indent",
    pattern = { "python", "c" },
    command = "setlocal shiftwidth=4 tabstop=4",
  })
  autocmd("FileType", {
    group = "indent",
    pattern = { "go", "make" },
    command = "setlocal shiftwidth=4 tabstop=4 noexpandtab",
  })
end

if vim.fn.has("wsl") == 1 and not g.vscode then
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
      { out, "WarningMsg" },
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
      { "kylechui/nvim-surround", version = "*", opts = {} },
      {
        "terryma/vim-expand-region",
        lazy = false,
        keys = {
          {
            "v",
            "<Plug>(expand_region_expand)",
            mode = "v",
            noremap = true,
            silent = true,
            desc = "vim-expand-region expand",
          },
          {
            "<C-v>",
            "<Plug>(expand_region_shrink)",
            mode = "v",
            noremap = true,
            silent = true,
            desc = "vim-expand-region shrink",
          },
        },
      },
      { "machakann/vim-highlightedyank" },
      {
        "monaqa/dial.nvim",
        lazy = false,
        keys = {
          {
            "<C-a>",
            function()
              require("dial.map").manipulate("increment", "normal")
            end,
            mode = "n",
            noremap = true,
            silent = true,
          },
          {
            "<C-x>",
            function()
              require("dial.map").manipulate("decrement", "normal")
            end,
            mode = "n",
            noremap = true,
            silent = true,
          },
          {
            "g<C-a>",
            function()
              require("dial.map").manipulate("increment", "gnormal")
            end,
            mode = "n",
            noremap = true,
            silent = true,
          },
          {
            "g<C-x>",
            function()
              require("dial.map").manipulate("decrement", "gnormal")
            end,
            mode = "n",
            noremap = true,
            silent = true,
          },
          {
            "<C-a>",
            function()
              require("dial.map").manipulate("increment", "visual")
            end,
            mode = "v",
            noremap = true,
            silent = true,
          },
          {
            "<C-x>",
            function()
              require("dial.map").manipulate("decrement", "visual")
            end,
            mode = "v",
            noremap = true,
            silent = true,
          },
          {
            "g<C-a>",
            function()
              require("dial.map").manipulate("increment", "gvisual")
            end,
            mode = "v",
            noremap = true,
            silent = true,
          },
          {
            "g<C-x>",
            function()
              require("dial.map").manipulate("decrement", "gvisual")
            end,
            mode = "v",
            noremap = true,
            silent = true,
          },
        },
        config = function()
          local augend = require("dial.augend")
          require("dial.config").augends:register_group({
            -- default augends used when no group name is specified
            default = {
              augend.constant.alias.bool, -- boolean value (true <-> false)
              augend.semver.alias.semver,
              augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
              augend.integer.alias.decimal_int,
              augend.integer.alias.hex,
            },
          })
        end,
      },
      {
        "numToStr/Comment.nvim",
        opts = {},
        -- `gcc` - Toggles the current line using linewise comment
        -- `gbc` - Toggles the current line using blockwise comment
        -- `[count]gcc` - Toggles the number of line given as a prefix-count using linewise
        -- `[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
        -- `gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
        -- `gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment
        -- `gc` - Toggles the region using linewise comment
        -- `gb` - Toggles the region using blockwise comment
      },
      {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {
          highlight = {
            backdrop = true,
            matches = true,
            priority = 5000,
            groups = {
              match = "FlashMatch",
              current = "FlashCurrent",
              backdrop = "FlashBackdrop",
              label = "FlashLabel",
            },
            modes = {
              char = {
                jump_labels = true,
              },
            },
          },
        },
        -- stylua: ignore
        keys = {
          { "<leader>f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
          -- { "", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
          -- { "", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
          -- { "<leader>F", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
          -- { "", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
      },
    },
    checker = { enabled = true },
  })
  --------------------
  -- VSCode keymap ---
  --------------------

  ---@param mode string | string[]
  ---@param lhs string
  ---@param actions string | string[]
  ---@param opts table<string, string | boolean>
  local function vscmap(mode, lhs, actions, opts)
    opts.noremap = true
    opts.silent = true
    local vscode = require("vscode")
    ---@type fun():function
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

  -- vscmap("n", "gd", "editor.action.revealDefinition", { desc = "reveal definition" })
  vscmap("n", "gi", "editor.action.goToImplementation", { desc = "go to implementation" })
  vscmap("n", "gr", "editor.action.goToReferences", { desc = "go to references" })
  vscmap("n", "gt", "editor.action.goToTypeDefinition", { desc = "go to type definition" })
  vscmap("n", "gp", "editor.action.peekDefinition", { desc = "peek definition" })
  vscmap("n", "]g", "editor.action.marker.next", { desc = "marker next" })
  vscmap("n", "[g", "editor.action.marker.previous", { desc = "marker previous" })
  vscmap("n", "za", "editor.toggleFold", { desc = "toggle fold" })
  vscmap("n", "zr", "editor.unfoldAll", { desc = "unfold all" })
  vscmap("n", "zm", "editor.foldAll", { desc = "fold all" })

  vscmap("n", "<leader>rn", "editor.action.rename", { desc = "rename" })
  vscmap("n", "<leader>tr", "testing.runAtCursor", { desc = "test run at cursor" })
  vscmap("n", "<leader>dr", "testing.debugAtCursor", { desc = "test debug at cursor" })
  vscmap("n", "<leader>c", "editor.action.triggerSuggest", { desc = "trigger suggest" })
  vscmap("n", "<leader>a", "outline.focus", { desc = "'outline focus" })
  -- vscmap("n", "<C-p>", "workbench.action.quickOpen", { desc = "quick open" })
  vscmap("n", "<leader>p", "workbench.action.openRecent", { desc = "open recent" })
  vscmap("n", "<leader>m", "workbench.action.closePanel", { desc = "close panel" })
  vscmap("n", "<leader>n", "workbench.action.toggleSidebarVisibility", { desc = "toggle sidebar visibility" })
  vscmap("n", "<leader>/", { "editor.action.organizeImports", "editor.action.format" }, { desc = "organize imports" })

  keyset("n", "<C-w><C-h>", "<nop>", { noremap = true, silent = true })
  keyset("n", "<C-w><C-j>", "<nop>", { noremap = true, silent = true })
  keyset("n", "<C-w><C-k>", "<nop>", { noremap = true, silent = true })
  keyset("n", "<C-w><C-l>", "<nop>", { noremap = true, silent = true })

  vscmap("v", "gc", "editor.action.commentLine", { desc = "comment line" })
  vscmap("v", "gb", "editor.action.blockComment", { desc = "comment line" })
else
  require("lazy").setup({
    root = lazyroot,
    spec = {
      { "kylechui/nvim-surround", lazy = false, version = "*", opts = {} },
      { "tpope/vim-fugitive", lazy = false },
      {
        "mechatroner/rainbow_csv",
        lazy = false,
        init = function()
          g.rainbow_active = 0
          g.rainbow_conf = {
            guifgs = { "darkorange2", "orchid3", "seagreen3" },
            separately = { nerdtree = 0 },
          }
        end,
      },
      { "machakann/vim-highlightedyank", lazy = false },
      {
        "terryma/vim-expand-region",
        lazy = false,
        keys = {
          {
            "v",
            "<Plug>(expand_region_expand)",
            mode = "v",
            noremap = true,
            silent = true,
            desc = "vim-expand-region expand",
          },
          {
            "<C-v>",
            "<Plug>(expand_region_shrink)",
            mode = "v",
            noremap = true,
            silent = true,
            desc = "vim-expand-region shrink",
          },
        },
      },
      {
        "monaqa/dial.nvim",
        lazy = false,
        keys = {
          {
            "<C-a>",
            function()
              require("dial.map").manipulate("increment", "normal")
            end,
            mode = "n",
            noremap = true,
            silent = true,
          },
          {
            "<C-x>",
            function()
              require("dial.map").manipulate("decrement", "normal")
            end,
            mode = "n",
            noremap = true,
            silent = true,
          },
          {
            "g<C-a>",
            function()
              require("dial.map").manipulate("increment", "gnormal")
            end,
            mode = "n",
            noremap = true,
            silent = true,
          },
          {
            "g<C-x>",
            function()
              require("dial.map").manipulate("decrement", "gnormal")
            end,
            mode = "n",
            noremap = true,
            silent = true,
          },
          {
            "<C-a>",
            function()
              require("dial.map").manipulate("increment", "visual")
            end,
            mode = "v",
            noremap = true,
            silent = true,
          },
          {
            "<C-x>",
            function()
              require("dial.map").manipulate("decrement", "visual")
            end,
            mode = "v",
            noremap = true,
            silent = true,
          },
          {
            "g<C-a>",
            function()
              require("dial.map").manipulate("increment", "gvisual")
            end,
            mode = "v",
            noremap = true,
            silent = true,
          },
          {
            "g<C-x>",
            function()
              require("dial.map").manipulate("decrement", "gvisual")
            end,
            mode = "v",
            noremap = true,
            silent = true,
          },
        },
        config = function()
          local augend = require("dial.augend")
          require("dial.config").augends:register_group({
            -- default augends used when no group name is specified
            default = {
              augend.constant.alias.bool, -- boolean value (true <-> false)
              augend.semver.alias.semver,
              augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
              augend.integer.alias.decimal_int,
              augend.integer.alias.hex,
            },
          })
        end,
      },
      { "numToStr/Comment.nvim", lazy = true, opts = {} },
      {
        "folke/flash.nvim",
        lazy = true,
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {
          highlight = {
            backdrop = true,
            matches = true,
            priority = 5000,
            groups = {
              match = "FlashMatch",
              current = "FlashCurrent",
              backdrop = "FlashBackdrop",
              label = "FlashLabel",
            },
            modes = {
              char = {
                jump_labels = true,
              },
            },
          },
        },
          -- stylua: ignore
          keys = {
            { "<leader>f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            -- { "<leader>f", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            -- { "", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            -- { "<leader>f", mode = {  "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            -- { "", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
          },
      },
      {
        "iamcco/markdown-preview.nvim",
        lazy = true,
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        keys = {
          {
            "<C-s>",
            "<Plug>MarkdownPreviewToggle",
            mode = "n",
            noremap = true,
            silent = true,
            desc = "markdown-preview toggle",
          },
        },
        build = function()
          require("lazy").load({ plugins = { "markdown-preview.nvim" } })
          vim.fn["mkdp#util#install"]()
        end,
      },
      {
        "simeji/winresizer",
        lazy = false,
        init = function()
          g.winresizer_start_key = "<leader>e"
        end,
      },
      {
        "yorickpeterse/nvim-window",
        lazy = false,
        keys = {
          {
            "<Leader>w",
            function()
              require("nvim-window").pick()
            end,
            mode = "n",
            noremap = true,
            silent = true,
            desc = "nvim-window",
          },
        },
      },
      {
        "romgrk/barbar.nvim",
        lazy = false,
        dependencies = {
          "lewis6991/gitsigns.nvim",
          "nvim-tree/nvim-web-devicons",
        },
      },
      {
        "lewis6991/gitsigns.nvim",
        lazy = true,
        opts = {
          on_attach = function(bufnr)
            local gs = require("gitsigns")
            local ln = vim.fn.line
            local normal = vim.cmd.normal

            ---@param mode string | string[]
            ---@param l string
            ---@param r string | function
            ---@param opts table<string, string | boolean>
            local function map(mode, l, r, opts)
              opts = opts or {}
              opts.buffer = bufnr
              opts.noremap = true
              opts.silent = true
              keyset(mode, l, r, opts)
            end

            -- Navigation
            map("n", "]c", function()
              if vim.wo.diff then
                normal({ "]c", bang = true })
              else
                gs.nav_hunk("next")
              end
            end, { desc = "gitsigns navigation hunk next" })

            map("n", "[c", function()
              if vim.wo.diff then
                normal({ "[c", bang = true })
              else
                gs.nav_hunk("prev")
              end
            end, { desc = "gitsigns navigation hunk prev" })

            -- Actions
            map("n", "<leader>gs", gs.stage_hunk, { desc = "gitsigns stage_hunk" })
            map("n", "<leader>gr", gs.reset_hunk, { desc = "gitsigns reset_hunk" })
            map("v", "<leader>gs", function()
              gs.stage_hunk({ ln("."), ln("v") })
            end, { desc = "gitsigns stage_hunk" })
            map("v", "<leader>gr", function()
              gs.reset_hunk({ ln("."), ln("v") })
            end, { desc = "gitsigns reset_hunk" })
            map("n", "<leader>gS", gs.stage_buffer, { desc = "gitsigns stage_buffer" })
            map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "gitsigns undo_stage_hunk" })
            map("n", "<leader>gR", gs.reset_buffer, { desc = "gitsigns reset_buffer" })
            map("n", "<leader>gp", gs.preview_hunk, { desc = "gitsigns preview_hunk" })
            map("n", "<leader>gb", function()
              gs.blame_line({ full = true })
            end, { desc = "gitsigns blame_line" })
            map("n", "<leader>gtb", gs.toggle_current_line_blame, { desc = "gitsigns toggle_current_line_blame" })
            map("n", "<leader>gd", gs.diffthis, { desc = "gitsigns diffthis" })
            map("n", "<leader>gD", function()
              gs.diffthis("~")
            end, { desc = "gitsigns diffthis" })
            map("n", "<leader>gtd", gs.toggle_deleted, { desc = "gitsigns toggle_deleted" })

            -- Text object
            map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "gitsigns select hunk" })
          end,
        },
      },
      {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
          options = {
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
          },
        },
      },
      {
        "shellRaining/hlchunk.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
          require("hlchunk").setup({
            indent = {
              enable = true,
              chars = { "▏" },
              style = {
                vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
              },
            },
            blank = {
              chars = {
                "․",
              },
              style = {
                { vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"), "" },
              },
            },
          })
        end,
      },
      -- {
      --   "lukas-reineke/indent-blankline.nvim",
      --   main = "ibl",
      --   ---@module "ibl"
      --   ---@type ibl.config
      --   config = function()
      --     require("ibl").setup({
      --       exclude = {
      --         filetypes = {
      --           "checkhealth",
      --           "dashboard",
      --           "help",
      --           "man",
      --           "lspinfo",
      --         },
      --       },
      --       indent = {
      --         highlight = { "WhiteSpace" },
      --         char = "▏",
      --       },
      --       scope = { enabled = false },
      --     })
      --   end,
      -- },
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
              "awk",
              "bash",
              "c",
              "cpp",
              "css",
              "dockerfile",
              "editorconfig",
              "git_config",
              "git_rebase",
              "gitattributes",
              "gitcommit",
              "gitignore",
              "go",
              "gosum",
              "gotmpl",
              "gowork",
              "hcl",
              "html",
              "http",
              "java",
              "javascript",
              "jq",
              "jsdoc",
              "json",
              "json5",
              "jsonc",
              "lua",
              "luadoc",
              "markdown",
              "markdown_inline",
              "mermaid",
              "nginx",
              "passwd",
              "php",
              "phpdoc",
              "python",
              "regex",
              "rust",
              "scss",
              "sql",
              "toml",
              "tsv",
              "typescript",
              "vim",
              "vimdoc",
              "xml",
              "yaml",
              "zig",
            },
            sync_install = true,
            auto_install = false,
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
        end,
      },
      { "nvim-treesitter/nvim-treesitter-context", lazy = true, opts = {} },
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
          {
            "<leader>n",
            ":Neotree toggle<CR>",
            mode = "n",
            noremap = true,
            silent = true,
            desc = "neo-tree toggle",
          },
          {
            "<leader>h",
            ":Neotree toggle reveal<CR>",
            mode = "n",
            noremap = true,
            silent = true,
            desc = "neo-tree toggle reveal",
          },
        },
        opts = {
          window = {
            mappings = {
              ["l"] = "open",
            },
          },
          filesystem = {
            filtered_items = {
              visible = true,
              hide_dotfiles = false,
              hide_gitignored = false,
              hide_by_name = {
                "package-lock.json",
              },
              never_show = { ".git" },
            },
          },
          -- event_handlers = {
          --   {
          --     event = "file_open_requested",
          --     handler = function()
          --       -- auto close
          --       -- vim.cmd("Neotree close")
          --       -- OR
          --       require("neo-tree.command").execute({ action = "close" })
          --     end,
          --   },
          -- },
        },
      },
      {
        "akinsho/toggleterm.nvim",
        lazy = false,
        version = "*",
        keys = {
          {
            "<Esc><Esc>",
            "<C-\\><C-n>",
            mode = "t",
            noremap = true,
            silent = true,
            desc = "terminal leave insert mode",
          },
        },
        opts = {
          open_mapping = [[<c-t>]],
          insert_mappings = false,
        },
      },
      {
        "rcarriga/nvim-dap-ui",
        lazy = true,
        dependencies = {
          "mfussenegger/nvim-dap",
          "nvim-neotest/nvim-nio",
          "leoluz/nvim-dap-go",
          "mxsdev/nvim-dap-vscode-js",
          {
            "microsoft/vscode-js-debug",
            lazy = true,
            build = "npm install --legacy-peer-deps && git checkout package-lock.json && npx gulp vsDebugServerBundle && mv dist out",
            config = function()
              local function get_js_debug()
                local path = vim.fn.stdpath("data")
                return path .. "/lazy/vscode-js-debug"
              end
              require("dap-vscode-js").setup({
                node_path = "node",
                debugger_path = get_js_debug(),
                adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
              })

              for _, language in ipairs({ "typescript", "javascript" }) do
                require("dap").configurations[language] = {
                  {
                    type = "pwa-node",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                  },
                  {
                    type = "pwa-node",
                    request = "attach",
                    name = "Attach",
                    processId = require("dap.utils").pick_process,
                    cwd = "${workspaceFolder}",
                  },
                  {
                    type = "pwa-node",
                    request = "launch",
                    name = "Debug Jest Tests",
                    -- trace = true, -- include debugger info
                    runtimeExecutable = "node",
                    runtimeArgs = {
                      "./node_modules/jest/bin/jest.js",
                      "--runInBand",
                    },
                    rootPath = "${workspaceFolder}",
                    cwd = "${workspaceFolder}",
                    console = "integratedTerminal",
                    internalConsoleOptions = "neverOpen",
                  },
                  {
                    type = "pwa-chrome",
                    name = "Attach - Remote Debugging",
                    request = "attach",
                    program = "${file}",
                    cwd = vim.fn.getcwd(),
                    sourceMaps = true,
                    protocol = "inspector",
                    port = 9222, -- Start Chrome google-chrome --remote-debugging-port=9222
                    webRoot = "${workspaceFolder}",
                  },
                  {
                    type = "pwa-chrome",
                    name = "Launch Chrome",
                    request = "launch",
                    url = "http://localhost:5173", -- This is for Vite. Change it to the framework you use
                    webRoot = "${workspaceFolder}",
                    userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
                  },
                }
              end
              for _, language in ipairs({ "typescriptreact", "javascriptreact" }) do
                require("dap").configurations[language] = {
                  {
                    type = "pwa-chrome",
                    name = "Attach - Remote Debugging",
                    request = "attach",
                    program = "${file}",
                    cwd = vim.fn.getcwd(),
                    sourceMaps = true,
                    protocol = "inspector",
                    port = 9222, -- Start Chrome google-chrome --remote-debugging-port=9222
                    webRoot = "${workspaceFolder}",
                  },
                  {
                    type = "pwa-chrome",
                    name = "Launch Chrome",
                    request = "launch",
                    url = "http://localhost:5173", -- This is for Vite. Change it to the framework you use
                    webRoot = "${workspaceFolder}",
                    userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
                  },
                }
              end
            end,
          },
        },
        init = function()
          local dap, dapui = require("dap"), require("dapui")
          vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
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
                { id = "scopes", size = 0.25 },
                { id = "breakpoints", size = 0.25 },
                { id = "stacks", size = 0.25 },
                { id = "watches", size = 0.25 },
              },
              position = "left",
              size = 60,
            },
            {
              elements = {
                { id = "repl", size = 0.5 },
                { id = "console", size = 0.5 },
              },
              position = "bottom",
              size = 15,
            },
          },
        },
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
          {
            "<leader>tr",
            function()
              require("neotest").run.run()
            end,
            mode = "n",
            noremap = true,
            silent = true,
            desc = "run test at cursor",
          },
          {
            "<leader>tf",
            function()
              require("neotest").run.run(vim.fn.expand("%"))
            end,
            mode = "n",
            noremap = true,
            silent = true,
            desc = "run test file",
          },
          {
            "<leader>tp",
            function()
              require("neotest").output_panel.toggle()
            end,
            mode = "n",
            noremap = true,
            silent = true,
            desc = "neotest toggle output pannel",
          },
          {
            "<leader>to",
            function()
              require("neotest").output.open({ enter = true })
            end,
            mode = "n",
            noremap = true,
            silent = true,
            desc = "neotest open output",
          },
          {
            "<leader>ts",
            function()
              require("neotest").summary.toggle()
            end,
            mode = "n",
            noremap = true,
            silent = true,
            desc = "neotest toggle summary",
          },
          {
            "<leader>dr",
            function()
              require("neotest").run.run({ strategy = "dap" })
            end,
            mode = "n",
            noremap = true,
            silent = true,
            desc = "neotest run debug",
          },
          {
            "<leader>db",
            function()
              require("dap").toggle_breakpoint()
            end,
            mode = "n",
            noremap = true,
            silent = true,
            desc = "dap toggle breakpoint",
          },
          {
            "<leader>du",
            function()
              require("dapui").toggle()
            end,
            mode = "n",
            noremap = true,
            silent = true,
            desc = "dap toggle nvim-dap-ui",
          },
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
              open_on_run = true,
            },
          })
        end,
      },
      {
        "folke/which-key.nvim",
        lazy = false,
        keys = {
          {
            "<leader>?",
            function()
              require("which-key").show({ global = false })
            end,
            mode = "n",
            noremap = true,
            silent = true,
            desc = "Buffer Local Keymaps (which-key)",
          },
        },
      },
      { "petertriho/nvim-scrollbar", opts = {} },
      {
        "kevinhwang91/nvim-ufo",
        lazy = false,
        dependencies = { "kevinhwang91/promise-async" },
        keys = {
          {
            "zR",
            function()
              require("ufo").openAllFolds()
            end,
            mode = "n",
            noremap = true,
            silent = true,
            desc = "open all folds",
          },
          {
            "zM",
            function()
              require("ufo").closeAllFolds()
            end,
            mode = "n",
            noremap = true,
            silent = true,
            desc = "close all folds",
          },
          {
            "zr",
            function()
              require("ufo").openFoldsExceptKinds()
            end,
            mode = "n",
            noremap = true,
            silent = true,
            desc = "open folds except kinds",
          },
          {
            "zm",
            function()
              require("ufo").closeFoldsWith()
            end,
            mode = "n",
            noremap = true,
            silent = true,
            desc = "close folds with",
          },
        },
        opts = {
          provider_selector = function()
            return { "treesitter", "indent" }
          end,
        },
      },
      {
        "luukvbaal/statuscol.nvim",
        lazy = false,
        config = function()
          local builtin = require("statuscol.builtin")
          require("statuscol").setup({
            relculright = true,
            segments = {
              { text = { "%s " }, click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
              { text = { builtin.foldfunc, "  " }, click = "v:lua.ScFa" },
            },
          })
        end,
      },
      { "sindrets/diffview.nvim", lazy = true },

      {
        "linrongbin16/gitlinker.nvim",
        lazy = true,
        keys = {
          {
            "<leader>gl",
            "<cmd>GitLink<cr>",
            mode = { "n", "v" },
            silent = true,
            noremap = true,
            desc = "Yank git permlink",
          },
          {
            "<leader>gL",
            "<cmd>GitLink!<cr>",
            mode = { "n", "v" },
            silent = true,
            noremap = true,
            desc = "Open git permlink",
          },
        },
        opts = {},
      },
      {
        "norcalli/nvim-colorizer.lua",
        config = function()
          require("colorizer").setup()
        end,
      },
      {
        "folke/todo-comments.nvim",
        lazy = true,
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
      },
      {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        config = function()
          local logo = [[
  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
  ]]

          require("dashboard").setup({
            theme = "hyper",
            config = {
              header = vim.split(logo, "\n"),
            },
          })
        end,
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
      },
      {
        "ahmedkhalf/project.nvim",
        lazy = true,
        keys = {
          {
            "<leader>p",
            function()
              require("telescope").extensions.projects.projects({})
            end,
            mode = "n",
            noremap = true,
            silent = true,
            desc = "telescope find project",
          },
        },
        config = function()
          require("project_nvim").setup({})
        end,
        init = function()
          require("telescope").load_extension("projects")
        end,
      },
      {
        "bassamsdata/namu.nvim",
        config = function()
          require("namu").setup({
            -- Enable the modules you want
            namu_symbols = {
              enable = true,
              options = {}, -- here you can configure namu
            },
            -- Optional: Enable other modules if needed
            ui_select = { enable = false }, -- vim.ui.select() wrapper
            colorscheme = {
              enable = false,
              options = {
                -- NOTE: if you activate persist, then please remove any vim.cmd("colorscheme ...") in your config, no needed anymore
                persist = true, -- very efficient mechanism to Remember selected colorscheme
                write_shada = false, -- If you open multiple nvim instances, then probably you need to enable this
              },
            },
          })
          -- === Suggested Keymaps: ===
          vim.keymap.set("n", "<leader>a", ":Namu symbols<cr>", {
            desc = "Jump to LSP symbol",
            silent = true,
          })
          -- vim.keymap.set("n", "<leader>th", ":Namu colorscheme<cr>", {
          --   desc = "Colorscheme Picker",
          --   silent = true,
          -- })
        end,
      },
      { "nvim-telescope/telescope-fzf-writer.nvim", lazy = true },
      { "nvim-telescope/telescope-ui-select.nvim", lazy = true },
      {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        dependencies = {
          "nvim-lua/plenary.nvim",
        },
        keys = {
          {
            "<C-p>",
            function()
              require("telescope.builtin").find_files()
            end,
            mode = "n",
            noremap = true,
            silent = true,
            desc = "telescope find files",
          },
          {
            "<leader>l",
            function()
              require("telescope.builtin").live_grep()
            end,
            mode = "n",
            noremap = true,
            silent = true,
            desc = "telescope live grep",
          },
          -- keyset("n", "<leader>pb", builtin.buffers, { noremap = true, silent = true, desc = "telescope buffers" })
          -- keyset("n", "<leader>h", builtin.help_tags, { noremap = true, silent = true })
        },
        version = "0.1.8",
        config = function()
          require("telescope").setup({
            extensions = {
              fzf_writer = {
                minimum_grep_characters = 2,
                minimum_files_characters = 2,

                -- Disabled by default.
                -- Will probably slow down some aspects of the sorter, but can make color highlights.
                -- I will work on this more later.
                use_highlighter = true,
              },
              ["ui-select"] = {
                require("telescope.themes").get_dropdown({}),
              },
            },
          })
        end,
      },
      {
        "prochri/telescope-all-recent.nvim",
        lazy = true,
        dependencies = {
          "nvim-telescope/telescope.nvim",
          "kkharji/sqlite.lua",
          "stevearc/dressing.nvim",
        },
        opts = {},
      },
      { "wakatime/vim-wakatime", lazy = false },
      {
        "Aasim-A/scrollEOF.nvim",
        lazy = false,
        event = { "CursorMoved", "WinScrolled" },
        opts = {},
      },
      {
        "windwp/nvim-autopairs",
        lazy = true,
        event = "InsertEnter",
        config = true,
        opts = {
          disable_filetype = { "TelescopePrompt", "spectre_panel" },
          disable_in_macro = true, -- disable when recording or executing a macro
          disable_in_visualblock = false, -- disable when insert after visual block mode
          disable_in_replace_mode = true,
          ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
          enable_moveright = true,
          enable_afterquote = true, -- add bracket pairs after quote
          enable_check_bracket_line = true, --- check bracket in same line
          enable_bracket_in_quote = true, --
          enable_abbr = false, -- trigger abbreviation
          break_undo = true, -- switch for basic rule break undo sequence
          check_ts = false,
          map_cr = true,
          map_bs = true, -- map the <BS> key
          map_c_h = true, -- Map the <C-h> key to delete a pair
          map_c_w = true, -- map <c-w> to delete a pair if possible
        },
      },
      {
        "github/copilot.vim",
        lazy = false,
      },
      {
        "hrsh7th/nvim-cmp",
        lazy = false,
        dependencies = {
          "hrsh7th/cmp-nvim-lsp",
          "nvim-lua/plenary.nvim",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-path",
          "hrsh7th/cmp-cmdline",
          "onsails/lspkind.nvim",
        },
        config = function()
          local cmp = require("cmp")
          local lspkind = require("lspkind")
          local has_words_before = function()
            if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
              return false
            end
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
          end
          require("cmp").setup({
            preselect = cmp.PreselectMode.None,
            completion = {
              completeopt = "menu,menuone,noinsert",
            },
            sources = {
              { name = "nvim_lsp" },
              { name = "buffer" },
              { name = "path" },
            },
            window = {
              -- completion = cmp.config.window.bordered(),
              -- documentation = cmp.config.window.bordered(),
              completion = {
                winhighlight = "Normal:CmpMenu,FloatBorder:CmpMenu,CursorLine:PMenuSel,Search:None",
              },
              documentation = {
                winhighlight = "Normal:CmpDoc,FloatBorder:CmpDoc",
              },
            },
            mapping = cmp.mapping.preset.insert({
              ["<C-b>"] = cmp.mapping.scroll_docs(-4),
              ["<C-f>"] = cmp.mapping.scroll_docs(4),
              ["<C-Space>"] = cmp.mapping.complete(),
              ["<C-e>"] = cmp.mapping.abort(),
              ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
              -- ["<Tab>"] = vim.schedule_wrap(function(fallback)
              --   if cmp.visible() and has_words_before() then
              --     cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
              --   else
              --     fallback()
              --   end
              -- end),
            }),
            formatting = {
              format = lspkind.cmp_format({
                mode = "symbol_text", -- show only symbol annotations
                maxwidth = 100, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                -- show_labelDetails = true, -- show labelDetails in menu. Disabled by default
                symbol_map = { Copilot = "" },
              }),
            },
          })
        end,
        init = function()
          local cmp_autopairs = require("nvim-autopairs.completion.cmp")
          local cmp = require("cmp")
          cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

          -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
          cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
              { name = "buffer" },
            },
          })

          -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
          cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
              { name = "path" },
            }, {
              { name = "cmdline" },
            }),
            matching = { disallow_symbol_nonprefix_matching = false },
          })
        end,
      },
      {
        "nvimdev/lspsaga.nvim",
        lazy = false,
        config = function()
          require("lspsaga").setup({
            lightbulb = {
              enable = false,
            },
            code_action_lightbulb = {
              enable = true,
            },
            rename = {
              keys = {
                quit = "<esc>",
              },
            },
          })
        end,
        dependencies = {
          "nvim-treesitter/nvim-treesitter", -- optional
          "nvim-tree/nvim-web-devicons", -- optional
        },
        keys = {
          -- { "K", "<cmd>Lspsaga hover_doc<CR>", mode = "n", noremap = true, silent = true, desc = "lspsaga hover" },
          { "gp", "<cmd>Lspsaga peek_definition<CR>", mode = "n", noremap = true, silent = true, desc = "lspsage peek definition" },
          { "<leader>rn", "<cmd>Lspsaga rename<CR>", mode = "n", noremap = true, silent = true, desc = "lspsage rename" },
          { "<F2>", "<cmd>Lspsaga rename<CR>", mode = "n", noremap = true, silent = true, desc = "lspsage rename" },
          { "ga", "<cmd>Lspsaga code_action<CR>", mode = "n", noremap = true, silent = true, desc = "lspsaga code action" },
          { "g]", "<cmd>Lspsaga diagnostic_jump_next<CR>", mode = "n", noremap = true, silent = true, desc = "lspsaga diagnostic next" },
          { "g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", mode = "n", noremap = true, silent = true, desc = "lspsaga diagnostic prev" },
        },
      },
      { "williamboman/mason.nvim", lazy = false, opts = {} },
      {
        "neovim/nvim-lspconfig",
        dependencies = {
          "williamboman/mason-lspconfig.nvim",
        },
        lazy = false,
        keys = {
          { "K", lsp.buf.hover, mode = "n", noremap = true, silent = true, desc = "lsp hover" },
          { "<leader>/", lsp.buf.format, mode = "n", noremap = true, silent = true, desc = "lsp format" },
          { "gr", lsp.buf.references, mode = "n", noremap = true, silent = true, desc = "lsp references" },
          { "gd", lsp.buf.definition, mode = "n", noremap = true, silent = true, desc = "lsp definition" },
          { "gD", lsp.buf.declaration, mode = "n", noremap = true, silent = true, desc = "lsp declaration" },
          { "gi", lsp.buf.implementation, mode = "n", noremap = true, silent = true, desc = "lsp implementation" },
          { "gt", lsp.buf.type_definition, mode = "n", noremap = true, silent = true, desc = "lsp type definition" },
          { "ge", diagnostic.open_float, mode = "n", noremap = true, silent = true, desc = "lsp diagnostic open float" },
          -- { "<leader>rn", lsp.buf.rename, mode = "n", noremap = true, silent = true, desc = "lsp rename" },
          -- { "ga", lsp.buf.code_action, mode = "n", noremap = true, silent = true, desc = "lsp code action" },
          -- { "g]", diagnostic.goto_next, mode = "n", noremap = true, silent = true, desc = "lsp diagnostic next" },
          -- { "g[", diagnostic.goto_prev, mode = "n", noremap = true, silent = true, desc = "lsp diagnostic prev" },
        },
        config = function()
          local lspconfig = require("lspconfig")
          local capabilities = require("cmp_nvim_lsp").default_capabilities()

          require("mason-lspconfig").setup_handlers({
            function(server_name)
              lspconfig[server_name].setup({
                capabilities = capabilities,
              })
            end,
          })

          require("mason-lspconfig").setup({
            ensure_installed = {
              "bashls",
              "biome",
              "cssls",
              "denols",
              -- "eslint",
              "gopls",
              "html",
              "jdtls",
              "jqls",
              "jsonls",
              "kotlin_language_server",
              "lua_ls",
              "marksman",
              "pyright",
              "ruby_lsp",
              "rust_analyzer",
              "sorbet",
              "sqlls",
              "taplo",
              "terraformls",
              "tflint",
              "ts_ls",
              "vimls",
              "yamlls",
            },
          })

          lspconfig.gopls.setup({
            settings = {
              gopls = {
                analyses = {
                  unusedparams = true,
                },
                staticcheck = true,
                gofumpt = true,
                -- ["ui.completion.usePlaceholders"] = true,
                -- ["ui.inlayhint.hints"] = {
                --   assignVariablesTypes = true,
                --   compositeLiteralFields = true,
                --   compositeLiteralTypes = true,
                --   constantValues = true,
                --   functionTypeParameters = true,
                --   parameterNames = true,
                --   rangeVariableTypes = true,
                -- },
              },
            },
            init_options = {
              usePlaceholders = true,
            },
          })

          lspconfig.lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
                format = {
                  enable = false,
                },
              },
            },
          })

          -- lspconfig.eslint.setup({
          --   on_attach = function(client, bufnr)
          --     autocmd("BufWritePre", {
          --       buffer = bufnr,
          --       command = "EslintFixAll",
          --     })
          --   end,
          -- })

          local is_node_dir = function()
            return lspconfig.util.root_pattern("package.json")(vim.fn.getcwd())
          end

          lspconfig.ts_ls.setup({
            on_attach = function(client)
              if not is_node_dir() then
                client.stop(true)
              end
            end,
          })

          lspconfig.denols.setup({
            on_attach = function(client)
              if is_node_dir() then
                client.stop(true)
              end
            end,
          })

          lspconfig.yamlls.setup({
            settings = {
              yaml = {
                format = {
                  enable = true,
                },
                schemaStore = {
                  enable = true,
                },
              },
            },
          })

          lspconfig.taplo.setup({
            filetypes = { "toml" },
            -- IMPORTANT: this is required for taplo LSP to work in non-git repositories
            root_dir = require("lspconfig.util").root_pattern("*.toml", ".git"),
          })

          lspconfig.sqlls.setup({})
        end,
        init = function()
          if lsp.inlay_hint then
            lsp.inlay_hint.enable(true, { 0 })
          end

          local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
          for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
          end

          -- format on save
          autocmd("BufWritePre", {
            callback = function()
              lsp.buf.format({ async = false })
            end,
          })

          -- disable diagnostics virtualtext
          diagnostic.config({
            virtual_text = false,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = false,
          })

          -- diagnostics hover text
          autocmd("CursorHold", {
            callback = function()
              local opts = {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                border = "none",
                source = "always",
                prefix = " ",
                scope = "cursor",
              }
              diagnostic.open_float(nil, opts)
            end,
          })
        end,
      },

      {
        "jay-babu/mason-null-ls.nvim",
        lazy = false,
        dependencies = {
          "nvimtools/none-ls.nvim",
          "nvimtools/none-ls-extras.nvim",
          "gbprod/none-ls-shellcheck.nvim",
        },
        config = function()
          require("mason-null-ls").setup({
            ensure_installed = {
              "goimports",
              "hadolint",
              "isort",
              "jq",
              "markdownlint",
              "stylua",
              "shellcheck",
              "shfmt",
              "sql-formatter",
              -- "prettier",
              "black",
              "biome",
              "xmlformatter",
            },
          })
          local null_ls = require("null-ls")
          null_ls.setup({
            sources = {
              null_ls.builtins.formatting.stylua,
              null_ls.builtins.formatting.goimports,
              null_ls.builtins.formatting.isort,
              null_ls.builtins.formatting.black,
              null_ls.builtins.formatting.shfmt,
              null_ls.builtins.formatting.sql_formatter,
              null_ls.builtins.formatting.biome.with({
                condition = function(utils)
                  return utils.root_has_file({ "biome.json", "biome.jsonc" })
                end,
              }),
              -- null_ls.builtins.formatting.prettier.with({
              --   condition = function(utils)
              --     return utils.root_has_file({
              --       ".prettierrc",
              --       ".prettierrc.json",
              --       ".prettierrc.yml",
              --       ".prettierrc.yaml",
              --       ".prettierrc.json5",
              --       ".prettierrc.js",
              --       ".prettierrc.cjs",
              --       ".prettierrc.toml",
              --       "prettier.config.js",
              --       "prettier.config.cjs",
              --     })
              --   end,
              -- }),
              null_ls.builtins.diagnostics.markdownlint,
              null_ls.builtins.completion.spell,
              null_ls.builtins.diagnostics.hadolint,
              require("none-ls-shellcheck.diagnostics"),
              require("none-ls-shellcheck.code_actions"),
              -- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
            },
          })
        end,
      },
      { "projekt0n/github-nvim-theme", name = "github-theme", lazy = false },
    },
    checker = { enabled = true, notify = false },
  })

  colorscheme("github_dark_dimmed")

  hl(0, "NormalFloat", { bg = "#454545" })

  hl(0, "LineNr", { fg = "#505050" })
  hl(0, "FoldColumn", { fg = "#808080" })
  -- hl(0, "WhiteSpace", { fg = "#303030" })
  hl(0, "WhiteSpace", { fg = "#555555" })
  hl(0, "CursorLine", { bg = "#383838" })
  hl(0, "CocFloating", { bg = "#383838" })
  hl(0, "CocMenuSel", { bg = "#505050" })
  hl(0, "CmpMenu", { bg = "#353535" })
  hl(0, "CmpDoc", { bg = "#103010" })
  hl(0, "TreesitterContext", { bg = "#383838" })
  hl(0, "TreesitterContextBottom", { underline = true })
  hl(0, "TreesitterContextLineNumberBottom", { underline = true })
end
hl(0, "FlashMatch", { bg = "#AA0000" })
hl(0, "FlashBackdrop", { fg = "#AAAAAA" })
