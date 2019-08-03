scriptencoding utf-8

function! init#vim_devicons#hook_add() abort
    if $TERM_PROGRAM ==? 'hyper' || exists('$TMUX') || exists('$ALACRITTY_LOG')
        let g:webdevicons_enable = 0
    else
        let g:webdevicons_enable = 1
    endif

    let g:webdevicons_enable = 0
    let g:NERDTreeExtensionHighlightColor = {}
    let g:NERDTreeExtensionHighlightColor['vue'] = '41B883'
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vue'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {}
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['^Dockerfile.*'] = ''
    let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
    let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
    let g:WebDevIconsUnicodeDecorateFolderNodes = 1
    let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
    let g:webdevicons_conceal_nerdtree_brackets = 1
endfunction
