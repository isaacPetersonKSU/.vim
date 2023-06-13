" line numbers
set number
set relativenumber 
set laststatus=2

" status bar
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"

" wrapping and line length
set textwidth=80
set colorcolumn=81
set ruler

" tabs and indentation
autocmd Filetype * AnyFoldActivate
let g:anyfold_fold_comments=1
set foldlevel=0
hi Folded term=NONE cterm=NONE
set tabstop=4 shiftwidth=4 softtabstop=4
set autoindent smartindent

" center cursor when page-jumping
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

" file explorer
packadd! nerdtree
" dont start nerdtree if opened on a file?
if argc() == 0
  autocmd VimEnter * :NERDTreeVCS<CR>
endif
nnoremap tr :NERDTreeToggle<CR>

" color scheme settings
packadd! everforest
if has('termguicolors') " Important!!
  set termguicolors
endif
let g:everforest_background = 'hard' " 'medium'(default), 'soft'
set background=dark
let g:everforest_better_performance = 1 " For better performance
colorscheme everforest

" syntax highlighting tool that requires cmake to work
" packad! YouCompleteMe

" automatically make tags and tell me when you're doing it
packad! vim-gutentags
set statusline+=%{gutentags#statusline()}

" include stdlibs
set tags+=/opt/microchip/xc8/v2.40/pic/tags
