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

" file explorer
packadd! nerdtree
" dont start nerdtree if opened on a file?
if argc() > 0
  autocmd VimEnter * :NERDTreeVCS<CR>
endif
nnoremap <tr> :NERDTreeToggleVCS<CR>

" color scheme settings
packadd! everforest
if has('termguicolors') " Important!!
  set termguicolors
endif
let g:everforest_background = 'hard' " 'medium'(default), 'soft'
set background=dark
let g:everforest_better_performance = 1 " For better performance
colorscheme everforest

" serching and tags
packad! YouCompleteMe
" notify me when tags are updated automatically
set statusline+=%{gutentags#statusline()}
