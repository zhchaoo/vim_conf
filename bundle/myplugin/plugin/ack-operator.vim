"
"
"


" Grep
nnoremap <leader>gg :silent execute "Ack " . shellescape(expand("<cword>"))<cr>:copen<cr>
nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
    let saved_unnamed_register = @@

    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        return
    endif

    echom shellescape(@@)

    silent execute "Ack " . shellescape(@@)
    copen

    let @@ = saved_unnamed_register
endfunction
