scriptencoding utf-8

function! narona#init#defx_icons#hook_add() abort
	let g:defx_icons_enable_syntax_highlight = 0
	let g:defx_icons_column_length = 1
	let g:defx_icons_directory_icon = '+ '
	let g:defx_icons_mark_icon = '*'
	let g:defx_icons_parent_icon = ''
	let g:defx_icons_default_icon = ''
	let g:defx_icons_directory_symlink_icon = ''
	" Options below are applicable only when using "tree" feature
	let g:defx_icons_root_opened_tree_icon = '- '
	let g:defx_icons_nested_opened_tree_icon = '- '
	let g:defx_icons_nested_closed_tree_icon = '+ '
	let g:defx_icons_extensions = {'vue': {'icon': '', 'color': '8FAA54'}}
endfunction

function! narona#init#defx#hook_add() abort

	augroup defx_hook_add
		autocmd VimEnter * call s:setup_defx()
		autocmd FileType defx call s:defx_my_settings()
	augroup END

	" nmap <silent><Leader>n :Defx -direction=topleft -toggle -split=vertical -winwidth=40<CR> :IndentLinesDisable<CR>
	" nmap <silent><Leader>h :Defx -direction=topleft -split=vertical -winwidth=40 -search=`expand('%:p')`<CR> :IndentLinesDisable<CR>

	function! s:setup_defx() abort
		if $TERM_PROGRAM ==? 'hyper' || exists('$TMUX') || exists('$ALACRITTY_LOG')
			let s:default_columns = 'mark:indent:git:icon:filename'
			call defx#custom#option('_', {
						\ 'columns': s:default_columns,
						\ })
			call defx#custom#column('icon', {
						\ 'directory_icon': '+',
						\ 'opened_icon': '-',
						\ 'root_icon': '@',
						\ })
		else
			let s:default_columns = 'mark:indent:git:icons:filename'
			call defx#custom#option('_', {
						\ 'columns': s:default_columns,
						\ })
			call defx#custom#column('icon', {
						\ 'directory_icon': '+ ',
						\ 'opened_icon': '- ',
						\ 'root_icon': '',
						\ })
		endif
		call defx#custom#column('filename', {
					\ 'min_width': 250,
					\ 'max_width': 250,
					\ })
	endfunction


	function! s:defx_my_settings() abort
		" Define mappings
		nnoremap <silent><buffer> <C-n>  <Down>
		nnoremap <silent><buffer> <C-p>  <Up>
		nnoremap <silent><buffer> <C-j>  <nop>
		nnoremap <silent><buffer> <C-k>  <nop>
		nnoremap <silent><buffer><expr> <C-l>   defx#do_action('open')
		nnoremap <silent><buffer><expr> c       defx#do_action('copy')
		nnoremap <silent><buffer><expr> m       defx#do_action('move')
		nnoremap <silent><buffer><expr> p       defx#do_action('paste')
		nnoremap <silent><buffer><expr> o       defx#is_directory() ? defx#do_action('open_or_close_tree') : ''
		nnoremap <silent><buffer><expr> <Enter> defx#is_directory() ? defx#do_action('open_or_close_tree') : defx#do_action('drop')
		nnoremap <silent><buffer><expr> <C-Enter>  defx#is_directory() ? defx#do_action('open_or_close_tree') :  defx#do_action('drop')
		nnoremap <silent><buffer><expr> l      ! defx#is_directory() ? defx#do_action('drop') : ''
		nnoremap <silent><buffer><expr> E      defx#is_directory() ? defx#do_action('open_or_close_tree') : defx#do_action('drop', 'vsplit')
		nnoremap <silent><buffer><expr> P      defx#is_directory() ? defx#do_action('open_or_close_tree') : defx#do_action('drop', 'pedit')
		nnoremap <silent><buffer><expr> K      defx#do_action('new_directory')
		nnoremap <silent><buffer><expr> N      defx#do_action('new_file')
		nnoremap <silent><buffer><expr> M      defx#do_action('new_multiple_files')
		nnoremap <silent><buffer><expr> d      defx#do_action('remove')
		nnoremap <silent><buffer><expr> r      defx#do_action('rename')
		nnoremap <silent><buffer><expr> !      defx#do_action('execute_command')
		nnoremap <silent><buffer><expr> x      defx#do_action('execute_system')
		nnoremap <silent><buffer><expr> yy     defx#do_action('yank_path')
		nnoremap <silent><buffer><expr> .      defx#do_action('toggle_ignored_files')
		nnoremap <silent><buffer><expr> ;      defx#do_action('repeat')
		nnoremap <silent><buffer><expr> ~      defx#do_action('cd')
		nnoremap <silent><buffer><expr> q      defx#do_action('quit')
		nnoremap <silent><buffer><expr> *      defx#do_action('toggle_select_all')
		" nnoremap <silent><buffer><expr> j      line('.') == line('$') ? 'gg' : 'j'
		" nnoremap <silent><buffer><expr> k      line('.') == 1 ? 'G' : 'k'
		nnoremap <silent><buffer><expr> <C-h>  defx#do_action('cd', ['..'])
		nnoremap <silent><buffer><expr> R      defx#do_action('redraw')
		nnoremap <silent><buffer><expr> <C-g>  defx#do_action('print')
		nnoremap <silent><buffer><expr> <C-t>  defx#do_action('toggle_select') . 'j'
		nnoremap <silent><buffer><expr> cd     defx#do_action('change_vim_cwd')
	endfunction
endfunction
