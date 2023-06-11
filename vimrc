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
set autoindent smartindent expandtab
let g:indent_style = 'spaces'
function! ToggleIndentStyle()
  if g:indent_style == 'tabs'
    set expandtab
    let g:indent_style = 'spaces'
    echo "Switched to spaces for indentation"
  else
    set noexpandtab 
    let g:indent_style = 'tabs'
    echo "Switched to tabs for indentation"
  endif
endfunction
command! ToggleIndent call ToggleIndentStyle()

" center cursor when page-jumping
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

" enable nerdtree, add a keybinding for it, and enabled it by default unless vim
" was opened on a particular file.
packadd! nerdtree
:nnoremap tr :NERDTreeToggle<CR>
autocmd VimEnter * if argc() == 0 | NERDTree | endif

" color scheme settings
packadd! everforest
if has('termguicolors') 
  set termguicolors
endif
let g:everforest_background = 'hard'
set background=dark
let g:everforest_better_performance = 1
colorscheme everforest

" searching and tags
set path+=** " search all subdirectories recursivly
command! Taggit !~/.vim/src/taggit.sh
:nnoremap tg :Taggit<CR>

