function! init#vim_projectroot#hook_add() abort
	function! <SID>AutoProjectRootCD()
		try
			if &filetype !=? 'help'
				ProjectRootCD
			endif
		catch
			" Silently ignore invalid buffers
		endtry
	endfunction
	augroup mygroup
		autocmd BufEnter * call <SID>AutoProjectRootCD()
	augroup END
endfunction
