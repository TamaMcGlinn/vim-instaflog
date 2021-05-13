silent setlocal nomodifiable
      \ readonly
      \ noswapfile
      \ nobuflisted
      \ nowrap
      \ buftype=nofile
      \ bufhidden=wipe
      \ cursorline

" Mappings {{{

" Misc. mappings {{{

if !hasmapto('<Plug>(InstaFlogHelp)')
  nmap <buffer> g? <Plug>(InstaFlogHelp)
endif
nnoremap <buffer> <silent> <Plug>(InstaFlogHelp) :help instaflog-mappings<CR>

nnoremap <buffer> <silent> <Plug>(InstaFlogVDiffSplitRight) :<C-U>call instaflog#run_tmp_command('vertical belowright Git diff HEAD %h')<CR>
vnoremap <buffer> <silent> <Plug>(InstaFlogVDiffSplitRight) :<C-U>call instaflog#run_tmp_command("vertical belowright Git diff %(h'>) %(h'<)")<CR>

nnoremap <buffer> <silent> <Plug>(InstaFlogVDiffSplitPathsRight) :<C-U>call instaflog#run_tmp_command('vertical belowright Git diff HEAD %h -- %p')<CR>
vnoremap <buffer> <silent> <Plug>(InstaFlogVDiffSplitPathsRight) :<C-U>call instaflog#run_tmp_command("vertical belowright Git diff HEAD %(h'<) %(h'>) -- %p")<CR>

if !hasmapto('<Plug>(InstaFlogQuit)')
  nmap <buffer> ZZ <Plug>(InstaFlogQuit)
  nmap <buffer> gq <Plug>(InstaFlogQuit)
endif
nnoremap <buffer> <silent> <Plug>(InstaFlogQuit) :call instaflog#quit()<CR>

" }}}

" Navigation mappings {{{

if !hasmapto('<Plug>(InstaFlogVNextRefRight)')
  nmap <buffer> ]r <Plug>(InstaFlogVNextRefRight)
endif
if !hasmapto('<Plug>(InstaFlogVPrevRefRight)')
  nmap <buffer> [r <Plug>(InstaFlogVPrevRefRight)
endif
nnoremap <buffer> <silent> <Plug>(InstaFlogVNextRefRight) :<C-U>call instaflog#next_ref() \| vertical belowright InstaFlogsplitcommit<CR>
nnoremap <buffer> <silent> <Plug>(InstaFlogVPrevRefRight) :<C-U>call instaflog#previous_ref() \| vertical belowright InstaFlogsplitcommit<CR>

" }}}

" Argument modifier mappings {{{

if !hasmapto('<Plug>(InstaFlogToggleAll)')
  nmap <buffer> ga <Plug>(InstaFlogToggleAll)
endif
nnoremap <buffer> <silent> <Plug>(InstaFlogToggleAll) :call instaflog#toggle_all_refs_option()<CR>

if !hasmapto('<Plug>(InstaFlogToggleBisect)')
  nmap <buffer> gb <Plug>(InstaFlogToggleBisect)
endif
nnoremap <buffer> <silent> <Plug>(InstaFlogToggleBisect) :call instaflog#toggle_bisect_option()<CR>

if !hasmapto('<Plug>(InstaFlogToggleNoMerges)')
  nmap <buffer> gm <Plug>(InstaFlogToggleNoMerges)
endif
nnoremap <buffer> <silent> <Plug>(InstaFlogToggleNoMerges) :call instaflog#toggle_no_merges_option()<CR>

if !hasmapto('<Plug>(InstaFlogToggleReflog)')
  nmap <buffer> gr <Plug>(InstaFlogToggleReflog)
endif
nnoremap <buffer> <silent> <Plug>(InstaFlogToggleReflog) :call instaflog#toggle_reflog_option()<CR>

if !hasmapto('<Plug>(InstaFlogToggleNoGraph)')
  nmap <buffer> gx <Plug>(InstaFlogToggleNoGraph)
endif
nnoremap <buffer> <silent> <Plug>(InstaFlogToggleNoGraph) :call instaflog#toggle_no_graph_option()<CR>

if !hasmapto('<Plug>(InstaFlogToggleNoPatch)')
  nmap <buffer> gp <Plug>(InstaFlogToggleNoPatch)
endif
nnoremap <buffer> <silent> <Plug>(InstaFlogToggleNoPatch) :call instaflog#toggle_no_patch_option()<CR>

if !hasmapto('<Plug>(InstaFlogUpdate)')
  nmap <buffer> u <Plug>(InstaFlogUpdate)
endif
nnoremap <buffer> <silent> <Plug>(InstaFlogUpdate) :call instaflog#populate_graph_buffer()<CR>

" }}}

" Commit/branch mappings {{{

if !hasmapto('<Plug>(InstaFlogRevert)')
  nmap <buffer> crc <Plug>(InstaFlogRevert)
  vmap <buffer> crc <Plug>(InstaFlogRevert)
endif

if !hasmapto('<Plug>(InstaFlogRevertNoEdit)')
  nmap <buffer> crn <Plug>(InstaFlogRevertNoEdit)
  vmap <buffer> crn <Plug>(InstaFlogRevertNoEdit)
endif

nnoremap <buffer> <silent> <Plug>(InstaFlogRevert) :<C-U>call instaflog#run_command('Git revert %h', 1, 1)<CR>
vnoremap <buffer> <silent> <Plug>(InstaFlogRevert) :<C-U>call instaflog#run_command("Git revert %(h'<)^..%(h'>)", 1, 1)<CR>

nnoremap <buffer> <silent> <Plug>(InstaFlogRevertNoEdit) :<C-U>call instaflog#run_command('Git revert --no-edit %h', 1, 1)<CR>
vnoremap <buffer> <silent> <Plug>(InstaFlogRevertNoEdit) :<C-U>call instaflog#run_command("Git revert --no-edit %(h'<)^..%(h'>)", 1, 1)<CR>

if !hasmapto('<Plug>(InstaFlogCheckout)')
  nmap <buffer> coo <Plug>(InstaFlogCheckout)
endif
nnoremap <buffer> <silent> <Plug>(InstaFlogCheckout) :<C-U>call instaflog#run_command('Git checkout %h', 0, 1)<CR>

if !hasmapto('<Plug>(InstaFlogCheckoutBranch)')
  nmap <buffer> cob <Plug>(InstaFlogCheckoutBranch)
endif
nnoremap <buffer> <silent> <Plug>(InstaFlogCheckoutBranch) :<C-U>call instaflog#run_command('Git checkout %b', 0, 1)<CR>

if !hasmapto('<Plug>(InstaFlogCheckoutLocalBranch)')
  nmap <buffer> cot <Plug>(InstaFlogCheckoutLocalBranch)
endif
nnoremap <buffer> <silent> <Plug>(InstaFlogCheckoutLocalBranch) :<C-U>call instaflog#run_command('Git checkout %l', 0, 1)<CR>

if !hasmapto('<Plug>(InstaFlogGitRevert)')
  nmap <buffer> cr<Space> <Plug>(InstaFlogGitRevert)
  vmap <buffer> cr<Space> <Plug>(InstaFlogGitRevert)
endif
nnoremap <buffer> <Plug>(InstaFlogGitRevert) :InstaFloggit revert<Space>
vnoremap <buffer> <Plug>(InstaFlogGitRevert) :InstaFloggit revert<Space>

if !hasmapto('<Plug>(InstaFlogGitMerge)')
  nmap <buffer> cm<Space> <Plug>(InstaFlogGitMerge)
  vmap <buffer> cm<Space> <Plug>(InstaFlogGitMerge)
endif
nnoremap <buffer> <Plug>(InstaFlogGitMerge) :InstaFloggit merge<Space>
vnoremap <buffer> <Plug>(InstaFlogGitMerge) :InstaFloggit merge<Space>

if !hasmapto('<Plug>(InstaFlogGitCheckout)')
  nmap <buffer> co<Space> <Plug>(InstaFlogGitCheckout)
  vmap <buffer> co<Space> <Plug>(InstaFlogGitCheckout)
endif
nnoremap <buffer> <Plug>(InstaFlogGitCheckout) :InstaFloggit checkout<Space>
vnoremap <buffer> <Plug>(InstaFlogGitCheckout) :InstaFloggit checkout<Space>

if !hasmapto('<Plug>(InstaFlogGitBranch)')
  nmap <buffer> cb<Space> <Plug>(InstaFlogGitBranch)
  vmap <buffer> cb<Space> <Plug>(InstaFlogGitBranch)
endif
nnoremap <buffer> <Plug>(InstaFlogGitBranch) :InstaFloggit branch<Space>
vnoremap <buffer> <Plug>(InstaFlogGitBranch) :InstaFloggit branch<Space>

" }}}

" Rebase mappings {{{

if !hasmapto('<Plug>(InstaFlogRebaseInteractive)')
  nmap <buffer> ri <Plug>(InstaFlogRebaseInteractive)
endif
nnoremap <buffer> <silent> <Plug>(InstaFlogRebaseInteractive) :<C-U>call instaflog#run_command('Git rebase --interactive %h^', 1, 1)<CR>

if !hasmapto('<Plug>(InstaFlogRebaseInteractiveAutosquash)')
  nmap <buffer> rf <Plug>(InstaFlogRebaseInteractiveAutosquash)
endif
nnoremap <buffer> <silent> <Plug>(InstaFlogRebaseInteractiveAutosquash) :<C-U>call instaflog#run_command('Git rebase --interactive --autosquash %h^', 1, 1)<CR>

if !hasmapto('<Plug>(InstaFlogRebaseInteractiveUpstream)')
  nmap <buffer> ru <Plug>(InstaFlogRebaseInteractiveUpstream)
endif
nnoremap <buffer> <silent> <Plug>(InstaFlogRebaseInteractiveUpstream) :<C-U>call instaflog#run_command('Git rebase --interactive @{upstream}', 1, 1)<CR>

if !hasmapto('<Plug>(InstaFlogRebaseInteractivePush)')
  nmap <buffer> rp <Plug>(InstaFlogRebaseInteractivePush)
endif
nnoremap <buffer> <silent> <Plug>(InstaFlogRebaseInteractivePush) :<C-U>call instaflog#run_command('Git rebase --interactive @{push}', 1, 1)<CR>

if !hasmapto('<Plug>(InstaFlogRebaseContinue)')
  nmap <buffer> rr <Plug>(InstaFlogRebaseContinue)
endif
nnoremap <buffer> <silent> <Plug>(InstaFlogRebaseContinue) :<C-U>call instaflog#run_command('Git rebase --continue', 1, 1)<CR>

if !hasmapto('<Plug>(InstaFlogRebaseSkip)')
  nmap <buffer> rs <Plug>(InstaFlogRebaseSkip)
endif
nnoremap <buffer> <silent> <Plug>(InstaFlogRebaseSkip) :<C-U>call instaflog#run_command('Git rebase --skip', 1, 1)<CR>

if !hasmapto('<Plug>(InstaFlogRebaseAbort)')
  nmap <buffer> ra <Plug>(InstaFlogRebaseAbort)
endif
nnoremap <buffer> <silent> <Plug>(InstaFlogRebaseAbort) :<C-U>call instaflog#run_command('Git rebase --abort', 1, 1)<CR>

if !hasmapto('<Plug>(InstaFlogRebaseEditTodo)')
  nmap <buffer> re <Plug>(InstaFlogRebaseEditTodo)
endif
nnoremap <buffer> <silent> <Plug>(InstaFlogRebaseEditTodo) :<C-U>call instaflog#run_command('Git rebase --edit-todo', 1, 1)<CR>

if !hasmapto('<Plug>(InstaFlogRebaseInteractiveReword)')
  nmap <buffer> rw <Plug>(InstaFlogRebaseInteractiveReword)
endif
nnoremap <buffer> <silent> <Plug>(InstaFlogRebaseInteractiveReword) :<C-U>call instaflog#run_command('Git rebase --interactive %h^ \| s/^pick/reword/e', 1, 1)

if !hasmapto('<Plug>(InstaFlogRebaseInteractiveEdit)')
  nmap <buffer> rm <Plug>(InstaFlogRebaseInteractiveEdit)
endif
nnoremap <buffer> <silent> <Plug>(InstaFlogRebaseInteractiveEdit) :<C-U>call instaflog#run_command('Git rebase --interactive %h^ \| s/^pick/edit/e', 1, 1)

if !hasmapto('<Plug>(InstaFlogRebaseInteractiveDrop)')
  nmap <buffer> rd <Plug>(InstaFlogRebaseInteractiveDrop)
endif
nnoremap <buffer> <silent> <Plug>(InstaFlogRebaseInteractiveDrop) :<C-U>call instaflog#run_command('Git rebase --interactive %h^ \| s/^pick/drop/e', 1, 1)

if !hasmapto('<Plug>(InstaFlogGitRebase)')
  nmap <buffer> r<Space> <Plug>(InstaFlogGitRebase)
  vmap <buffer> r<Space> <Plug>(InstaFlogGitRebase)
endif
nnoremap <buffer> <Plug>(InstaFlogGitRebase) :InstaFloggit rebase<Space>
vnoremap <buffer> <Plug>(InstaFlogGitRebase) :InstaFloggit rebase<Space>

" }}}

" Deprecated mappings {{{

" }}}

" }}}

" Commands {{{

command! -buffer InstaFlogsplitcommit call instaflog#run_tmp_command('<mods> Gsplit %h')

command! -buffer -range -bang -complete=customlist,instaflog#complete_git -nargs=* InstaFloggit call instaflog#run_raw_command('<mods> Git ' . <q-args>, 1, 1, !empty('<bang>'))

command! -bang -complete=customlist,instaflog#complete -nargs=* InstaFlogsetargs call instaflog#update_options([<f-args>], '<bang>' ==# '!')

command! -bang -complete=customlist,instaflog#complete_jump -nargs=* InstaFlogjump call instaflog#jump_to_ref(<q-args>)

" Deprecated commands {{{

" }}}

" }}}

