
function! instaflog#get_commit_at_line() abort
  let l:line = getline('.')
  if l:line =~# '\[[0-9a-z]*\]'
    let l:commit_sha = matchstr(l:line, '\[[0-9a-z]*\]')[1:-2]
    return { 'short_commit_hash': l:commit_sha }
  else
    throw 'Error: unable to find a commit hash'
  endif
endfunction

function! instaflog#open() abort
  let l:dir=fugitive#repo().tree()
  tabnew
  execute "lcd " . l:dir
  terminal
  set ft=instaflog
  call feedkeys("Aforest --style=10 --pretty='format:%ad [%h] {%an}%d %s' --date='short' --all \<BAR> less -R\<CR>")
endfunction

