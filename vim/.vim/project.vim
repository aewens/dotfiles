" Load basic setup first
exec 'source ' . expand('$HOME/.vim/init.vim')

" Automatic Commands
if has("autocmd")
    fu! SaveSess()
        execute 'mksession! ' . getcwd() . '/.session.vim'
    endfunction

    fu! RestoreSess()
        if filereadable(getcwd() . '/.session.vim')
            execute 'so ' . getcwd() . '/.session.vim'
            "if bufexists(1)
            "    for l in range(1, bufnr('$'))
            "        if bufwinnr(l) == -1
            "            exec 'badd ' . l
            "        endif
            "    endfor
            "endif
        endif
    endfunction

    autocmd VimLeave * call SaveSess()
    autocmd VimEnter * nested call RestoreSess()
endif

" Leave insert mode quickly
""if ! has("gui_running")
""    set ttimeout ttimeoutlen=10
""    augroup FastEscape
""        autocmd!
""        au InsertEnter * set timeoutlen=10
""        au InsertLeave * set timeoutlen=1000
""    augroup END
""endif
