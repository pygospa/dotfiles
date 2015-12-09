" Author:	Kannan Thambiah <pygospa@gmail.com>
" Copyright:	CC BY-SA 4.0 <http://creativecommons.org/licenses/by-sa/4.0>

" Mardown instant rendering
let g:instant_markdown_slow = 1
" Explicitly call plugin by :InstantMarkdownPreview
let g:instant_markdown_autostart = 0

"
let g:slimv_swank_cmd = '!osascript -e "tell application \"Terminal\" to do script \"y sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp\""'

runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
filetype plugin indent on	"We want vim to automatically load plugins


" vim should us an unnamed clipboard (OS X hack for vim and tmux)
set clipboard=unnamed

" vi is outdated and I don't need my vim to be vi-compatible
set nocompatible

" Colors
syntax enable
set background=dark
colorscheme solarized
call togglebg#map("<F5>")

" Legacy Color Schemes
"colorscheme molokai		" Use a nice color scheme (needs to be present in ~/.vim/colors/
"let g:rehash256 = 1
"colorscheme wombat
"colorscheme vimbrant
"colorscheme jellybeans		" Use a nice color scheme
				" Scheme needs to be present in
				" ~/.vim/colors/jellybeans.rc

"My mappings
let mapleader=","		" We want to use the comma as map leader

" Spelling - who really uses ]s and [s ?!
map <leader>sn ]s
map <leader>sp [s

map nt :NERDTreeToggle<cr>
map be :BufExplorer
"Toggle the tagbar window
map tb :TagbarToggle<cr>
"Open Tagbar (if not already open) and jump into it (leaving focus on
"previous splitscreen)
map tj :TagbarOpen fj<cr>
map sp :set spell!<cr>
map <leader>l :set list!

"Deactivate arrow keys (I want to _learn_ to navigate with hjkl
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
" Same for Insert mode
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

" I want to use backsapce in vim to delete words (even old ones)
set backspace=indent,eol,start

scriptencoding utf-8		"Set the encoding for the script

set encoding=utf-8		" We want to produce utf-8 documents
set filetype=on			" We want vim to inspect the files it is editing
set hidden			" We want to switch between buffers, even if they are unsaved!
set history=100			" We want to keep the last 100 commands in the history
set hlsearch			" Mark all parts in the text that match search
set incsearch			" Start searching while typing. Jump to the first bestfit
set laststatus=2		" Always show the status line
set nocp			" We don't need compatibility mode for the classic Vi
set number			" We want line numbering
set numberwidth=4		" How many lines will we have? Leave space for four digits
set relativenumber		" Only the current line has it's line number displayed. Other lines are relative
set ruler			" Allways show us where we are, at the bottom status line
set smartindent			" When doing indention, be smart about it :)
set showcmd			" Show the command that you are currently using
set showmatch			" Shows the matchint paranteese for an open one, if added/mousover
set showmode			" Shows the current mode in the status line
set spelllang=de,en		" Spelling languages
set spellsuggest=double,10	" How controll spelling should look like and howmany suggestions to make
set textwidth=80		" Have the text wrapped after 80 characters
set ttyfast			" As we are only using vim at home, tell it, that you have a fast terminal connection
set wildmenu			" We want tab completion for the command line
set wrap			" Wrap the text, when out of window
set clipboard=unnamed		" Shares the clipboard with the OS. Now yy, D, P copy to clipboard, which will also work outside vim
set listchars=tab:▸\ ,eol:¬	" We want ▸ as Tab character and ¬ as end of line character (instead of ^I and $
syntax on			" Switching on syntax highlighting
syntax sync fromstart		" Start with correct syntax (may be slow)


" Show me a line at the 80th character each row
if(exists('+colorcolumn'))
	set colorcolumn=80,120
	highlight ColorColumn ctermbg=16
endif



" Persisten undo is a neat feature
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

" <---------- Indention ---------->
" Rule of thumb:
" If you want to work with tab characters, always ensure
"	tabstop == softtabstop
" If you want to work with space characters, always ensure
"	softtabstop == shiftwidth
set autoindent		" Set autoindent for coding
set noexpandtab		" We don't want any convertion of tabs to spaces
set tabstop=8		" Determing the width of tab-characters. In this case 8
set softtabstop=8	" When expandtab is set, this determines the spaces added for a tab-keystroke.
			" If not, and softtab < tabstop, tab-keystorkes translate to spaces of sottab,
			" until they reach tabstop length, then transform to tab character
set shiftwidth=8	" In combination with softtabstop sets the width for autoindent

" <---------- File specific settings---------->
" We need autocmd to be compiled with vim to make use of this. using
" vim-scripts if-statement we keep this file portable!
if has("autocmd")
	" Syntax of these languages is fuzzy over tabs vs spaces. DO NOT CHANGE
	autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

	" Change these to your convenience / according to convention
	autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab	" According to githubs style-guide
	autocmd FileType eruby setlocal ts=2 sts=2 sw=2 expandtab

	autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab	" According to python.org

	autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab	" According to googles style-guide
	autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab		" According to googles style-guide
	autocmd FileType xml setlocal ts=2 sts=2 sw=2 expandtab		" According to google style guide
	autocmd FileType javascript setlocal ts=4 sts=4 sw=4

	autocmd FileType java setlocal ts=4 sts=4 sw=4 noexpandtab	" According to oracle/sun

	autocmd FileType haskell setlocal ts=4 sts=4 sw=4 expandtab	" According to haskell wiki

	autocmd FileType tex setlocal ts=4 sts=4 sw=4 noexpandtab

	autocmd FileType cpp setlocal ts=2 sts=2 sw=2 noexpandtab	" According to MIP workgroup @ CAU + googles style guide
	autocmd FileType cuda setlocal ts=2 sts=2 sw=2 noexpandtab
	autocmd FileType c setlocal ts=4 sts=4 sw=4 noexpandtab		" According to Linux Kernel Coding styles


"	autocmd BufEnter * Rvm  "Automatically switch to the right Ruby version using rvm and .rvmrc per buffer switch
endif

" <---- Recognize .markdown files even when they use the .md extension ---->
au BufRead,BufNewFile *.md set filetype=markdown



"Use German as default spelling language
set spelllang=de_de

"Set tasklist to open on bottom
"let g:tlWindowPosition = 1

"Statusline
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
set statusline+=%-40f\                    " path
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\ " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%=%1*%y%*%*\              " file type
set statusline+=%10((%l,%c)%)\            " line and column
set statusline+=%P                        " percentage of file

