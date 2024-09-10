local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local user_command = vim.api.nvim_create_user_command
local keyset = vim.keymap.set
local command = vim.api.nvim_command
local opt = vim.opt

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

-- keyset("n", "<ESC><ESC>", ":noh<CR>", { noremap = true, silent = true })
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
  vim.g.clipboard = {
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
if vim.g.vscode then
  homepath = join(home, ".config", "packer.vscode-nvim")
  cachepath = join(home, ".cache", "packer.vscode-nvim")
else
  homepath = join(home, ".config", "packer.nvim")
  cachepath = join(home, ".cache", "packer.nvim")
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
local pack_path = join(cachepath, "site")
local package_root = join(pack_path, "pack")
local compile_path = join(cachepath, "plugin", "packer_compiled.lua")
vim.g.loaded_remote_plugins = 1

vim.opt.packpath:prepend(pack_path)

local packer_install_path = join(package_root, "packer", "start", "packer.nvim")

local ensure_packer = function()
  local fn = vim.fn
  if fn.empty(fn.glob(packer_install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", packer_install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

if vim.g.vscode then
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

      use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
      })

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
              -- "nvim-navic",
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
              map("n", "<leader>hs", gitsigns.stage_hunk)
              map("n", "<leader>hr", gitsigns.reset_hunk)
              map("v", "<leader>hs", function() gitsigns.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end)
              map("v", "<leader>hr", function() gitsigns.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end)
              map("n", "<leader>hS", gitsigns.stage_buffer)
              map("n", "<leader>hu", gitsigns.undo_stage_hunk)
              map("n", "<leader>hR", gitsigns.reset_buffer)
              map("n", "<leader>hp", gitsigns.preview_hunk)
              map("n", "<leader>hb", function() gitsigns.blame_line { full = true } end)
              map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
              map("n", "<leader>hd", gitsigns.diffthis)
              map("n", "<leader>hD", function() gitsigns.diffthis("~") end)
              map("n", "<leader>td", gitsigns.toggle_deleted)

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

      use "Yggdroot/indentLine"

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

      use { "nvim-telescope/telescope.nvim", tag = "0.1.8", requires = { "nvim-lua/plenary.nvim" } }

      use { "neoclide/coc.nvim", branch = "release", require = { "fannheyward/coc-marketplace" } }
    end,
    config = {
      package_root = package_root,
      compile_path = compile_path,
    },
  }
end

if vim.g.vscode then
  -------------------------
  --- vim-expand-region ---
  -------------------------
  keyset("v", "v", "<Plug>(expand_region_expand)", { noremap = true, silent = true })
  keyset("v", "<C-v>", "<Plug>(expand_region_shrink)", { noremap = true, silent = true })


  -----------
  --- hop ---
  -----------
  local hop = require("hop")
  local directions = require("hop.hint").HintDirection

  keyset("n", "<Leader>f", function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR })
  end, { noremap = true, silent = true })

  keyset("n", "<Leader>F", function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR })
  end, { noremap = true, silent = true })


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
  keyset("n", "gd", "<Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>")
  keyset("n", "gi", "<Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>")
  keyset("n", "gr", "<Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>")
  keyset("n", "gt", "<Cmd>call VSCodeNotify('editor.action.goToTypeDefinition')<CR>")
  keyset("n", "gp", "<Cmd>call VSCodeNotify('editor.action.peekDefinition')<CR>")
  keyset("n", "]g", "<Cmd>call VSCodeNotify('editor.action.marker.next')<CR>")
  keyset("n", "[g", "<Cmd>call VSCodeNotify('editor.action.marker.previous')<CR>")

  keyset("n", "<leader>rn", "<Cmd>call VSCodeNotify('editor.action.rename')<CR>")
  keyset("n", "<leader>tr", "<Cmd>call VSCodeNotify('testing.runAtCursor')<CR>")
  keyset("n", "<leader>dr", "<Cmd>call VSCodeNotify('testing.debugAtCursor')<CR>")
  keyset("n", "<leader>c", "<Cmd>call VSCodeNotify('editor.action.triggerSuggest')<CR>")
  keyset("n", "<leader>a", "<Cmd>call VSCodeNotify('outline.focus')<CR>")
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
    require("packer").sync()
  end
else
  ----------------
  --- material ---
  ----------------
  -- vim.g.material_style = "darker"


  ------------------------
  --- markdown-preview ---
  ------------------------
  keyset("n", "<C-s>", "<Plug>MarkdownPreviewToggle", { noremap = true, silent = true })


  -------------------
  --- transparent ---
  -------------------
  vim.g.transparent_enabled = true


  -------------------------
  --- vim-expand-region ---
  -------------------------
  keyset("v", "v", "<Plug>(expand_region_expand)", { noremap = true, silent = true })
  keyset("v", "<C-v>", "<Plug>(expand_region_shrink)", { noremap = true, silent = true })


  ----------
  --- hop --
  ----------
  local hop = require("hop")
  local directions = require("hop.hint").HintDirection

  keyset("n", "<Leader>f", function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR })
  end, { noremap = true, silent = true })

  keyset("n", "<Leader>F", function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR })
  end, { noremap = true, silent = true })


  -------------------
  --- nvim-window ---
  -------------------
  keyset("n", "<Leader>w", function() require("nvim-window").pick() end, { noremap = true, silent = true })


  -------------------
  --- rainbow_csv ---
  -------------------
  vim.g.rainbow_active = 0
  vim.g.rainbow_conf = {
    guifgs = { "darkorange2", "orchid3", "seagreen3" },
    separately = { nerdtree = 0 }
  }


  ------------------
  --- IndentLine ---
  ------------------
  vim.g.indentLine_showFirstIndentLevel = 1
  vim.g.indentLine_bufNameExclude = { "_.*", "NERD_tree.*" }
  vim.g.indentLine_bufTypeExluce = { "help", "nerdtree", "terminal" }
  vim.g.indentLine_fileTypeExluce = { "help", "nerdtree" }
  vim.g.indentLine_color_term = 238
  vim.g.indentLine_color_gui = "#676767"
  vim.g.indentLine_setConceal = 0


  ---------------
  --- neotree ---
  ---------------
  keyset("n", "<leader>n", ":Neotree toggle<CR>", { noremap = true, silent = true })
  keyset("n", "<leader>h", ":Neotree toggle reveal<CR>", { noremap = true, silent = true })


  --------------
  --- aerial ---
  --------------
  keyset("n", "<leader>a", "<cmd>AerialToggle!<CR>")


  ---------------
  --- neotest ---
  ---------------
  local neotest = require('neotest')
  keyset("n", "<leader>tr", function()
    neotest.run.run()
    neotest.output_panel.clear()
    neotest.output_panel.open()
  end, { noremap = true, silent = true })
  keyset("n", "<leader>tp", function() neotest.output_panel.toggle() end, { noremap = true, silent = true })
  keyset("n", "<leader>to", function() neotest.output.open({ enter = true }) end, { noremap = true, silent = true })

  local dap, dapui = require("dap"), require("dapui")
  vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
  keyset("n", "<leader>dr", function() neotest.run.run({ strategy = "dap" }) end, { noremap = true, silent = true })
  keyset("n", "<leader>db", function() dap.toggle_breakpoint() end, { noremap = true, silent = true })
  keyset("n", "<leader>du", function() dapui.toggle() end, { noremap = true, silent = true })

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
  --- telescope ---
  -----------------
  local builtin = require("telescope.builtin")
  keyset("n", "<C-p>", builtin.find_files, { noremap = true, silent = true })
  keyset("n", "<leader>g", builtin.live_grep, { noremap = true, silent = true })
  keyset("n", "<leader>b", builtin.buffers, { noremap = true, silent = true })
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

  keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
  keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
  keyset("n", "gr", "<Plug>(coc-references)", { silent = true })
  keyset("n", "gt", "<Plug>(coc-type-definition)", { silent = true })
  keyset("n", "gp", "<Plug>(coc-peek-definition)", { silent = true })
  keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
  keyset("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

  -- Symbol renaming
  keyset("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })
  keyset("n", "<F2>", "<Plug>(coc-rename)", { silent = true })

  -- Formatting
  keyset({ "n", "x" }, "<leader>/", "<Cmd>call CocAction('format')<CR>", { silent = true })
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

  keyset("n", "K", "<CMD>lua _G.show_docs()<CR>", { silent = true })

  -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
  augroup("CocGroup", {})
  autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
  })

  vim.g.coc_global_extensions = {
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

  vim.cmd.colorscheme("material")

  vim.api.nvim_set_hl(0, "CocMenuSel", { bg = "#404040" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#505050" })

  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
end
