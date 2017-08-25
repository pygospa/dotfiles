" Author		Kannan Thambiah <pygospa@gmail.com>
" Latest version	https://github.com/pygospa/dotfiles


"------------------------------------------------------------------------------
" Pathogene plugin settings
"
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
filetype plugin indent on	"We want vim to automatically load plugins


"------------------------------------------------------------------------------
" General settings
"
scriptencoding utf-8		"Set the encoding for the script
set backspace=indent,eol,start	" Use backspace in vim to delete words
set clipboard=unnamed		" unnamed clipboard (macOS + vim + tmux hack)
set encoding=utf-8		" We want to produce utf-8 documents
set filetype=on			" We want vim to inspect the file it is editing
set hidden			" Switch between buffers, even if unsaved!
set history=100			" Keep the last 100 commands in the history
set hlsearch			" Mark all parts in the text that match search
set incsearch			" Start searching while typing. Jump to bestfit
set laststatus=2		" Always show the status line
set nocompatible		" vim shouldn't be vi-compatible
set number			" We want line numbering
set numberwidth=4		" Leave space for four digits for the numbering
set relativenumber		" Current line has it's line number displayed
set ruler			" show position at the bottom status line
set smartindent			" When doing indention, be smart about it :)
set showcmd			" Show the command that you are currently using
set showmatch			" Shows the matchint paranteese for an open one
set spelllang=de_de,en_us	" Spelling languages
set spellsuggest=double,10	" How many suggestion for spelling errors
set textwidth=80		" Have the text wrapped after 80 characters
set ttyfast			" I have a fast terminal connection
set wildmenu			" We want tab completion for the command line
set wrap			" Wrap the text, when out of window
set listchars=tab:▸\ ,eol:¬	" ▸ as Tab character and ¬ as end of line char
syntax on			" Switching on syntax highlighting
syntax sync fromstart		" Start with correct syntax (may be slow)


"------------------------------------------------------------------------------
" Directories
"
set directory=$HOME/tmp/vim/swaps//
set backupdir=$HOME/tmp/vim/backups//
set directory=$HOME/tmp/vim/undos//


"------------------------------------------------------------------------------
" Persisten undo is a neat feature
"
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000


"------------------------------------------------------------------------------
" Keyboard mappings
"
let mapleader=","		" We want to use the comma as map leader
imap jk <Esc>			" Map <Esc> to jk
map sp :set spell!<cr>		" Map sp to :set spell!
map <leader>sn ]s		" map ,sn for next spelling mistake instead ]s
map <leader>sp [s		" map ,sp for prev spelling mistake instead [s
nnoremap <leader>l :set list!<cr> " map ,l to show nonprintables (cr, tab)
map nt :NERDTreeToggle<cr>
map be :BufExplorer
map tb :TagbarToggle<cr>
nnoremap <C-H> <C-W><C-H>	" easy window movment with ctrl hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap J 5j			" easy line movement
nnoremap K 5k
nnoremap L :bnext<CR>		" easy buffer movement
nnoremap H :bprevious<CR>
no <down> <Nop>			" Deactivate arrow keys in normal mode
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
ino <down> <Nop>		" Deactivate arrow keys in insert mode
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>


"------------------------------------------------------------------------------
" Statusline
"
set showmode					" Show mode in status line
set statusline=
set statusline+=%<\				" cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        	" flags and buf no
set statusline+=%-40f\                    	" path
set statusline+=%{strlen(&fenc)?&fenc:&enc},	" encoding
set statusline+=%=				" right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\ " highlight
set statusline+=%b,0x%-8B\			" current char
set statusline+=%=%1*%y%*%*\			" file type
set statusline+=%10((%l,%c)%)\            	" line and column
set statusline+=%P                        	" percentage of file


"------------------------------------------------------------------------------
" Colors
"
syntax enable
set background=dark
colorscheme solarized
call togglebg#map("<F5>")


"------------------------------------------------------------------------------
" Show me a line at the 80th character each row
"
if(exists('+colorcolumn'))
	set colorcolumn=80,120
	highlight ColorColumn ctermbg=16
endif


"------------------------------------------------------------------------------
" Filetypes
"
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.wiki set filetype=vimwiki



"------------------------------------------------------------------------------
" Indention
"
" Rule of thumb:
"   - If you want to work with tab characters, always ensure
"	tabstop == softtabstop
"   - If you want to work with space characters, always ensure
"	softtabstop == shiftwidth
set autoindent		" Set autoindent for coding
set noexpandtab		" We don't want any convertion of tabs to spaces
set tabstop=8		" Determing the width of tab-characters. In this case 8
set softtabstop=8	" When expandtab is set, this determines the spaces
			" added per tab-keystroke. If not and softtab < tabstop,
			" tab-keystorkes translate to spaces of sottab, until
			" they reach tabstop length, then transform to tab char
set shiftwidth=8	" Combined with softtabstop sets width for autoindent


"------------------------------------------------------------------------------
" File specific indention rules
"
if has("autocmd")
	"----------------------------------------------------------------------
	" Syntax of these languages is fuzzy over tabs vs spaces. DO NOT CHANGE
	"
	" Makefile
	autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
	" yaml file
	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

	"----------------------------------------------------------------------
	" Change these to your convenience / according to convention
	"
	" Linux Kernel coding styles
	autocmd FileType c setlocal ts=4 sts=4 sw=4 noexpandtab
	" According to MIP workgroup @ CAU + Google style guide
	autocmd FileType cpp setlocal ts=2 sts=2 sw=2 noexpandtab
	autocmd FileType cuda setlocal ts=2 sts=2 sw=2 noexpandtab
	" Googles style guides
	autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType xml setlocal ts=2 sts=2 sw=2 expandtab
	" Haskell wiki style guide
	autocmd FileType haskell setlocal ts=4 sts=4 sw=4 expandtab
	" Java style guides
	autocmd FileType java setlocal ts=4 sts=4 sw=4 noexpandtab " oracle/sun
	autocmd FileType java setlocal ts=2 sts=2 sw=4 expandtab   " google
	" python.org
	autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
	" GitHubs style guide
	autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType eruby setlocal ts=2 sts=2 sw=2 expandtab
	" Own stlyes
	autocmd FileType javascript setlocal ts=4 sts=4 sw=4
	autocmd FileType tex setlocal ts=4 sts=4 sw=4 noexpandtab
endif


"------------------------------------------------------------------------------
" ToggleCalendar
"
function! ToggleCalendar()
	execute ":Calendar"
	if exists("g:calendar_open")
		if g:calendar_open == 1
			execute "q"
			unlet g:calendar_open
		else
			g:calendar_open = 1
		end
	else
		let g:calendar_open = 1
	end
endfunction
:autocmd FileType vimwiki map c :call ToggleCalendar()


"------------------------------------------------------------------------------
" Markdown rendering plugin settings
"
let g:instant_markdown_slow = 1		" Mardown instant rendering
let g:instant_markdown_autostart = 0	" Call plugin by :InstantMarkdownPreview


"------------------------------------------------------------------------------
" Slime plugin settings
"
let g:slimv_swank_cmd = '!osascript -e "tell application \"Terminal\" to do script \"y sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp\""'


"------------------------------------------------------------------------------
" Global auto-complete file for small temporary projects
"
let g:ycm_global_ycm_extra_conf = "~/.vim/ycm_extra_conf.py"

"------------------------------------------------------------------------------
" vimwiki syntax highlighting settings
"
let wiki = {}
let wiki.path = '~/vimwiki'
let wiki.nested_syntaxes = {'c': 'c', 'c++': 'cpp', 'css': 'css', 'haskell': 'hasekll', 'html': 'html', 'java': 'java', 'javascript': 'javascript', 'python': 'python', 'ruby': 'ruby', 'tex': 'tex', 'xml': 'xml', 'yaml': 'yaml'}
let g:vimwiki_list = [wiki]

"------------------------------------------------------------------------------
" Legacy Color Schemes
"
"colorscheme molokai		" Use a nice color scheme (needs to be present
"							     in ~/.vim/colors/)
"let g:rehash256 = 1
"colorscheme wombat
"colorscheme vimbrant
"colorscheme jellybeans		" Use a nice color scheme
				" Scheme needs to be present in
				" ~/.vim/colors/jellybeans.rc
				"


