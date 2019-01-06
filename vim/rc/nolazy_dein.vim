:scriptencoding

call dein#add('deris/vim-shot-f')
call dein#add('andymass/vim-matchup')
call dein#add('machakann/vim-highlightedyank')
call dein#add('Shougo/vimproc', { 'build' : 'make' })

""" scratchpad
call dein#add('metakirby5/codi.vim')

""" マルチカーソル
call dein#add('terryma/vim-multiple-cursors')

call dein#add('osyo-manga/vim-over', { 'hook_add': 's:HookAddVimOver' })
function! s:HookAddVimOver()
	nnoremap <silent> <Leader>o :OverCommandLine<CR>
endfunction


call dein#add('terryma/vim-expand-region', {'hook_add': 's:HookAddVimExpandRegion'})
function! s:HookAddVimExpandRegion()
	vmap v <Plug>(expand_region_expand)
	vmap <C-v> <Plug>(expand_region_shrink)
endfunction

""" ALE
call dein#add('w0rp/ale', {'hook_add': 's:HookAddALE'})
function! s:HookAddALE()
	nmap <silent> <Leader>/ :ALEFix<CR>
	nmap <silent> <leader>jj :ALENext<CR>
	nmap <silent> <leader>kk :ALEPrevious<CR>

	let g:ale_linters = {
	\   'javascript': ['eslint'],
	\   'javascript.jsx': ['eslint'],
	\   'php': ['phpcs', 'php', 'php_cs_fixer'],
	\   'go': ['golint', 'govet', 'golangci-lint'],
	\   'python': ['autopep8','flake8', 'isort'],
	\   'python3': ['autopep8','flake8', 'isort'],
	\   'ruby': ['ruby'],
	\   'typescript': ['tslint', 'tsserver'],
	\   'vue': ['eslint', 'vls'],
	\   'zsh': ['shellcheck'],
	\   'yaml': ['prettier'],
	\}

	" let g:ale_sign_error = ''       " エラー行に表示するマーク
	" let g:ale_sign_warning = ''     " エラー行に表示するマーク
	let g:ale_sign_error = 'E>'       " エラー行に表示するマーク
	let g:ale_sign_warning = 'w*'     " エラー行に表示するマーク
	let g:ale_echo_msg_format = '[%linter%] %s [%severity%]' " エラー行にカーソルをあわせた際に表示されるメッセージフォーマット
	let g:ale_sign_column_always = 1 " エラー表示の列を常時表示
	let g:ale_completion_enabled = 0
	let g:ale_virtualtext_cursor = 1

	let g:ale_lint_on_enter = 1      " ファイルを開いたときにlint実行
	let g:ale_lint_on_save = 1       " ファイルを保存したときにlint実行
	let g:ale_fix_on_save = 1        " ファイルを保存したときにfix実行
	let g:ale_lint_delay = 50
	let g:ale_lint_on_text_changed = 'always' " always or never

	" lint結果をロケーションリストとQuickFixには表示しない。QuickFixを書き換えられるのは困る
	let g:ale_set_loclist = 0
	let g:ale_set_quickfix = 0
	let g:ale_open_list = 0
	let g:ale_keep_list_window_open = 0
	let g:ale_php_phpcs_use_global = 1
	let g:ale_php_phpcs_standard = 'PSR2'
	let g:ale_javascript_eslint_options = '--cache'
	let g:ale_javascript_eslint_suppress_eslintignore = 1
	let g:ale_php_cs_fixer_options = '--rules=@PSR1,@PSR2'
	let g:ale_go_golangci_lint_options = '
	\ --fast
	\ -D=typecheck
	\ -D=gochecknoglobals
	\ -E=gosimple
	\ -E=staticcheck
	\ -E=lll'

	" \ -E=unparam
	" \ -E=unused
	let g:ale_set_highlights = 1
	let g:ale_fixers = {
		\ 'bash': ['shfmt'],
		\ 'go': ['gofmt', 'goimports'],
		\ 'javascript': ['eslint'],
		\ 'javascript.jsx': ['eslint'],
		\ 'json': ['prettier'],
		\ 'php': ['php_cs_fixer'],
		\ 'python': ['autopep8', 'isort'],
		\ 'python3': ['autopep8', 'isort'],
		\ 'sh': ['shfmt'],
		\ 'typescript': ['tslint', 'prettier'],
		\ 'vue': ['eslint'],
		\ 'yaml': ['prettier'],
		\ }

	" augroup aleconfigs
	"   autocmd BufRead,BufNewFile *.go,*.ts,*.js,*.py,*.php,*.sh,*.json,*.vue let ale_fix_on_save=1
	" 	autocmd BufRead,BufNewFile *.go,*.ts,*.js,*.py,*.php,*.sh,*.json,*.vue let ale_lint_on_text_changed='always'
	" 	autocmd BufRead,BufNewFile *.go,*.ts,*.js,*.py,*.php,*.sh,*.json,*.vue let ale_lint_on_enter = 1
	" 	autocmd BufRead,BufNewFile *.go,*.ts,*.js,*.py,*.php,*.sh,*.json,*.vue let ale_lint_on_save = 1
	" 	autocmd BufRead,BufNewFile *.go,*.ts,*.js,*.py,*.php,*.sh,*.json,*.vue let ale_lint_delay = 50
	" augroup END
endfunction


""" Syntax Highlight
" Protocol Buffer
call dein#add('uarun/vim-protobuf')

"  pug
call dein#add('digitaltoad/vim-pug')

" java script
call dein#add('jelera/vim-javascript-syntax')

""" TypeScript. ###
call dein#add('leafgarland/typescript-vim')

""" Vue ###
call dein#add('posva/vim-vue')

""" JSX ###
call dein#add('mxw/vim-jsx')

""" TOML ###
call dein#add('cespare/vim-toml')

"""### yaml ###
call dein#add('stephpy/vim-yaml')

call dein#add('cakebaker/scss-syntax.vim')

" ### Mics ####
call dein#add('simeji/winresizer', {'hook_add': 's:HookAddWinResizer'})
function! s:HookAddWinResizer()
	let g:winresizer_vert_resize = 1
	let g:winresizer_horiz_resize = 1
endfunction

call dein#add('junegunn/vim-easy-align', {'hook_add': s:HookAddVimEasyAlign()})
function! s:HookAddVimEasyAlign()
	vnoremap <silent> <Enter> :EasyAlign<cr>
endfunction


call dein#add('editorconfig/editorconfig-vim')


call dein#add('Yggdroot/indentLine', {'hook_add': 's:HookAddIndentLine'})
function! s:HookAddIndentLine()
	let g:indentLine_showFirstIndentLevel=1
	let g:indentLine_fileTypeExluce=['help', 'nerdtree']
	let g:indentLine_color_term = 238
	let g:indentLine_color_gui = '#676767'
endfunction


call dein#add('ryanoasis/vim-devicons', {'hook_add': 's:HookAddVimDevIcons'})
function! s:HookAddVimDevIcons()
	let g:NERDTreeExtensionHighlightColor = {}
	let g:NERDTreeExtensionHighlightColor['vue'] = '41B883'
	let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
	let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vue'] = ''
	let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {}
	let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['^Dockerfile.*'] = ''
	let g:WebDevIconsUnicodeDecorateFolderNodes = 1
	let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
	let g:webdevicons_enable = 1
	let g:webdevicons_enable_defx = 1
	let g:webdevicons_enable_vimfiler = 1
	let g:webdevicons_enable_denite = 1
	if exists('$TMUX')
		let g:webdevicons_enable_nerdtree = 0
	else
		let g:webdevicons_enable_nerdtree = 1
	endif
endfunction


call dein#add('dbakker/vim-projectroot', {'hook_add': 's:HookAddVimProjectRoot'})
function! s:HookAddVimProjectRoot()
	function! <SID>AutoProjectRootCD()
		try
			if &filetype !=? 'help'
			ProjectRootCD
		endif
		catch
			" Silently ignore invalid buffers
		endtry
	endfunction

	augroup VimProjectRoot
		autocmd BufEnter * call <SID>AutoProjectRootCD()
	augroup END
endfunction


call dein#add('godlygeek/tabular')

" ### Git ###
call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')

" ###################
" ### Dark Powers ###
" ###################
call dein#add('Shougo/dein.vim')

" call dein#add('Shougo/defx.nvim', {'hook_add': 's:HookAddDefx'})
function! s:HookAddDefx()
	function! s:defx_my_settings() abort
		" Define mappings
		nnoremap <silent><buffer><expr> <CR>
		\ defx#do_action('drop')
		nnoremap <silent><buffer><expr> c
		\ defx#do_action('copy')
		nnoremap <silent><buffer><expr> m
		\ defx#do_action('move')
		nnoremap <silent><buffer><expr> p
		\ defx#do_action('paste')
		nnoremap <silent><buffer><expr> l
		\ defx#do_action('drop')
		nnoremap <silent><buffer><expr> E
		\ defx#do_action('drop', 'vsplit')
		nnoremap <silent><buffer><expr> P
		\ defx#do_action('drop', 'pedit')
		nnoremap <silent><buffer><expr> K
		\ defx#do_action('new_directory')
		nnoremap <silent><buffer><expr> N
		\ defx#do_action('new_file')
		nnoremap <silent><buffer><expr> M
		\ defx#do_action('new_multiple_files')
		nnoremap <silent><buffer><expr> d
		\ defx#do_action('remove')
		nnoremap <silent><buffer><expr> r
		\ defx#do_action('rename')
		nnoremap <silent><buffer><expr> !
		\ defx#do_action('execute_command')
		nnoremap <silent><buffer><expr> x
		\ defx#do_action('execute_system')
		nnoremap <silent><buffer><expr> yy
		\ defx#do_action('yank_path')
		nnoremap <silent><buffer><expr> .
		\ defx#do_action('toggle_ignored_files')
		nnoremap <silent><buffer><expr> ;
		\ defx#do_action('repeat')
		nnoremap <silent><buffer><expr> h
		\ defx#do_action('cd', ['..'])
		nnoremap <silent><buffer><expr> ~
		\ defx#do_action('cd')
		nnoremap <silent><buffer><expr> q
		\ defx#do_action('quit')
		nnoremap <silent><buffer><expr> <Space>
		\ defx#do_action('toggle_select') . 'j'
		nnoremap <silent><buffer><expr> *
		\ defx#do_action('toggle_select_all')
		nnoremap <silent><buffer><expr> j
		\ line('.') == line('$') ? 'gg' : 'j'
		nnoremap <silent><buffer><expr> k
		\ line('.') == 1 ? 'G' : 'k'
		nnoremap <silent><buffer><expr> <C-l>
		\ defx#do_action('redraw')
		nnoremap <silent><buffer><expr> <C-g>
		\ defx#do_action('print')
		nnoremap <silent><buffer><expr> cd
		\ defx#do_action('change_vim_cwd')
	endfunction


	nmap <F9> :Defx -split=vertical -winwidth=45 -toggle <CR>
	nmap <silent><Leader>n :Defx -split=vertical -winwidth=45 -toggle <CR>
	nmap <silent><Leader>h :Defx `expand('%:p:h')` -search=`expand('%:p')`<CR>
	augroup Defx
		autocmd FileType defx call s:defx_my_settings()
	augroup END
endfunction

call dein#add('Shougo/deoplete.nvim', {'hook_add': 's:HookAddDeoplete'})
function! s:HookAddDeoplete()
	let g:deoplete#enable_at_startup = 1
	let g:deoplete#min_pattern_length = 1
endfunction

""" #############
""" ### Filer ###
""" #############
call dein#add('scrooloose/nerdtree.git',{'hook_add':'s:HookAddNerdTree'})
function! s:HookAddNerdTree()
	nmap <F9> :NERDTreeToggle<CR>
	nmap <silent><Leader>n :NERDTreeToggle<CR>
	nmap <silent><Leader>h :NERDTreeFind<CR>
	let g:NERDTreeMapActivateNode = 'l'
	let g:NERDTreeWinSize = 40
	let g:NERDTreeLimitedSyntax = 1
endfunction


"""####################
"""### カラーテーマ ###
"""####################
call dein#add('rhysd/vim-color-spring-night', {'hook_add': 's:HookAddVimColorSpringNight'})
function! s:HookAddVimColorSpringNight()
	let g:spring_night_kill_italic = 1
endfunction

" ##################
" ### Statusline ###
" ##################

call dein#add('itchyny/lightline.vim', {'hook_add': 's:HookAddLightline'})
function! s:HookAddLightline()
	let g:lightline = {
		  \ 'colorscheme': 'wombat',
		  \ 'active': {
		  \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
		  \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
		  \ },
		  \ 'tabline': {'left': [['buffers']], 'right': [['close']]},
		  \ 'component_function': {
		  \   'fugitive': 's:LightlineFugitive',
		  \   'filename': 's:LightlineFilename',
		  \   'fileformat': 's:LightlineFileformat',
		  \   'filetype': 's:LightlineFiletype',
		  \   'fileencoding': 's:LightlineFileencoding',
		  \   'mode': 's:LightlineMode',
		  \   'ctrlpmark': 's:CtrlPMark',
		  \ },
		  \ 'component_expand': {
		  \   'syntastic': 'SyntasticStatuslineFlag',
		  \   'buffers': 'lightline#bufferline#buffers',
		  \ },
		  \ 'component_type': {
		  \   'syntastic': 'error',
		  \   'buffers': 'tabsel',
		  \ },
		  \ 'subseparator': { 'left': '|', 'right': '|' }
		  \ }


	function! s:LightlineModified()
	  return &filetype =~? 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
	endfunction

	function! s:LightlineReadonly()
	  return &filetype !~? 'help' && &readonly ? 'RO' : ''
	endfunction

	function! s:LightlineFilename()
	  let fname = expand('%:t')
	  return fname ==? 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
			\ fname ==? '__Tagbar__' ? g:lightline.fname :
			\ fname =~? '__Gundo\|NERD_tree' ? '' :
			\ &filetype ==? 'vimfiler' ? vimfiler#get_status_string() :
			\ &filetype ==? 'unite' ? unite#get_status_string() :
			\ &filetype ==? 'vimshell' ? vimshell#get_status_string() :
			\ ('' !=? LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
			\ ('' !=? fname ? fname : '[No Name]') .
			\ ('' !=? LightlineModified() ? ' ' . LightlineModified() : '')
	endfunction

	function! s:LightlineFugitive()
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

	function! s:LightlineFileformat()
	  return winwidth(0) > 70 ? &fileformat : ''
	endfunction

	function! s:LightlineFiletype()
	  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
	endfunction

	function! s:LightlineFileencoding()
	  return winwidth(0) > 70 ? (&fileencoding !=# '' ? &fileencoding : &encoding) : ''
	endfunction

	function! s:LightlineMode()
	  let fname = expand('%:t')
	  return fname ==? '__Tagbar__' ? 'Tagbar' :
			\ fname ==? 'ControlP' ? 'CtrlP' :
			\ fname ==? '__Gundo__' ? 'Gundo' :
			\ fname ==? '__Gundo_Preview__' ? 'Gundo Preview' :
			\ fname =~? 'NERD_tree' ? 'NERDTree' :
			\ &filetype ==? 'unite' ? 'Unite' :
			\ &filetype ==? 'vimfiler' ? 'VimFiler' :
			\ &filetype ==? 'vimshell' ? 'VimShell' :
			\ winwidth(0) > 60 ? lightline#mode() : ''
	endfunction

	function! s:CtrlPMark()
	  if expand('%:t') =~? 'ControlP' && has_key(g:lightline, 'ctrlp_item')
		call lightline#link('iR'[g:lightline.ctrlp_regex])
		return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
			  \ , g:lightline.ctrlp_next], 0)
	  else
		return ''
	  endif
	endfunction

	function! s:CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
	  let g:lightline.ctrlp_regex = a:regex
	  let g:lightline.ctrlp_prev = a:prev
	  let g:lightline.ctrlp_item = a:item
	  let g:lightline.ctrlp_next = a:next
	  return lightline#statusline(0)
	endfunction

	function! s:CtrlPStatusFunc_2(str)
	  return lightline#statusline(0)
	endfunction

	function! s:TagbarStatusFunc(current, sort, fname, ...) abort
		let g:lightline.fname = a:fname
	  return lightline#statusline(0)
	endfunction

	function! s:syntastic()
	  SyntasticCheck
	  call lightline#update()
	endfunction

	let g:ctrlp_status_func = {
	  \ 'main': 's:CtrlPStatusFunc_1',
	  \ 'prog': 's:CtrlPStatusFunc_2',
	  \ }

	let g:tagbar_status_func = 's:TagbarStatusFunc'
	augroup AutoSyntastic
	  autocmd!
	  autocmd BufWritePost *.c,*.cpp call s:syntastic()
	augroup END
	let g:unite_force_overwrite_statusline = 0
	let g:vimfiler_force_overwrite_statusline = 0
	let g:vimshell_force_overwrite_statusline = 0
endfunction
