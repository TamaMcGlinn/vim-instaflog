
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

function! instaflog#quit() abort
  close
endfunction

function! instaflog#run_command(command, ...) abort
  let l:keep_focus = get(a:, 1, v:false)
  let l:should_update = get(a:, 2, v:false)
  let l:is_tmp = get(a:, 3, v:false)

  let l:command = instaflog#format_command(a:command)

  call instaflog#run_raw_command(l:command, l:keep_focus, l:should_update, l:is_tmp)
endfunction

function! instaflog#run_tmp_command(command, ...) abort
  let l:keep_focus = get(a:, 1, v:false)
  let l:should_update = get(a:, 2, v:false)
  call instaflog#run_command(a:command, l:keep_focus, l:should_update, v:true)
endfunction

function! instaflog#run_raw_command(command, ...) abort
  let l:keep_focus = get(a:, 1, v:false)
  let l:should_update = get(a:, 2, v:false)
  let l:is_tmp = get(a:, 3, v:false)

  let l:graph_window_id = win_getid()
  let l:graph_buff_num = bufnr('')

  if type(a:command) != v:t_string
    return
  endif

  if l:is_tmp
    call flog#open_tmp_win(a:command)
    silent! call flog#tmp_command_buffer_settings()
    silent! call flog#handle_command_cleanup(
          \ l:keep_focus, l:should_update, l:graph_window_id, l:graph_buff_num)
  else
    exec a:command
    silent! call flog#handle_command_cleanup(
          \ l:keep_focus, l:should_update, l:graph_window_id, l:graph_buff_num)
  endif
endfunction

