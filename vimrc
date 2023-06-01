color scheme
color default
" highlight colorcolumn ctermbg=231

" line numbers
set number
set relativenumber 
set laststatus=2

" wrapping and line length
set textwidth=80
set colorcolumn=81
set ruler

" tabs and indentation
set tabstop=4 shiftwidth=4 softtabstop=4
set autoindent smartindent

" <--initalize that abomonation
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
" :command NT NERDTreeToggle
:nnoremap tr :NERDTreeToggle<CR>

