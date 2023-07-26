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

" search whole project
nnoremap <c-\> :F (<c-r><c-w>) **/*.h <cr>

" highlight when searching locally
set hlsearch

" file explorer
packadd! nerdtree
" dont start nerdtree if opened on a file?
if argc() == 0
  autocmd VimEnter * :NERDTreeVCS<CR>
endif
nnoremap tr :NERDTreeToggle<CR>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" color scheme settings
packadd! everforest
if has('termguicolors') " Important!!
  set termguicolors
endif
let g:everforest_background = 'hard' " 'medium'(default), 'soft'
set background=dark
let g:everforest_better_performance = 1 " For better performance
colorscheme everforest


" automatically make tags and tell me when you're doing it
packad! vim-gutentags
set statusline+=%{gutentags#statusline()}

" include stdlibs
set tags+=/opt/microchip/xc8/v2.40/pic/tags

" ccs's weird error format
augroup MakeAutocommand
  autocmd! 
  autocmd QuickFixCmdPost [^l]* cwindow | redraw!
augroup END

" warning format
set errorformat+=>>>\ %tarning\ %n\ \"%f\"\ Line\ %l(%c%.%#):\ %m
" error format
set errorformat+=***\ %trror\ %n\ \"%f\"\ Line\ %l(%c%.%#):\ %m 
" makefile error format


nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
