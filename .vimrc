execute pathogen#infect()
syntax on
filetype plugin indent on

if has('gui_running')
	set guifont=Monaco:h13
	set background=light
	colorscheme solarized
else
	set background=dark
	colorscheme jellybeans
endif

set number
set list
set ruler
set modeline
set modelines=1

" persistent undo dir
" set undodir^=~/.vim/undo//
set noundofile

" NERD Tree shortcut
nmap <silent> <special> <F2> :NERDTreeToggle<RETURN>

" Disable markdown automatic folding
let g:vim_markdown_folding_disabled=1

