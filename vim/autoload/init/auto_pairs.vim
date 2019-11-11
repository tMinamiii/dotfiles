func! AutoPairsToggle()
  if b:autopairs_enabled
    let b:autopairs_enabled = 0
    echo 'AutoPairs Disabled.'
  else
    let b:autopairs_enabled = 1
    echo 'AutoPairs Enabled.'
  end
  return ''
endf

func! AutoPairsJump()
  call search('["\]'')}]','W')
endf

" Fast wrap the word in brackets
func! AutoPairsFastWrap()
  let c = @"
  normal! x
  let [before, after, ig] = s:getline()
  if after[0] =~ '\v[\{\[\(\<]'
    normal! %
    normal! p
  else
    for [open, close, opt] in b:AutoPairsList
      if close == ''
        continue
      end
      if after =~ '^\s*\V'.open
        call search(close, 'We')
        normal! p
        let @" = c
        return ""
      end
    endfor
    if after[1:1] =~ '\v\w'
      normal! e
      normal! p
    else
      normal! p
    end
  end
  let @" = c
  return ""
endf

func! s:getline()
  let line = getline('.')
  let pos = col('.') - 1
  let before = strpart(line, 0, pos)
  let after = strpart(line, pos)
  let afterline = after
  if g:AutoPairsMultilineClose
    let n = line('$')
    let i = line('.')+1
    while i <= n
      let line = getline(i)
      let after = after.' '.line
      if !(line =~ '\v^\s*$')
        break
      end
      let i = i+1
    endwhile
  end
  return [before, after, afterline]
endf

function! init#auto_pairs#hook_add() abort
    let g:AutoPairsShortcutToggle = ''
    let g:AutoPairsFastWrap = ''
    let g:AutoPairsJump = ''
    inoremap <buffer> <silent> <C-w> <C-R>=AutoPairsFastWrap()<CR>
    inoremap <buffer> <silent> <expr> <C-f> AutoPairsToggle()
    inoremap <buffer> <silent> <C-e> <ESC>:call AutoPairsJump()<CR>a
endf
