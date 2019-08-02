function! init#vim_lsp#register_lsp() abort
	if executable('pyls')
		" pip install python-language-server
		augroup lsp
			au User lsp_setup call lsp#register_server({
						\ 'name': 'pyls',
						\ 'cmd': {server_info->['pyls']},
						\ 'whitelist': ['python'],
						\ })
		augroup END
	endif
	if executable('typescript-language-server')
		" npm install -g typescript typescript-language-server
		augroup lsp
		au User lsp_setup call lsp#register_server({
					\ 'name': 'typescript-language-server',
					\ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
					\ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
					\ 'whitelist': ['typescript'],
					\ })
		augroup END
	endif
	if executable('gopls')
		augroup lsp
			au User lsp_setup call lsp#register_server({
						\ 'name': 'gopls',
						\ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
						\ 'whitelist': ['go'],
						\ })
			autocmd BufWritePre *.go LspDocumentFormatSync
		augroup END
	endif
	if executable('docker-langserver')
		augroup lsp
			au User lsp_setup call lsp#register_server({
						\ 'name': 'docker-langserver',
						\ 'cmd': {server_info->[&shell, &shellcmdflag, 'docker-langserver --stdio']},
						\ 'whitelist': ['dockerfile'],
						\ })
		augroup END
	endif
	augroup lsp
		au User lsp_setup call lsp#register_server({
					\ 'name': 'intelephense',
					\ 'cmd': {server_info->['node', expand('PATH_TO_GLOBAL_NODE_MODULES/intelephense/lib/intelephense.js'), '--stdio']},
					\ 'initialization_options': {"storagePath": "PATH_TO_TEMP_FOLDER/intelephense"},
					\ 'whitelist': ['php'],
					\ })
	augroup END

	if executable('css-languageserver')
		" npm install -g vscode-css-languageserver-bin
		augroup lsp
			au User lsp_setup call lsp#register_server({
						\ 'name': 'css-languageserver',
						\ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
						\ 'whitelist': ['css', 'less', 'sass'],
						\ })
		augroup END
	endif
endfunction
