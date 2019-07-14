function narona#init#pdv#hook_add() abort
	let g:pdv_template_dir = $HOME .'/.cache/dein/repos/github.com/tobyS/pdv/templates'
	augroup mygroup
		autocmd FileType php :call s:phpdoc_keymap()
	augroup END
	function! s:phpdoc_keymap()
		nnoremap <buffer><silent> <Leader>d :call pdv#DocumentCurrentLine()<CR>
		vnoremap <buffer><silent> <Leader>d :call pdv#DocumentCurrentLine()<CR>
	endfunction
endfunction

