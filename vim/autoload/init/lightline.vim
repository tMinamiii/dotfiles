function! init#lightline#hook_add() abort
	let g:lightline = {
				\ 'colorscheme': 'material',
				\ 'active': {
				\   'left': [ [ 'mode', 'paste' ], ['fugitive', 'filename', 'modified', 'readonly' ] ],
				\   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
				\ },
				\ 'tabline': {'left': [['buffers']], 'right': [['close']]},
				\ 'component_function': {
				\   'cocstatus': 'coc#status',
				\   'fugitive': 'LightlineFugitive',
				\   'filename': 'LightlineFilename',
				\   'fileformat': 'LightlineFileformat',
				\   'filetype': 'LightlineFiletype',
				\   'fileencoding': 'LightlineFileencoding',
				\   'mode': 'LightlineMode',
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

	function! LightlineModified()
		return &filetype =~? 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
	endfunction

	function! LightlineReadonly()
		return &filetype !~? 'help' && &readonly ? 'RO' : ''
	endfunction

	function! LightlineFilename()
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
		return winwidth(0) > 70 ? (&fileencoding !=# '' ? &fileencoding : &encoding) : ''
	endfunction

	function! LightlineMode()
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

	function! CtrlPMark()
		if expand('%:t') =~? 'ControlP' && has_key(g:lightline, 'ctrlp_item')
			call lightline#link('iR'[g:lightline.ctrlp_regex])
			return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
						\ , g:lightline.ctrlp_next], 0)
		else
			return ''
		endif
	endfunction

	let g:ctrlp_status_func = {
				\ 'main': 'CtrlPStatusFunc_1',
				\ 'prog': 'CtrlPStatusFunc_2',
				\ }

	function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
		let g:lightline.ctrlp_regex = a:regex
		let g:lightline.ctrlp_prev = a:prev
		let g:lightline.ctrlp_item = a:item
		let g:lightline.ctrlp_next = a:next
		return lightline#statusline(0)
	endfunction

	function! CtrlPStatusFunc_2(str)
		return lightline#statusline(0)
	endfunction

	let g:tagbar_status_func = 'TagbarStatusFunc'

	function! TagbarStatusFunc(current, sort, fname, ...) abort
		let g:lightline.fname = a:fname
		return lightline#statusline(0)
	endfunction

	augroup AutoSyntastic
		autocmd!
		autocmd BufWritePost *.c,*.cpp call s:syntastic()
	augroup END
	function! s:syntastic()
		SyntasticCheck
		call lightline#update()
	endfunction

	let g:unite_force_overwrite_statusline = 0
	let g:vimfiler_force_overwrite_statusline = 0
	let g:vimshell_force_overwrite_statusline = 0
endfunction
