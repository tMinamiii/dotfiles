
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

if vim.g.vscode then
  require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'folke/flash.nvim'

    use 'vscode-neovim/vscode-multi-cursor.nvim'

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
    -- vim.keymap.set("n", "<Leader>", "<Plug>(easymotion-prefix)", { noremap = true, silent = true })

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
  end)
else
  require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use { 'kylechui/nvim-surround', tag = "*" }

    use 'kaicataldo/material.vim'
      vim.g.material_terminal_italics = 0
      vim.g.material_theme_style = 'palenight'

    use 'terryma/vim-multiple-cursors'

    use 'terryma/vim-expand-region'
      vim.keymap.set("v", "v", "<Plug>(expand_region_expand)", { noremap = true, silent = true })
      vim.keymap.set("v", "<C-v>", "<Plug>(expand_region_shrink)", { noremap = true, silent = true })

    use 'machakann/vim-highlightedyank'

    use 'deris/vim-shot-f'

    use 'tpope/vim-fugitive'

    use 'easymotion/vim-easymotion'
    -- vim.keymap.set("n", "<Leader>", "<Plug>(easymotion-prefix)", { noremap = true, silent = true })

    use { 'neoclide/coc.nvim', branch = 'release' }
      vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', {silent = true})
      vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', {silent = true})
      vim.keymap.set('n', 'gr', '<Plug>(coc-references)', {silent = true})
      vim.keymap.set('n', 'gt', '<Plug>(coc-type-definition)', {silent = true})
      vim.keymap.set('n', 'gp', '<Plug>(coc-peek-definition)', {silent = true})
      vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
      vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

      local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
      vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
      vim.keymap.set("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
      vim.keymap.set("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})
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
            'coc-deno',
            'coc-docker',
            'coc-eslint',
            'coc-git',
            'coc-json',
            'coc-lua',
            'coc-markdownlint',
            'coc-pyright',
            'coc-sh',
            'coc-sqlfluff',
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

    use 'fannheyward/coc-marketplace'


    use { 'nvim-treesitter/nvim-treesitter' }

    use 'preservim/nerdtree'
      vim.keymap.set("n", "<Leader>n", ":NERDTreeToggle<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<Leader>h", ":NERDTreeFind<CR>", { noremap = true, silent = true })
      vim.g.NERDTreeWinSize = 35
      vim.g.NERDTreeLimitedSyntax = 1
      vim.g.NERDTreeQuitOnOpen = 0
      vim.cmd[[
      augroup nerdtree_hook_add
          autocmd FileType nerdtree nmap <buffer> l o
          autocmd FileType nerdtree nmap <buffer> <C-0> o
          autocmd FileType nerdtree nmap <buffer> <C-n> j
          autocmd FileType nerdtree nmap <buffer> <C-p> k
      augroup END
      ]]

    use {
      'junegunn/fzf.vim',
      requires = { 'junegunn/fzf', run = ':call fzf#install()' }
    }
      vim.g.fzf_layout = { down = '~40%' }

      vim.api.nvim_create_user_command('Files', 'call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)', { bang, nargs='?', complete='dir' })
      vim.api.nvim_create_user_command('GFiles', 'call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)', { bang, nargs='?', complete='dir' })
      vim.api.nvim_create_user_command('Rg', "call fzf#vim#grep('rg --column --line-number -g \"!.git\" --hidden --smart-case --no-heading --color=always '.shellescape(<q-args>), 1, <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%') : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'), <bang>0)", { bang, nargs='*' })

      vim.keymap.set("n", "<C-p>", ":GFiles<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<Leader>f", ":Files<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<Leader>g", ":Rg<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<Leader>b", ":Buffers<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<Leader>x", ":Commands<CR>", { noremap = true, silent = true })

    use 'itchyny/lightline.vim'
      vim.g.lightline = {
                  colorscheme='material',
                  active={
                    left={{ 'mode', 'paste' }, {'fugitive', 'filename', 'modified', 'readonly' }},
                    right={{ 'percent' }, { 'fileformat', 'fileencoding', 'filetype' }}
                  },
                  inactive={
                      left={{ 'filename' }},
                      right={{ 'lineinfo' }, { 'percent' }}
                  },
                  tabline={left={{'buffers'}}, right={{'close'}}},
                  component_function={
                    fugitive='LightlineFugitive',
                    filename='LightlineFilename',
                    fileformat='LightlineFileformat',
                    filetype='LightlineFiletype',
                    fileencoding='LightlineFileencoding',
                    mode='LightlineMode',
                  },
                  component_expand={
                    buffers='lightline#bufferline#buffers',
                  },
                  component_type={
                    syntastic='error',
                    buffers='tabsel',
                  },
                  subseparator={ left='|', right='|' }
                  }
      vim.cmd[[
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
            return winwidth(-1) > 70 ? (&fileencoding !=# '' ? &fileencoding : &encoding) : ''
        endfunction

        function! LightlineMode()
            let fname = expand('%:t')
            return fname ==? '__Tagbar__' ? 'Tagbar' :
                        \ fname ==? '__Gundo__' ? 'Gundo' :
                        \ fname ==? '__Gundo_Preview__' ? 'Gundo Preview' :
                        \ fname =~? 'NERD_tree' ? 'NERDTree' :
                        \ winwidth(0) > 60 ? lightline#mode() : ''
        endfunction


        function! TagbarStatusFunc(current, sort, fname, ...) abort
            let g:lightline.fname = a:fname
            return lightline#statusline(0)
        endfunction
      ]]
      vim.g.tagbar_status_func = 'TagbarStatusFunc'
      vim.g.unite_force_overwrite_statusline = 0
      vim.g.vimfiler_force_overwrite_statusline = 0
      vim.g.vimshell_force_overwrite_statusline = 0
  end)
end


if vim.g.vscode then
  require("nvim-surround").setup()

  require('vscode-multi-cursor').setup { -- Config is optional
    -- Whether to set default mappings
    default_mappings = true,
    -- If set to true, only multiple cursors will be created without multiple selections
    no_selection = false
  }

else
  require("nvim-surround").setup()

  require('nvim-treesitter.configs').setup {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

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

vim.cmd[[
colorscheme material
hi! Normal guibg=NONE ctermbg=NONE
]]
