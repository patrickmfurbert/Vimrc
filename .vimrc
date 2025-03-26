"netrw settings
"==================
let g:netrw_banner = 0

let g:netrw_liststyle = 3

let g:netrw_browse_split = 3

let g:netrw_altv = 1

let g:netrw_winsize = 25

let g:netrw_keepdir = 1

let g:netrw_buffer = -1

augroup ProjectDrawer

  autocmd!

  autocmd VimEnter * :Vexplore
" When opening a new tab, check if Netrw buffer exists and reuse it
  autocmd TabNew * call OpenSharedNetrw()
    " Store the buffer number when Netrw is loaded
  autocmd FileType netrw let g:netrw_buffer = bufnr('%')
augroup END


:set relativenumber

" Function to open or reuse the shared Netrw buffer
function! OpenSharedNetrw()
    " Check if we have a valid Netrw buffer stored
    if g:netrw_buffer != -1 && bufexists(g:netrw_buffer)
        " Open the existing Netrw buffer in a vertical split
        execute 'botright vsplit'
        execute 'buffer ' . g:netrw_buffer
        execute 'vertical resize ' . (&columns * 74 / 100)
    else
        " If no Netrw buffer exists, create a new one
        Vexplore
    endif
endfunction
