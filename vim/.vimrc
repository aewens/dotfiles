" Solarized theme
set background=dark
let g:solarized_termcolors=256
let g:solarized_degrade=1
let g:solarized_termtrans=1
colorscheme solarized

" Personalize
set number relativenumber
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
set colorcolumn=81
highlight ColorColumn ctermbg=grey
highlight OverLength ctermbg=red ctermfg=white
match OverLength /\%81v.\+/
highlight LineNr ctermbg=NONE
