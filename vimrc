" line numbers
set number
set relativenumber 
set laststatus=2

" wrapping and line length
set textwidth=80
set colorcolumn=81
set ruler

" status bar alwasys show file path line number and percentage
set laststatus=2
set statusline=%f\ [%l:%c]->{%{expand('<cword>')}}\ 

" tabs and indentation
set tabstop=4 shiftwidth=4 softtabstop=4
set autoindent smartindent
function! ToggleIndentStyle()
  if &expandtab
    set noexpandtab
    retab!
    echo "Indenting with tabs."
  else
    set expandtab
    retab!
    echo "Indenting with spaces."
  endif
endfunction
command! ToggleIndent call ToggleIndentStyle()

" center cursor when page-jumping
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

" search whole project
nnoremap <C-\> :grep /<cexpr>/gj ./**/

" file explorer
packadd! nerdtree
" dont start nerdtree if opened on a file?
if argc() == 0
  autocmd VimEnter * :NERDTreeVCS<CR>
endif
nnoremap tr :NERDTreeToggle<CR>

" color scheme settings
if has('termguicolors') " Important!!
  set termguicolors
endif
" let g:everforest_background = 'hard' " 'medium'(default), 'soft'
" set background=dark
" let g:everforest_better_performance = 1 " For better performance
" colorscheme everforest
colorscheme orbital

" syntax highlighting tool that requires cmake to work
" packad! YouCompleteMe

" automatically make tags and tell me when you're doing it
packad! vim-gutentags
set statusline+=%{gutentags#statusline()}

" include stdlibs
set tags+=/opt/microchip/xc8/v2.40/pic/tags
