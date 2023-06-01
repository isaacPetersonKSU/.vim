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
packadd! nerdtree
:nnoremap tr :NERDTreeToggle<CR>

" color scheme settings
packadd! everforest
colorscheme everforest
set background=dark

