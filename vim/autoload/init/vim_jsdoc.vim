function! init#vim_jsdoc#hook_add() abort
	let g:typescript_compiler_binary = ''
	let g:typescript_compiler_options = ''
	augroup mygroup
		autocmd FileType javascript,typescript :call s:jsdoc_keymap()
	augroup END
	function! s:jsdoc_keymap()
		nnoremap <buffer><silent> <Leader>d :JsDoc<CR>
		vnoremap <buffer><silent> <Leader>d :JsDoc<CR>
	endfunction
endfunction
