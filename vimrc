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

" center cursor when page-jumping
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

" <--initalize that abomonation
packadd! nerdtree
:nnoremap tr :NERDTreeToggle<CR>

" color scheme settings
packadd! everforest
if has('termguicolors') " Important!!
  set termguicolors
endif
let g:everforest_background = 'hard'
set background=dark
let g:everforest_better_performance = 1
colorscheme everforest

" serching and tags
set path+=** " search all subdirectories recursivly
command! Taggit !~/.vim/src/taggit.sh
:nnoremap tg :Taggit<CR><CR>

