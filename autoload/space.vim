function! space#before() abort
  :set clipboard=unnamed
  :set foldmethod=syntax
  :set nofoldenable
  let g:neomake_open_list = 0
endfunction

function! space#after() abort
endfunction

