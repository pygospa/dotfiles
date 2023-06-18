" Author		Kannan Thambiah <pygospa@gmail.com>
" Latest version	https://github.com/pygospa/dotfiles


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
set packpath+=$HOME/.vim/pack/
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
map <leader>nt :NERDTreeToggle<cr>
map <leader>be :BufExplorer
map <leader>tb :TagbarToggle<cr>
map glt :VimwikiToggleListItem<cr>

nnoremap <C-y> <C-a>		" I'm using ctrl-a for tmux (former screen)
vnoremap <C-y> <C-a>
nnoremap <C-H> <C-W><C-H>	" easy window movment with ctrl hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap J 5j			" easy line movement
nnoremap K 5k
nnoremap L :bnext<CR>		" easy buffer movement
nnoremap H :bprevious<CR>
"no <down> <Nop>			" Deactivate arrow keys in normal mode
"no <left> <Nop>
"no <right> <Nop>
"no <up> <Nop>
"ino <down> <Nop>		" Deactivate arrow keys in insert mode
"ino <left> <Nop>
"ino <right> <Nop>
"ino <up> <Nop>
nnoremap <space> za		" Toggle folds using space instead of za
inoremap <leader>now *<CR><ESC>!!date<CR>A*<Esc>kJxA<CR><CR>

"Bind FZF to ctrl-p for some strange reason :)
nmap <C-P> :FZF<CR>


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
set statusline+=%P\                         	" percentage of file
set statusline+=%{wordcount().words}\ words


"------------------------------------------------------------------------------
" Colors
"

" https://vi.stackexchange.com/a/16136
au ColorScheme * hi Normal ctermbg=None   

packadd! dracula
syntax enable
colorscheme dracula


"------------------------------------------------------------------------------
" Show me a line at the 80th and 120th character each row
"
if(exists('+colorcolumn'))
	set colorcolumn=80,120
	highlight ColorColumn ctermbg=16
endif


"------------------------------------------------------------------------------
" Filetypes
"
au BufRead,BufNewFile *.md set filetype=markdown
"au BufRead,BufNewFile *.wiki set filetype=vimwiki



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
        " kotlinlang.org
	autocmd FileType kotlin setlocal ts=4 sts=4 sw=4 expandtab
	" python.org
	autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
	" GitHubs style guide
	autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType eruby setlocal ts=2 sts=2 sw=2 expandtab
	" Airbnb JavaScript Styleguide
	autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
	" Julia Stylegude
	autocmd FileType julia setlocal ts=4 sts=4 sw=4 expandtab
	" Own stlyes
	autocmd FileType tex setlocal ts=4 sts=4 sw=4 noexpandtab
	autocmd FileType zsh setlocal ts=4 sts=4 sw=4 expandtab
	autocmd FileType markdown setlocal ts=4 sts=4 sw=4 expandtab
endif



"------------------------------------------------------------------------------
" Ale
"
let g:ale_fixers = { 'elixir': ['mix_format'] }
let g:ale_fix_on_save = 1


"------------------------------------------------------------------------------
" Syntastic
"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_on_wq = 0


"------------------------------------------------------------------------------
" ToggleCalendar
"
"function! ToggleCalendar()
"	execute ":Calendar"
"	if exists("g:calendar_open")
"		if g:calendar_open == 1
"			execute "q"
"			unlet g:calendar_open
"		else
"			g:calendar_open = 1
"		end
"	else
"		let g:calendar_open = 1
"	end
"endfunction
":autocmd FileType vimwiki map c :call ToggleCalendar()


"------------------------------------------------------------------------------
" Custom text for folded header line
"
function! MyFoldHeader()
	" Get first line of fold
	let firstline = getline(v:foldstart)

	" Calculate some numbers for line filling
	let nucolwidth = &fdc + &number * &numberwidth
	let windowwidth = winwidth(0) - nucolwidth
	let linecount = v:foldend - v:foldstart

	" Construct the new header
	let firstline = strpart(firstline, 0, windowwidth - 2 -len(linecount))
	let fillcharcount = windowwidth - strdisplaywidth(firstline) - len(linecount) - 8
	let header = ' » ' . firstline . repeat(" ",fillcharcount) . '[' . linecount . '] « '")
	return header
endfunction
set foldtext=MyFoldHeader()

"------------------------------------------------------------------------------
" CtrlP plugin settings
"
let g:ctrlp_cmd = 'CtrlPMixed'

"------------------------------------------------------------------------------
" javacomplete2 plugin settings
"
autocmd FileType java setlocal omnifunc=javacomplete#Complete

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
" vimwiki syntax, filetype and highlighting settings
"
let wiki = {}
let wiki.path = '~/files/vimwiki'
let wiki.syntax = 'markdown'
let wiki.ext = '.md'
let wiki.nested_syntaxes = {'c': 'c', 'c++': 'cpp', 'css': 'css',
                          \ 'haskell': 'hasekll', 'html': 'html',
			  \ 'java': 'java', 'javascript': 'javascript', 
			  \ 'python': 'python', 'ruby': 'ruby', 'tex': 'tex',
			  \ 'xml': 'xml', 'yaml': 'yaml'}
let g:vimwiki_list = [wiki]


"------------------------------------------------------------------------------
" Make vimwiki use markdown styled links instead of vimwiki links
"
let g:vimwiki_markdown_link_ext = 1


""------------------------------------------------------------------------------
"" coc.nvim settings (copied from doc)
""
"
"" TextEdit might fail if hidden is not set.
"set hidden
"
"" Some servers have issues with backup files, see #649.
"" set nobackup
"" set nowritebackup
"
"" Give more space for displaying messages.
"set cmdheight=2
"
"" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
"" delays and poor user experience.
"set updatetime=300
"
"" Don't pass messages to |ins-completion-menu|.
"set shortmess+=c
"
"" Always show the signcolumn, otherwise it would shift the text each time
"" diagnostics appear/become resolved.
"if has("patch-8.1.1564")
"  " Recently vim can merge signcolumn and number column into one
"  set signcolumn=number
"else
"  set signcolumn=yes
"endif
"
"" Use tab for trigger completion with characters ahead and navigate.
"" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"" Use <c-space> to trigger completion.
"if has('nvim')
"  inoremap <silent><expr> <c-space> coc#refresh()
"else
"  inoremap <silent><expr> <c-@> coc#refresh()
"endif
"
"" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
"" position. Coc only does snippet and additional edit on confirm.
"" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
"if exists('*complete_info')
"  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"else
"  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif
"
"" Use `[g` and `]g` to navigate diagnostics
"" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"
"" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction
"
"" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')
"
"" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)
"
"" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"
"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder.
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end
"
"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a <Plug>(coc-codeaction-selected)
"nmap <leader>a <Plug>(coc-codeaction-selected)
"
"" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)
"
"" Map function and class text objects
"" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"omap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap af <Plug>(coc-funcobj-a)
"xmap ic <Plug>(coc-classobj-i)
"omap ic <Plug>(coc-classobj-i)
"xmap ac <Plug>(coc-classobj-a)
"omap ac <Plug>(coc-classobj-a)
"
"" Use CTRL-S for selections ranges.
"" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)
"
"" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocAction('format')
"
"" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
"" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
"" Add (Neo)Vim's native statusline support.
"" NOTE: Please see `:h coc-status` for integrations with external plugins that
"" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
"" Mappings for CoCList
"" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
