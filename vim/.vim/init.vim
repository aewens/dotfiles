set nocp

" Solarized theme
set term=xterm-256color
set background=dark
let g:solarized_termcolors=256
let g:solarized_degrade=1
let g:solarized_termtrans=1
colorscheme solarized

" Personalize appearance
syntax enable
set number relativenumber
set colorcolumn=81
"highlight ColorColumn ctermbg=grey
highlight OverLength ctermbg=red ctermfg=white
match OverLength /\%81v.\+/
highlight LineNr ctermbg=NONE

let s:activatedh = 1
function! ToggleH()
    if s:activatedh == 0
        let s:activatedh = 1
        match OverLength /\%81v.\+/
    else
        let s:activatedh = 0
        match none
    endif
endfunction

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
" Defaults = .,w,b,u,t,i : current, windows, buffers, unloaded, tags, included
"set complete=.,w,b,u,t,i
set complete=.,w,b,u,t
"set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)
set backspace=indent,eol,start
set nohlsearch
set shortmess=atoO

" Disable Behavior
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

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
inoremap ><Tab> ><C-\><C-o>m`a</<C-x><C-o><C-r>=get(v:completed_item, 'word', '>') ==# '>' ? "\<lt>C-u>" : ''<CR><Esc>``xi<CR><CR><Esc>ki<Tab>
inoremap >><Tab> ><C-\><C-o>m`a</<C-x><C-o><C-r>=get(v:completed_item, 'word', '>') ==# '>' ? "\<lt>C-u>" : ''<CR><Esc>``xi
"inoremap ><Tab> ><Esc>F<lv/\s\\|><CR>hyo</<C-r>"><Esc>O<Tab>
"inoremap >><Tab> ><Esc>F<lv/\s\\|><CR>hy$a</<C-r>"><Esc>F<i
inoremap # X#
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap {} {}
inoremap [] []
inoremap () ()
inoremap "" ""
inoremap jj <Esc>
nnoremap JJJJ <Nop>
nnoremap & :&&<CR>
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
nnoremap <leader>h :nohlsearch<CR><Esc>
nnoremap <leader>H :call ToggleH()<CR>
nnoremap <leader>o :set foldmethod=indent<CR>zM
nnoremap <leader>O :set foldmethod=manual<CR>zR
nnoremap <leader>X <ESC>:w<CR>:silent :!%:p<CR><CR>
nnoremap <leader>n :set number! relativenumber!<CR>
nnoremap <leader>p :set syntax=python<CR>
nnoremap <leader>c :execute "set colorcolumn=" . (&colorcolumn == "" ? "81" : "")<CR>
nnoremap <leader>r :execute "set list! showbreak=" . (&showbreak == "" ? "↪" : "")<CR>
nnoremap <leader>@ :source $MYVIMRC<CR>
xnoremap <leader>e y:r!python3 -c "<C-R>""<CR>

" Automatic Commands
if has("autocmd")
    autocmd! BufRead,BufNewFile *.{jsx,jx} setlocal filetype=jsx
    autocmd! BufRead,BufNewFile *.conf setlocal filetype=apache
    autocmd FileType jsx set syntax=javascript
    autocmd FileType html,jsx,apache set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType cv-python set syntax=python
    "autocmd BufWinLeave *.* mkview
    "autocmd BufWinEnter *.* silent loadview
    "augroup html
    "    autocmd! FileType html inoreabbrev </ </<C-x><C-o>
    "augroup END

    augroup type_python
        autocmd!
        autocmd FileType python nnoremap <leader>x <ESC>:w<CR>:silent execute "!python3 -i %"<CR><CR>
        autocmd FileType python vnoremap <leader>x :!python3<CR>
    augroup END

    augroup filetypedetect
        autocmd BufNewFile,BufRead * if &ft == 'conf' | setlocal syntax=python | endif
    augroup END
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
