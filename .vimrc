" let g:pathogen_disabled = ['neocomplete.vim']

execute pathogen#infect()

" load vim-sensible now to be able to override some settings
runtime! plugin/sensible.vim

syntax on
filetype plugin indent on

if has('gui_running')
	set guifont=Monaco\ for\ Powerline:h13
	set background=light
	colorscheme solarized
else
	set background=dark
	"set background=light
	colorscheme jellybeans
	"colorscheme solarized
endif

set number
set list
set ruler
set modeline
set modelines=1

" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup

" persistent undo dir
" set undodir^=~/.vim/undo/
set noundofile

" NERD Tree shortcut
nmap <silent> <special> <F2> :NERDTreeToggle<RETURN>

" Disable markdown automatic folding
let g:vim_markdown_folding_disabled=1

" -------------------
"       Haskell
" -------------------
" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Show types in completion suggestions
let g:necoghc_enable_detailed_browse = 1
" Resolve ghcmod base directory
au FileType haskell let g:ghcmod_use_basedir = getcwd()

" Type of expression under cursor
nmap <silent> <leader>ht :GhcModType<CR>
" Insert type of expression under cursor
nmap <silent> <leader>hT :GhcModTypeInsert<CR>
nmap <silent> <leader>hc :GhcModTypeClear<CR>

" Hoogle the word under the cursor
nnoremap <silent> <leader>hh :Hoogle<CR>

" Hoogle and prompt for input
nnoremap <leader>hH :Hoogle 

" Hoogle for detailed documentation (e.g. "Functor")
nnoremap <silent> <leader>hi :HoogleInfo<CR>

" Hoogle for detailed documentation and prompt for input
nnoremap <leader>hI :HoogleInfo 

" Hoogle, close the Hoogle window
nnoremap <silent> <leader>hz :HoogleClose<CR>

