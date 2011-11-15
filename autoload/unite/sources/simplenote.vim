let s:save_cpo = &cpo
set cpo&vim

let s:source = {
\ 'name' : 'simlpenote',
\ 'default_action' : 'edit',
\ 'description' : 'candidates for simplenote',
\ }

function! unite#sources#simplenote#define()
  return s:source
endfunction

function! s:source.gather_candidates(args, context)
  let candidate = metarw#sn#complete('', '', '')
  return map(len(candidate) > 0 ? candidate[0] : [], "{
  \ 'word': v:val, 'abbr': v:val, 'action__path': v:val,
  \ 'kind': 'command', 'action__command': printf('edit %s\n', v:val),
  \}")
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: foldmethod=marker
