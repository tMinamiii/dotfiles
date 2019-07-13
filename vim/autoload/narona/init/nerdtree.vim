scriptencoding utf-8

function! narona#init#nerdtree#hook_add() abort
	nmap <F9> :NERDTreeToggle<CR>
	nmap <silent><Leader>n :NERDTreeToggle<CR>
	nmap <silent><Leader>h :NERDTreeFind<CR>
	let g:NERDTreeWinSize = 35
	let g:NERDTreeLimitedSyntax = 1
	augroup nerdtree_hook_add
		autocmd FileType nerdtree nmap <buffer> l o
		autocmd FileType nerdtree nmap <buffer> <C-0> o
		autocmd FileType nerdtree nmap <buffer> <C-n> j
		autocmd FileType nerdtree nmap <buffer> <C-p> k
	augroup END
endfunction
