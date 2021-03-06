function! space#before() abort
  let g:neomake_open_list = 0

  let g:LanguageClient_settingsPath = expand("~/.SpaceVim.d/lsp_settings.json")
  " let g:LanguageClient_loggingLevel = "INFO"
  " let g:LanguageClient_loggingFile = expand('~/.cache/SpaceVim/lsp_client.log')

  let g:spacevim_lint_on_save = 0
  let g:vista_sidebar_position = "vertical topleft"
  let g:vista_sidebar_width = 36
  call SpaceVim#custom#SPCGroupName(['v'], '+Vista')
  call SpaceVim#custom#SPC('nore', ['v', 'v'], 'Vista!!', 'Vista show', 1)
endfunction

function! space#after() abort
  set clipboard=unnamed
  set foldmethod=syntax
  set nofoldenable
  set wrap
  set lazyredraw
  set ttyfast
  set regexpengine=1
  set timeout
  set ttimeout
  set timeoutlen=300
  set ttimeoutlen=50
  set updatetime=500
endfunction

function! LspCursorHighlight(is_running) abort
  if a:is_running.result
    call LanguageClient#textDocument_documentHighlight()
  endif
endfunction

augroup lsp_aucmds
  au!
  au CursorHold * call LanguageClient#isAlive(function('LspCursorHighlight'))
augroup END
