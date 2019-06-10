" Solarized theme
set background=dark
let g:solarized_termcolors=256
let g:solarized_degrade=1
let g:solarized_termtrans=1
colorscheme solarized

" Personalize appearance
syntax enable
set number relativenumber
set colorcolumn=81
highlight ColorColumn ctermbg=grey
highlight OverLength ctermbg=red ctermfg=white
match OverLength /\%81v.\+/
highlight LineNr ctermbg=NONE

" Change behaviors
filetype plugin on
set encoding=utf-8
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set showmatch matchtime=2
"set directory=~/.vim/swap
set wildmode=list:full
set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache
set wildignore+=*.dll,*.pdb,*.min.*,*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=tags
set wildignore+=*.tar.*
set wildignorecase
"set foldmethod=indent
set foldnestmax=10
set showbreak=↪
set list listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

" Disable Behavior
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <F1> <Nop>

" Remap Keys
let mapleader = " "
set spell
set spelllang=en_us
set path=.,**
set pastetoggle=<F2>
set wildcharm=<C-z>
cmap :w!! %!sudo tee > /dev/null %
imap <S-Tab> <C-o><<
inoreabbrev </ </<C-x><C-o>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap {} {}
inoremap [] []
inoremap () ()
inoremap jj <Esc>
nnoremap JJJJ <Nop>
nnoremap gb :bnext<CR>
nnoremap gB :bprevious<CR>
nnoremap <leader>l :ls<CR>:b<Space>
nnoremap <leader>L :b#<CR>
nnoremap <leader>w :bd<CR>
nnoremap <leader>b :buffer <C-z><S-Tab>
nnoremap <leader>B :sbuffer <C-z><S-Tab>
nnoremap <leader>f :find *
nnoremap <leader>s :sfind *
nnoremap <leader>v :vert sfind *
nnoremap <leader>t :tabfind *
nnoremap <leader>F :find <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>S :sfind <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>V :vert sfind <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>T :tabfind <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>c :nohlsearch<CR><Esc>
nnoremap <leader>o :set foldmethod=indent<CR>zM
nnoremap <leader>O :set foldmethod=manual<CR>zR
nnoremap <leader>X <ESC>:w<CR>:silent :!%:p<CR><CR>
nnoremap <leader>n :set number! relativenumber!<CR>

" Automatic Commands
if has("autocmd")
    autocmd! BufRead,BufNewFile *.{jsx,jx} setlocal filetype=jsx
	autocmd FileType jsx set syntax=javascript
    autocmd FileType html,jsx set omnifunc=htmlcomplete#CompleteTags
    "autocmd BufWinLeave *.* mkview
    "autocmd BufWinEnter *.* silent loadview
    "augroup html
    "    autocmd! FileType html inoreabbrev </ </<C-x><C-o>
    "augroup END

    augroup type_python
        autocmd!
        autocmd FileType python nnoremap <leader>x
            \ <ESC>:w<CR>:silent execute "!python3 -i %"<CR><CR>
        autocmd FileType python vnoremap <leader>x :!python3<CR>
    augroup END

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
