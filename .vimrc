"""""""""""""""""""""""""""""""
""""""""""""""
"   (c) 2014    Aneesh MG
""""""""""""""
"""""""""""""""""""""""""""""""

" --- Set VIM options --- "

" Change title of term
set title
set icon

" Show line number
set number
set ruler

" Tab-space related stuff
set ts=4
set tabstop=4
set shiftwidth=4
set showtabline=1
set smarttab
set expandtab
:%retab


" Indenting
set smartindent
set textwidth=100
set autoindent
set copyindent
set preserveindent
"augroup vimrc_autocmds
"  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
"  autocmd BufEnter * match OverLength /\%100v.*/
"augroup END


" Make vi fast
set ttyfast

" Use Unix 'more' in vim
set more

" Highlight the present line
set cursorline

" Show matching paranthesis
set showmatch

" Search options
set incsearch                          " Show search matches as you type
set hlsearch                           " Highlight search
set matchtime=2                        " Time in tenths of a second to jump

" Shows horizontal status bar with command and mode at the bottom
set showmode                           " Shows V/N/I modes
set showcmd                            " Shows the command-line
set laststatus=2

" Use smart casing and ignore case for search
set smartcase
set ignorecase

" Great Pattern matching
set magic

" Horizontal and vertical scroll offsets
set scrolloff=7
set sidescrolloff=4

" Set to auto read/write when a file is changed from the outside
set autoread
"set autowrite
"set autowriteall

" Set language
if version >= 700
   set spl=en spell
   set nospell
endif

" VIM Commandline completion
set wildmenu
set wildmode=list:longest,full

" To fold code
set foldmethod=marker
set shiftround
set modeline
set modelines=3

" Use VIM instead of VI
set nocompatible

" Force vim to load only what is required
set lazyredraw

" Tell VIM that you need explicit line breaks
set linebreak

" Hide all buffers
set hidden

" Wrap
set wrap linebreak

" Window Splitting
set splitright
set splitbelow

" Misc
set nojoinspaces
"if has('mouse')
"  set mouse=a                    " use mouse everywhere (when terminal supports it)
"endif                            " uncomment if required
"hi CursorLine cterm=NONE ctermbg=200

" File specific syntaxing and indentation
filetype on
filetype plugin on
syntax enable
filetype plugin indent on
syntax on

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Automatically cd into the directory that the file is in
"autocmd BufEnter * execute \"chdir \".escape(expand("%:p:h"), ' ')

" Color schemes (Uncomment to select)
"colorscheme desert
"colorscheme shine
"colorscheme elflord
"colorscheme blue
"colorscheme darkblue
"colorscheme delek
colorscheme koehler
"colorscheme slate
"colorscheme morning
"colorscheme evening
"colorscheme pablo
"colorscheme murphy
"colorscheme torte
"colorscheme zellner
"set background=dark

" Make Vim remember cursor location
source $VIMRUNTIME/vimrc_example.vim

" Crazy stuff... use on dummies by dumping following 2 lines in vimrc
"highlight ColorColumn ctermbg=red ctermfg=blue
"exec 'set colorcolumn=' . join(range(2,80,3), ',')

" Uncomment the following line to make show comments in italics
" highlight Comment cterm=italic

" lightline config
set laststatus=2

" Highlight whitespaces in red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/



" --- End of Vim options --- "

" -------------------------------------------------------------------------------------------------------

" --- Mappings --- "

" Character key mapppings
command WQ wq
command Wq wq
command W w
command Q q

" Map : -> ;
nore ; :
nore , ;

" Map F2 to save and quit
map <F2> <Esc>:wq<CR>
map! <F2> <Esc>:wq<CR>

" Map F4 to quit without saving
map <F4> <Esc>:q!<CR>
map! <F4> <Esc>:q!<CR>

" Map F3 to save and continue editing
map! <F3> <Esc>:w<CR>a
map! <F3> <Esc>:w<CR>a

" Map for NERDTree
map <C-o> :NERDTreeToggle<CR>

" Map , to fuzzyfiles finder
map , :Files<CR>

" Map Shift+F11 to append CW info to file
nmap <S-F11> :call SetCopy()<CR>

" Map jj to <esc>
inoremap jj <Esc>

" Map F-9 to toggle codefolding (vim-json)
nnoremap <F9> za

" Highlight next match in search
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

" --- End of mappings --- "

" -------------------------------------------------------------------------------------------------------

" --- Functions --- "

" Function to append copywrite info to file
function! SetCopy()
   let newline = '//'
   let copyright = '// (c) 2014 Aneesh MG. All Rights Reserved.'
   call append( 0, newline )
   call append( 0, copyright )
   call append( 0, newline )
endfunction

" Function(s) 1) To highlight search text in red
function! HLNext (blinktime)
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  let target_pat = '\c\%#\%('.@/.'\)'
  let ring = matchadd('WhiteOnRed', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

" 2) To blink the line containing the match...
"function! HLNext (blinktime)
"  set invcursorline
"  redraw
"  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
"  set invcursorline
"  redraw
"endfunction


" --- End of functions --- "

" -------------------------------------------------------------------------------------------------------

" lightline config
let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }

" Swap and backup options
set nobackup
set noswapfile
set nowb
set noundofile

" Include Pathogen plugins
call pathogen#infect()


