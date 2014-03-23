" Vim function to open URLs
" via http://vim.wikia.com/wiki/VimTip306. Author: Kartik Agaram
let $PATH = $PATH . '/usr/bin/gnome-open'
" Evoke a web browser
function! Browser ()
  let line0 = getline (".")
  let line = matchstr (line0, "http[^ ]*")
  :if line==""
  let line = matchstr (line0, "ftp[^ ]*")
  :endif
  :if line==""
  let line = matchstr (line0, "file[^ ]*")
  :endif
  let line = escape (line, "#?&;|%")
  ":if line==""
  " let line = "\"" . (expand("%:p")) . "\""
  ":endif
  exec ':silent !gnome-open ' . "\"" . line . "\"" | redraw!
endfunction
nmap <leader>z :call Browser ()<CR>
