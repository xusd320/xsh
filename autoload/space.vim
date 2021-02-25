function! space#before() abort
  :set clipboard=unnamed
  :set foldmethod=syntax
  :set nofoldenable
  :set wrap

  let g:neomake_open_list = 0

  let g:LanguageClient_loggingFile = expand('/tmp/vim/LanguageClient.log')
endfunction

function! space#after() abort
  let g:LanguageClient_loadSettings = 1
  let g:LanguageClient_settingsPath = expand("~/.SpaceVim.d/lsp_settings.json")
endfunction

