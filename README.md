# Instant Flog - wrapper around git log terminal viewer

A fast wrapper around `git log` and similar commands,
for when the git repository is too large to use flog.

This plugin allows you to open a terminal with its own
filetype and mappings which operate on the output of the
git log command. By using a pager inside the terminal,
only the commits immediately necessary for drawing the
screen are accessed.

Example mappings to put in your vimrc:

```
nnoremap <Leader>glq :call instaflog#open()<CR>

augroup InstaFlogMappings
  autocmd!
  autocmd FileType instaflog nno <buffer> <Leader>m :<C-U>call flogmenu#open_main_contextmenu()<CR>
  autocmd FileType instaflog vno <buffer> <Leader>m :<C-U>call flogmenu#open_visual_contextmenu()<CR>
augroup END
```

