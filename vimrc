
set exrc " local .vimrc files overrule this one 
set secure " do not allow unsafe commands in local vimrc files

set termguicolors
colorscheme nord

" line numbers
set number
set relativenumber 
set laststatus=2
set textwidth=80
set colorcolumn=81
set cursorline
set hlsearch
set ruler

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

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" split when jumping to definitions 
nnoremap <C-]>	:vsp <CR><C-w>w<C-]> <CR>
nnoremap <S-C-]> :sp <CR><C-w>w<C-]> <CR>


" for gitgutter
set updatetime=100

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


" ccs's weird error format
" augroup MakeAutocommand
"   autocmd! 
"   autocmd QuickFixCmdPost [^l]* cwindow | redraw!
" augroup END
" set errorformat+=>>>\ %tarning\ %n\ \"%f\"\ Line\ %l(%c%.%#):\ %m
" set errorformat+=***\ %trror\ %n\ \"%f\"\ Line\ %l(%c%.%#):\ %m 

set rtp+=/usr/bin/fzf

