function! space#before() abort
  :set clipboard=unnamed
  let g:vimfiler_tree_opened_icon = get(g:, 'vimfiler_tree_opened_icon', '-')
  let g:vimfiler_tree_closed_icon = get(g:, 'vimfiler_tree_closed_icon', '+')
  let g:neomake_open_list = 0
endfunction

function! space#after() abort
endfunction

