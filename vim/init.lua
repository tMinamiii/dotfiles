
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
vim.opt.conceallevel = 0
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

vim.api.nvim_create_augroup('filetypes', {})
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, { group = 'filetypes', pattern = '*Dockerfile', command = 'setfiletype dockerfile' })
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, { group = 'filetypes', pattern = { '*zshrc', '*zsh' }, command = 'setfiletype zsh' })
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, { group = 'filetypes', pattern = '*.mjs', command = 'setfiletype javascript' })
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, { group = 'filetypes', pattern = '*.csv', command = 'setfiletype csv' })
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, { group = 'filetypes', pattern = '.env.*', command = 'setfiletype sh' })
vim.api.nvim_create_autocmd('BufWritePre', { group = 'filetypes', pattern = '*', command = ':%s/\\s\\+$//ge' })
vim.api.nvim_create_autocmd('BufWritePre', { group = 'filetypes', pattern = '*', command = ':%s/\\r//ge' })

vim.api.nvim_create_augroup('indent', {})
vim.api.nvim_create_autocmd('FileType', {
  group = 'indent',
  pattern = { 'sh','vue','yaml', 'javascript', 'typescript', 'json', 'html', 'vim', 'markdown' },
  command = 'setlocal shiftwidth=2 tabstop=2'
})
vim.api.nvim_create_autocmd('FileType', {
  group = 'indent',
  pattern = { 'python','c' },
  command = 'setlocal shiftwidth=4 tabstop=4'
})
vim.api.nvim_create_autocmd('FileType', {
  group = 'indent',
  pattern = { 'go','make' },
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

local homepath = join(home, '.config', 'config-name')
local cachepath = join(home, '.cache', 'config-name')

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
local package_root_vscode = join(pack_path, 'pack_vscode')
local compile_path_vscode = join(cachepath, 'plugin', 'packer_compiled_vscode.lua')
vim.g.loaded_remote_plugins = 1

vim.opt.packpath:prepend(pack_path)

local packer_bootstrap = false
local packer_install_path = join(package_root, 'packer', 'start', 'packer.nvim')
if vim.fn.isdirectory(packer_install_path) == 0 then
  vim.fn.system { 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', packer_install_path }
  vim.cmd.packadd 'packer.nvim'
  packer_bootstrap = true
end

if vim.g.vscode then
  require('packer').startup {
    function(use)
      use 'wbthomason/packer.nvim'

      use { 'kylechui/nvim-surround', tag = "*" }

      use 'kaicataldo/material.vim'
        vim.g.material_terminal_italics = 0
        vim.g.material_theme_style = 'palenight'

      use 'terryma/vim-expand-region'
        vim.keymap.set("v", "v", "<Plug>(expand_region_expand)", { noremap = true, silent = true })
        vim.keymap.set("v", "<C-v>", "<Plug>(expand_region_shrink)", { noremap = true, silent = true })

      use 'machakann/vim-highlightedyank'

      use 'deris/vim-shot-f'

      use 'easymotion/vim-easymotion'

      --- vscode ---
      use 'folke/flash.nvim'

      use 'vscode-neovim/vscode-multi-cursor.nvim'
    end,
    config = {
      package_root = package_root_vscode,
      compile_path = compile_path_vscode,
    },
  }
else
  require('packer').startup {
    function(use)
      use 'wbthomason/packer.nvim'

      use { 'kylechui/nvim-surround', tag = "*" }

      use 'kaicataldo/material.vim'
        vim.g.material_terminal_italics = 0
        vim.g.material_theme_style = 'palenight'

      use 'terryma/vim-expand-region'
        vim.keymap.set("v", "v", "<Plug>(expand_region_expand)", { noremap = true, silent = true })
        vim.keymap.set("v", "<C-v>", "<Plug>(expand_region_shrink)", { noremap = true, silent = true })

      use 'machakann/vim-highlightedyank'

      use 'deris/vim-shot-f'

      use 'easymotion/vim-easymotion'

      --- neovim ---
      use { 'terryma/vim-multiple-cursors' }

      use { 'tpope/vim-fugitive' }

      use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
      }

      use { 'rhysd/git-messenger.vim' }
      vim.g.git_messenger_include_diff = 'current'
      vim.g.git_messenger_always_into_popup = true
      vim.g.git_messenger_into_popup_after_show = true

      use { 'mechatroner/rainbow_csv' }
      vim.g.rainbow_active = 0
      vim.g.rainbow_conf = {
        guifgs = {'darkorange2', 'orchid3', 'seagreen3'},
        separately = { nerdtree=0 }
      }

      use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end
      }

      use { 'preservim/nerdtree' }

      use {
        'junegunn/fzf.vim',
        requires = { 'junegunn/fzf', run = ':call fzf#install()' }
      }

      use { 'fannheyward/coc-marketplace' }

      use { 'neoclide/coc.nvim', branch = 'release' }
    end,
    config = {
      package_root = package_root,
      compile_path = compile_path,
    },
  }
end

if vim.g.vscode then
  require("nvim-surround").setup()

  require('vscode-multi-cursor').setup { -- Config is optional
    -- Whether to set default mappings
    default_mappings = true,
    -- If set to true, only multiple cursors will be created without multiple selections
    no_selection = false
  }

  -- VSCode keymap
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

  vim.keymap.set("n", "<C-w><C-h>", "<nop>", { noremap = true })
  vim.keymap.set("n", "<C-w><C-j>", "<nop>", { noremap = true })
  vim.keymap.set("n", "<C-w><C-k>", "<nop>", { noremap = true })
  vim.keymap.set("n", "<C-w><C-l>", "<nop>", { noremap = true })
else
  require("nvim-surround").setup()

  require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
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
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  }

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

  ---------------------
  --- git-messenger ---
  ---------------------
  vim.keymap.set("n", "<Leader>gm", "<Plug>(git-messenger)", { noremap = true, silent = true })

  ----------------
  --- nerdtree ---
  ----------------
  vim.keymap.set("n", "<Leader>n", ":NERDTreeToggle<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<Leader>h", ":NERDTreeFind<CR>", { noremap = true, silent = true })
  vim.g.NERDTreeWinSize = 35
  vim.g.NERDTreeLimitedSyntax = 1
  vim.g.NERDTreeQuitOnOpen = 0
  vim.api.nvim_create_augroup('nerdtree_hook', {})
  vim.api.nvim_create_autocmd('FileType', { group = 'nerdtree_hook', pattern = 'nerdtree', command = 'nmap <buffer> l o' })
  vim.api.nvim_create_autocmd('FileType', { group = 'nerdtree_hook', pattern = 'nerdtree', command = 'nmap <buffer> <C-0> o' })
  vim.api.nvim_create_autocmd('FileType', { group = 'nerdtree_hook', pattern = 'nerdtree', command = 'nmap <buffer> <C-n> j' })
  vim.api.nvim_create_autocmd('FileType', { group = 'nerdtree_hook', pattern = 'nerdtree', command = 'nmap <buffer> <C-p> k' })

  ---------
  -- fzf --
  ---------
  vim.g.fzf_layout = { down = '~40%' }

  vim.api.nvim_create_user_command('Files', 'call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)', { bang, nargs='?', complete='dir' })
  vim.api.nvim_create_user_command('GFiles', 'call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)', { bang, nargs='?', complete='dir' })
  vim.api.nvim_create_user_command('Rg', "call fzf#vim#grep('rg --column --line-number -g \"!.git\" --hidden --smart-case --no-heading --color=always '.shellescape(<q-args>), 1, <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%') : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'), <bang>0)", { bang, nargs='*' })

  vim.keymap.set("n", "<C-p>", ":GFiles<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<Leader>f", ":Files<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<Leader>g", ":Rg<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<Leader>b", ":Buffers<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<Leader>x", ":Commands<CR>", { noremap = true, silent = true })

  -----------
  --- coc ---
  -----------
  local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
  vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
  vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
  vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
  vim.keymap.set("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")

  vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', {silent = true})
  vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', {silent = true})
  vim.keymap.set('n', 'gr', '<Plug>(coc-references)', {silent = true})
  vim.keymap.set('n', 'gt', '<Plug>(coc-type-definition)', {silent = true})
  vim.keymap.set('n', 'gp', '<Plug>(coc-peek-definition)', {silent = true})
  vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
  vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

  -- Formatting selected code
  vim.keymap.set("x", "<leader>/", "<Plug>(coc-format-selected)", {silent = true})
  vim.keymap.set("n", "<leader>/", "<Plug>(coc-format-selected)", {silent = true})

  -- Use K to show documentation in preview window
  function _G.show_docs()
      local cw = vim.fn.expand('<cword>')
      if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
          vim.api.nvim_command('h ' .. cw)
      elseif vim.api.nvim_eval('coc#rpc#ready()') then
          vim.fn.CocActionAsync('doHover')
      else
          vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
      end
  end

  vim.keymap.set("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

  -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
  vim.api.nvim_create_augroup("CocGroup", {})
  vim.api.nvim_create_autocmd("CursorHold", {
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
    'coc-pyright',
    'coc-sh',
    'coc-sql',
    'coc-tsserver',
    'coc-vimlsp',
    'coc-xml',
    'coc-yaml'
  }

  -- autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
  vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      command = "silent call CocAction('runCommand', 'editor.action.organizeImport')",
  })
end

vim.cmd[[colorscheme material]]
vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })

