set nu
syntax on
inoremap jj <Esc>
nnoremap JJJJ <Nop>
set showmatch matchtime=2
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
imap <S-Tab> <C-o><<
cmap :w!! %!sudo tee > /dev/null %
set pastetoggle=<F2>
set cc=81
