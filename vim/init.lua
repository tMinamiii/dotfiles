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

user_command("Q", ":q", {})
user_command("W", ":w", {})
user_command("Wq", ":wq", {})
user_command("WQ", ":wq", {})
user_command("Term", ":bo terminal ++rows=20", {})

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

local sep = vim.loop.os_uname().sysname == "Windows_NT" and [[\]] or [[/]]
local function join(...)
  return table.concat({ ... }, sep)
end

local home = os.getenv "HOME"
local len = #home

local homepath = ""
local cachepath = ""
if g.vscode then
  homepath = join(home, ".config", "packer.vscode-nvim")
  cachepath = join(home, ".cache", "packer.vscode-nvim")
else
  homepath = join(home, ".config", "packer.nvim")
  cachepath = join(home, ".cache", "packer.nvim")
end

-- Add path locations for configuration
local rtp = { homepath, cachepath }

-- Add paths that dont start with home.
for _, p in ipairs(opt.runtimepath:get()) do
  if p:sub(1, len) ~= home then
    rtp[#rtp + 1] = p
  end
end

opt.runtimepath = rtp

-- Packer paths and files
local pack_path = join(cachepath, "site")
local package_root = join(pack_path, "pack")
local compile_path = join(cachepath, "plugin", "packer_compiled.lua")
g.loaded_remote_plugins = 1

opt.packpath:prepend(pack_path)

local packer_install_path = join(package_root, "packer", "start", "packer.nvim")

local ensure_packer = function()
  if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
    vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", packer_install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

if g.vscode then
  require("packer").startup {
    function(use)
      use "wbthomason/packer.nvim"

      use {
        "kylechui/nvim-surround",
        tag = "*",
        config = function()
          require("nvim-surround").setup()
        end
      }

      use "terryma/vim-expand-region"

      use "machakann/vim-highlightedyank"

      use "rhysd/clever-f.vim"

      use "monaqa/dial.nvim"

      use {
        "smoka7/hop.nvim",
        tag = "*", -- optional but strongly recommended
        config = function()
          -- you can configure Hop the way you like here; see :h hop-config
          require "hop".setup { keys = "etovxqpdygfblzhckisuran" }
        end
      }

      use {
        "numToStr/Comment.nvim",
        config = function()
          require("Comment").setup()
        end
      }

      use "vscode-neovim/vscode-multi-cursor.nvim"
    end,
    config = {
      package_root = package_root,
      compile_path = compile_path,
    },
  }
else
  require("packer").startup {
    function(use)
      use "wbthomason/packer.nvim"

      use {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
      }

      use {
        "xiyaowong/transparent.nvim",
        config = function()
          require("transparent").setup({
            extra_groups = { "NeoTreeNormal", "NeoTreeNormalNC" },
          })
        end
      }

      use {
        "kylechui/nvim-surround",
        tag = "*",
        config = function()
          require("nvim-surround").setup()
        end
      }

      use 'Mofiqul/vscode.nvim'

      use "EdenEast/nightfox.nvim"

      use {
        "marko-cerovac/material.nvim",

        config = function()
          require("material").setup({
            contrast = {
              terminal = true,            -- Enable contrast for the built-in terminal
              sidebars = true,            -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
              floating_windows = true,    -- Enable contrast for floating windows
              cursor_line = true,         -- Enable darker background for the cursor line
              lsp_virtual_text = true,    -- Enable contrasted background for lsp virtual text
              non_current_windows = true, -- Enable contrasted background for non-current windows
              filetypes = {},             -- Specify which filetypes get the contrasted (darker) background
            },
            plugins = {                   -- Uncomment the plugins that you use to highlight them
              -- Available plugins:
              "coc",
              -- "colorful-winsep",
              "dap",
              -- "dashboard",
              -- "eyeliner",
              -- "fidget",
              -- "flash",
              "gitsigns",
              -- "harpoon",
              "hop",
              -- "illuminate",
              -- "indent-blankline",
              -- "lspsaga",
              -- "mini",
              -- "neogit",
              "neotest",
              "neo-tree",
              -- "neorg",
              -- "noice",
              -- "nvim-cmp",
              -- "nvim-navic",ff
              -- "nvim-tree",
              "nvim-web-devicons",
              "rainbow-delimiters",
              -- "sneak",
              "telescope",
              -- "trouble",
              -- "which-key",
              -- "nvim-notify",
            },
          })
        end
      }

      use "terryma/vim-expand-region"

      use "machakann/vim-highlightedyank"

      use "rhysd/clever-f.vim"

      use "monaqa/dial.nvim"

      use {
        "smoka7/hop.nvim",
        tag = "*", -- optional but strongly recommended
        config = function()
          -- you can configure Hop the way you like here; see :h hop-config
          require "hop".setup { keys = "etovxqpdygfblzhckisuran" }
        end
      }

      use {
        "numToStr/Comment.nvim",
        config = function()
          require("Comment").setup()
        end
      }

      use "simeji/winresizer"

      use "yorickpeterse/nvim-window"

      use { "romgrk/barbar.nvim", requires = { "nvim-tree/nvim-web-devicons", "lewis6991/gitsigns.nvim", opt = true } }

      use "terryma/vim-multiple-cursors"

      use "tpope/vim-fugitive"

      use {
        "lewis6991/gitsigns.nvim",
        config = function()
          require("gitsigns").setup {
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
              end)

              map("n", "[c", function()
                if vim.wo.diff then
                  vim.cmd.normal({ "[c", bang = true })
                else
                  gitsigns.nav_hunk("prev")
                end
              end)

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
              map("n", "<leader>gb", gitsigns.toggle_current_line_blame, { desc = "gitsigns toggle_current_line_blame" })
              map("n", "<leader>gtb", gitsigns.diffthis, { desc = "gitsigns diffthis" })
              map("n", "<leader>gD", function() gitsigns.diffthis("~") end, { desc = "gitsigns diffthis" })
              map("n", "<leader>gtd", gitsigns.toggle_deleted, { desc = "gitsigns toggle_deleted" })

              -- Text object
              map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
            end
          }
        end
      }

      use {
        "nvim-lualine/lualine.nvim",
        requires = {
          "nvim-tree/nvim-web-devicons",
          opt = true,
        },
        config = function()
          ---------------
          --- lualine ---
          ---------------
          require("lualine").setup({
            options = {
              component_separators = { left = "", right = "" },
              section_separators = { left = "", right = "" },
            },
          })
        end

      }

      use "mechatroner/rainbow_csv"

      use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
          require("ibl").setup({
            indent = {
              highlight = { "IndentBlankLine" },
              char = "▏",
            },
            scope = { enabled = false },
          })
        end
      }

      use { "nvim-treesitter/nvim-treesitter",
        run = function()
          local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
          ts_update()
        end,
        config = function()
          require("nvim-treesitter.configs").setup {
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
        },
        config = function()
          require("neo-tree").setup({
            window = {
              mappings = {
                ["l"] = "open",
              }
            }
          })
        end
      }

      use {
        "stevearc/aerial.nvim",
        config = function()
          require("aerial").setup({
            layout = {
              max_width = { 60, 0.3 },
              min_width = 40,
            },
          })
        end,
      }

      use {
        "akinsho/toggleterm.nvim",
        tag = '*',
        config = function()
          require("toggleterm").setup({
            open_mapping = [[<c-t>]],
          })
        end
      }

      use {
        "rcarriga/nvim-dap-ui",
        requires = {
          "mfussenegger/nvim-dap",
          "nvim-neotest/nvim-nio",
          "leoluz/nvim-dap-go",
          "mxsdev/nvim-dap-vscode-js",
        },
        config = function()
          require("dapui").setup({
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
          })
        end
      }

      use {
        "nvim-neotest/neotest",
        requires = {
          "nvim-neotest/nvim-nio",
          "nvim-lua/plenary.nvim",
          "antoinemadec/FixCursorHold.nvim",
          "nvim-treesitter/nvim-treesitter",
          "fredrikaverpil/neotest-golang",
          "thenbe/neotest-playwright",
          "nvim-telescope/telescope.nvim",
          "nvim-neotest/neotest-jest",
          "marilari88/neotest-vitest",
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
            }
          })
        end
      }

      use { "folke/which-key.nvim" }

      use {
        "petertriho/nvim-scrollbar",
        config = function()
          require("scrollbar").setup()
        end
      }

      use {
        'kevinhwang91/nvim-ufo',
        requires = 'kevinhwang91/promise-async',
        config = function()
          require("ufo").setup({
            provider_selector = function()
              return { "treesitter", "indent" }
            end,
          })
        end
      }

      use {
        "luukvbaal/statuscol.nvim",
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
        end,
      }

      use "sindrets/diffview.nvim"

      use { "nvim-telescope/telescope.nvim", tag = "0.1.8", requires = { "nvim-lua/plenary.nvim" } }

      use { "neoclide/coc.nvim", branch = "release", require = { "fannheyward/coc-marketplace" } }
    end,
    config = {
      package_root = package_root,
      compile_path = compile_path,
    },
  }
end

if g.vscode then
  -------------------------
  --- vim-expand-region ---
  -------------------------
  keyset("v", "v", "<Plug>(expand_region_expand)",
    { noremap = true, silent = true, desc = "vim-expand-region expand" })
  keyset("v", "<C-v>", "<Plug>(expand_region_shrink)",
    { noremap = true, silent = true, desc = "vim-expand-region shrink" })


  ------------
  --- dial ---
  ------------
  keyset("n", "<C-a>", function() require("dial.map").manipulate("increment", "normal") end)
  keyset("n", "<C-x>", function() require("dial.map").manipulate("decrement", "normal") end)
  keyset("n", "g<C-a>", function() require("dial.map").manipulate("increment", "gnormal") end)
  keyset("n", "g<C-x>", function() require("dial.map").manipulate("decrement", "gnormal") end)
  keyset("v", "<C-a>", function() require("dial.map").manipulate("increment", "visual") end)
  keyset("v", "<C-x>", function() require("dial.map").manipulate("decrement", "visual") end)
  keyset("v", "g<C-a>", function() require("dial.map").manipulate("increment", "gvisual") end)
  keyset("v", "g<C-x>", function() require("dial.map").manipulate("decrement", "gvisual") end)
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


  -----------
  --- hop ---
  -----------
  local hop = require("hop")
  local directions = require("hop.hint").HintDirection

  keyset("n", "<Leader>f", function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR })
  end, { noremap = true, silent = true, desc = "hop after" })

  keyset("n", "<Leader>F", function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR })
  end, { noremap = true, silent = true, desc = "hop before" })


  ---------------------------
  --- vscode-multi-cursor ---
  ---------------------------
  require("vscode-multi-cursor").setup { -- Config is optional
    -- Whether to set default mappings
    default_mappings = true,
    -- If set to true, only multiple cursors will be created without multiple selections
    no_selection = false
  }


  --------------------
  -- VSCode keymap ---
  --------------------
  keyset("n", "gd", "<Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>",
    { silent = true, desc = "editor.action.revealDefinition" })
  keyset("n", "gi", "<Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>",
    { silent = true, desc = "editor.action.goToImplementation" })
  keyset("n", "gr", "<Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>",
    { silent = true, desc = "editor.action.goToReferences" })
  keyset("n", "gt", "<Cmd>call VSCodeNotify('editor.action.goToTypeDefinition')<CR>",
    { silent = true, desc = "editor.action.goToTypeDefinition" })
  keyset("n", "gp", "<Cmd>call VSCodeNotify('editor.action.peekDefinition')<CR>",
    { silent = true, desc = "editor.action.peekDefinition" })
  keyset("n", "]g", "<Cmd>call VSCodeNotify('editor.action.marker.next')<CR>",
    { silent = true, desc = "editor.action.marker.next" })
  keyset("n", "[g", "<Cmd>call VSCodeNotify('editor.action.marker.previous')<CR>",
    { silent = true, desc = "editor.action.marker.previous" })
  keyset("n", "za", "<Cmd>call VSCodeNotify('editor.toggleFold')<CR>",
    { silent = true, desc = "editor.toggleFold" })
  keyset("n", "zr", "<Cmd>call VSCodeNotify('editor.unfoldAll')<CR>",
    { silent = true, desc = "editor.unfoldAll" })
  keyset("n", "zm", "<Cmd>call VSCodeNotify('editor.foldAll')<CR>",
    { silent = true, desc = "editor.foldAll" })

  keyset("n", "<leader>rn", "<Cmd>call VSCodeNotify('editor.action.rename')<CR>",
    { silent = true, desc = "editor.action.rename" })
  keyset("n", "<leader>tr", "<Cmd>call VSCodeNotify('testing.runAtCursor')<CR>",
    { silent = true, desc = "testing.runAtCursor" })
  keyset("n", "<leader>dr", "<Cmd>call VSCodeNotify('testing.debugAtCursor')<CR>",
    { silent = true, desc = "testing.debugAtCursor" })
  keyset("n", "<leader>c", "<Cmd>call VSCodeNotify('editor.action.triggerSuggest')<CR>",
    { silent = true, desc = "editor.action.triggerSuggest" })
  keyset("n", "<leader>a", "<Cmd>call VSCodeNotify('outline.focus')<CR>",
    { silent = true, desc = "'outline.focus" })
  keyset("n", "<leader>p", "<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>",
    { silent = true, desc = "workbench.action.quickOpen" })
  keyset("n", "<leader>m", "<Cmd>call VSCodeNotify('workbench.action.closePanel')<CR>",
    { silent = true, desc = "workbench.action.closePanel" })
  keyset("n", "<leader>n", "<Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>",
    { silent = true, desc = "workbench.action.toggleSidebarVisibility" })
  keyset("n", "<leader>/",
    "<Cmd>call VSCodeNotify('editor.action.format')<CR><Cmd>call VSCodeNotify('editor.action.organizeImports')<CR>",
    { silent = true, desc = "editor.action.organizeImports" })

  keyset("n", "<C-w><C-h>", "<nop>", { silent = true })
  keyset("n", "<C-w><C-j>", "<nop>", { silent = true })
  keyset("n", "<C-w><C-k>", "<nop>", { silent = true })
  keyset("n", "<C-w><C-l>", "<nop>", { silent = true })
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
else
  ----------------
  --- material ---
  ----------------
  -- g.material_style = "darker"
  -- g.material_style = "palenight"
  g.material_style = "oceanic"


  ------------------------
  --- markdown-preview ---
  ------------------------
  keyset("n", "<C-s>", "<Plug>MarkdownPreviewToggle", { noremap = true, silent = true, desc = "markdown-preview toggle" })


  -------------------
  --- transparent ---
  -------------------
  g.transparent_enabled = true


  -------------------------
  --- vim-expand-region ---
  -------------------------
  keyset("v", "v", "<Plug>(expand_region_expand)",
    { noremap = true, silent = true, desc = "vim-expand-region expand" })
  keyset("v", "<C-v>", "<Plug>(expand_region_shrink)",
    { noremap = true, silent = true, desc = "vim-expand-region shrink" })


  ------------
  --- dial ---
  ------------
  keyset("n", "<C-a>", function() require("dial.map").manipulate("increment", "normal") end)
  keyset("n", "<C-x>", function() require("dial.map").manipulate("decrement", "normal") end)
  keyset("n", "g<C-a>", function() require("dial.map").manipulate("increment", "gnormal") end)
  keyset("n", "g<C-x>", function() require("dial.map").manipulate("decrement", "gnormal") end)
  keyset("v", "<C-a>", function() require("dial.map").manipulate("increment", "visual") end)
  keyset("v", "<C-x>", function() require("dial.map").manipulate("decrement", "visual") end)
  keyset("v", "g<C-a>", function() require("dial.map").manipulate("increment", "gvisual") end)
  keyset("v", "g<C-x>", function() require("dial.map").manipulate("decrement", "gvisual") end)
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


  ----------
  --- hop --
  ----------
  local hop = require("hop")
  local directions = require("hop.hint").HintDirection

  keyset("n", "<Leader>f", function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR })
  end, { noremap = true, silent = true, desc = "hop after" })

  keyset("n", "<Leader>F", function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR })
  end, { noremap = true, silent = true, desc = "hop before" })


  -------------------
  --- nvim-window ---
  -------------------
  keyset("n", "<Leader>w", function() require("nvim-window").pick() end,
    { noremap = true, silent = true, desc = "nvim-window" })


  -------------------
  --- rainbow_csv ---
  -------------------
  g.rainbow_active = 0
  g.rainbow_conf = {
    guifgs = { "darkorange2", "orchid3", "seagreen3" },
    separately = { nerdtree = 0 }
  }


  ---------------
  --- neotree ---
  ---------------
  keyset("n", "<leader>n", ":Neotree toggle<CR>", { noremap = true, silent = true, desc = "neo-tree toggle" })
  keyset("n", "<leader>h", ":Neotree toggle reveal<CR>",
    { noremap = true, silent = true, desc = "neo-tree toggle reveal" })


  --------------
  --- aerial ---
  --------------
  keyset("n", "<leader>a", "<cmd>AerialToggle!<CR>", { noremap = true, silent = true, desc = "aerial toggle" })


  ------------------
  --- toggleterm ---
  ------------------
  keyset("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "terminal leave insert mode" })


  ---------------
  --- neotest ---
  ---------------
  local neotest = require('neotest')
  keyset("n", "<leader>tr", function() neotest.run.run() end,
    { noremap = true, silent = true, desc = "run test at cursor" })
  keyset("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end,
    { noremap = true, silent = true, desc = "run test file" })


  keyset("n", "<leader>tp", function() neotest.output_panel.toggle() end,
    { noremap = true, silent = true, desc = "neotest toggle output pannel" })
  keyset("n", "<leader>to", function() neotest.output.open({ enter = true }) end,
    { noremap = true, silent = true, desc = "neotest open output" })

  local dap, dapui = require("dap"), require("dapui")
  vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
  keyset("n", "<leader>dr", function() neotest.run.run({ strategy = "dap" }) end,
    { noremap = true, silent = true, desc = "neotest run debug" })
  keyset("n", "<leader>db", function() dap.toggle_breakpoint() end,
    { noremap = true, silent = true, desc = "dap toggle breakpoint" })
  keyset("n", "<leader>du", function() dapui.toggle() end,
    { noremap = true, silent = true, desc = "dap toggle nvim-dap-ui" })

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

  -----------------
  --- which-key ---
  -----------------
  keyset("n", "<leader>?", function() require("which-key").show({ global = false }) end,
    { noremap = true, silent = true, desc = "Buffer Local Keymaps (which-key)" })


  -----------
  --- ufo ---
  -----------
  -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
  keyset('n', 'zR', require('ufo').openAllFolds)
  keyset('n', 'zM', require('ufo').closeAllFolds)
  keyset('n', 'zr', require('ufo').openFoldsExceptKinds)
  keyset('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)


  -----------------
  --- telescope ---
  -----------------
  local builtin = require("telescope.builtin")
  keyset("n", "<C-p>", builtin.find_files, { noremap = true, silent = true, desc = "telescope find files" })
  keyset("n", "<leader>p", builtin.live_grep, { noremap = true, silent = true, desc = "telescope live grep" })
  -- keyset("n", "<leader>pb", builtin.buffers, { noremap = true, silent = true, desc = "telescope buffers" })
  -- keyset("n", "<leader>h", builtin.help_tags, { noremap = true, silent = true })


  -----------
  --- coc ---
  -----------
  -- Autocomplete
  function _G.check_back_space()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
  end

  local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
  keyset("i", "<TAB>", "coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? '<TAB>' : coc#refresh()", opts)
  keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
  keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
  -- keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")

  keyset("n", "gd", "<Plug>(coc-definition)", { noremap = true, silent = true, desc = "coc goto definition" })
  keyset("n", "gi", "<Plug>(coc-implementation)", { noremap = true, silent = true, desc = "coc goto implementation" })
  keyset("n", "gr", "<Plug>(coc-references)", { noremap = true, silent = true, desc = "coc goto references" })
  keyset("n", "gt", "<Plug>(coc-type-definition)", { noremap = true, silent = true, desc = "coc goto type definition" })
  keyset("n", "gp", "<Plug>(coc-peek-definition)", { noremap = true, silent = true, desc = "coc goto peek definition" })
  keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", { noremap = true, silent = true, desc = "coc goto prev diagnostic" })
  keyset("n", "]g", "<Plug>(coc-diagnostic-next)", { noremap = true, silent = true, desc = "coc goto next diagnostic" })

  -- Symbol renaming
  keyset("n", "<leader>rn", "<Plug>(coc-rename)", { noremap = true, silent = true, desc = "coc rename" })
  keyset("n", "<F2>", "<Plug>(coc-rename)", { noremap = true, silent = true, desc = "coc rename" })

  -- Formatting
  keyset({ "n", "x" }, "<leader>/", "<Cmd>call CocAction('format')<CR>",
    { noremap = true, silent = true, desc = "coc format" })
  user_command("Eslint", "call CocAction('runCommand', 'eslint.executeAutofix')", {})

  -- Use K to show documentation in preview window
  function _G.show_docs()
    local cw = vim.fn.expand("<cword>")
    if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
      command("h " .. cw)
    elseif vim.api.nvim_eval("coc#rpc#ready()") then
      vim.fn.CocActionAsync("doHover")
    else
      command("!" .. vim.o.keywordprg .. " " .. cw)
    end
  end

  keyset("n", "K", "<CMD>lua _G.show_docs()<CR>", { noremap = true, silent = true, desc = "coc hover" })

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

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end

  -- colorscheme("material")
  -- colorscheme("nightfox")
  colorscheme("vscode")

  hl(0, "CocMenuSel", { bg = "#353535" })
  hl(0, "LineNr", { fg = "#505050" })
  hl(0, "FoldColumn", { fg = "#808080" })
  -- hl(0, "NonText", { fg = "#505050" })
  -- hl(0, "SpecialKey", { fg = "#505050" })
  hl(0, "WhiteSpace", { fg = "#404040" })
  hl(0, "IndentBlankLine", { fg = "#383838" })

  -- hl(0, "Normal", { bg = "none" })
  -- hl(0, "NormalNC", { bg = "none" })
end
