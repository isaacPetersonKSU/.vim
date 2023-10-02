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
if has('termguicolors') " Important!!
  set termguicolors
endif
set background=dark
colorscheme breakingbad

" so u can watch tv behind it
let s:transparent = 0
command! TransparentToggle :call ToggleTransparent()
function! ToggleTransparent()
    if s:transparent == 0
        let s:transparent = 1
        hi EndOfBuffer guibg=NONE ctermbg=NONE
        hi Normal guibg=NONE ctermbg=NONE
    else
        let s:transparent = 0
        hi clear EndOfBuffer
        hi clear Normal
        " Restore your original background colors here
    endif
endfunction

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
