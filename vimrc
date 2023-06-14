" line numbers
set number
set relativenumber 
set laststatus=2

" wrapping and line length
set textwidth=80
set colorcolumn=81
set ruler

" status bar
set laststatus=2

" tabs and indentation
set tabstop=4 shiftwidth=4 softtabstop=4
set autoindent smartindent

" center cursor when page-jumping
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

" Position the (global) quickfix window at the very bottom of the window
" (useful for making sure that it appears underneath splits)
"
" NOTE: Using a check here to make sure that window-specific location-lists
" aren't effected, as they use the same `FileType` as quickfix-lists.
autocmd FileType qf if (getwininfo(win_getid())[0].loclist != 1) | wincmd J | endif
autocmd VimEnter * :copen


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
