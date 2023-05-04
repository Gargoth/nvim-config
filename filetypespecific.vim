autocmd FileType markdown call s:markdown_settings()

function! s:markdown_settings()
    set wrap linebreak
endfunction

