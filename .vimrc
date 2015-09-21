" ----------------------------------------------------------------------------
"  Vim package manager 
" ----------------------------------------------------------------------------

set nocompatible               

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

filetype off 			" Required for Vundle

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'altercation/vim-colors-solarized'

" Syntax check on buffer save {{{2
NeoBundle 'scrooloose/syntastic'
" Version control
NeoBundle 'tpope/vim-fugitive'

call neobundle#end()

NeoBundleCheck

filetype plugin indent on	  

syntax enable			" Turn on syntax highlighting

" ----------------------------------------------------------------------------
"  Moving around, searching and patterns 
" ----------------------------------------------------------------------------
set nostartofline     " keep cursor in same column for long-range motion cmds
set incsearch			    " Highlight pattern matches as you type
set ignorecase			  " ignore case when using a search pattern
set smartcase			    " override 'ignorecase' when pattern has upper case
                      " character

" ----------------------------------------------------------------------------
"  Tags 
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Displaying text 
" ----------------------------------------------------------------------------
set scrolloff=3       " number of screen lines to show around the cursor

set linebreak			    " For lines longer than the window, wrap intelligently.
                      " This doesn't insert hard line breaks.

set showbreak=>>\ \ 		" string to put before wrapped screen lines

set sidescrolloff=2		" min # of columns to keep left/right of cursor
set display+=lastline " show last line, even if it doesn't fit in the window

set number			      " show line numbers


" ----------------------------------------------------------------------------
"  Syntax, highlighting and spelling {{{1
" ----------------------------------------------------------------------------
set background=dark

" ignore colorscheme doesn't exist error if solarized isn't installed
silent! colorscheme solarized

if exists('+colorcolumn')
  set colorcolumn=80    " display a line in column 80 to show you
                        " where to line break.
endif

" Terminal transparent
hi Normal ctermbg=None 

" ----------------------------------------------------------------------------
"  Multiple windows {{{1
" ----------------------------------------------------------------------------
set laststatus=2  	  " Show a status line, even if there's only one
                      " Vim window

set hidden		    	  " allow switching away from current buffer w/o writing

set switchbuf=usetab  " Jump to the 1st open window which contains
                      " specified buffer, even if the buffer is in
                      " another tab.
                      " TODO: Add 'split' if you want to split the
                      " current window for a quickfix error window.

set statusline=
set statusline+=b%-1.3n\ >                    " buffer number
set statusline+=\ %{fugitive#statusline()}:
set statusline+=\ %F
set statusline+=\ %M
set statusline+=%R
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=
set statusline+=\ %Y
set statusline+=\ <\ %{&fenc}
set statusline+=\ <\ %{&ff}
set statusline+=\ <\ %p%%
set statusline+=\ %l:
set statusline+=%02.3c   	" cursor line/total lines

set helpheight=30         " Set window height when opening Vim help windows

" ----------------------------------------------------------------------------
"  Multiple tab pages 
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Terminal 
" ----------------------------------------------------------------------------
set ttyfast			      " this is the 21st century, people

" ----------------------------------------------------------------------------
"  Using the mouse 
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Printing 
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Messages and info 
" ----------------------------------------------------------------------------
set showcmd			    " In the status bar, show incomplete commands
                    " as they are typed

set ruler			      " Always display the current cursor position in
                    " the Status Bar

set confirm         " Ask to save buffer instead of failing when executing
                    " commands which close buffers

" ----------------------------------------------------------------------------
"  Selecting text 
" ----------------------------------------------------------------------------

"set clipboard=unnamed	" Yank to the system clipboard by default

" ----------------------------------------------------------------------------
"  Editing text 
" ----------------------------------------------------------------------------
set backspace=indent,eol,start  "backspace over everything

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j 	  " delete comment char on second line when
                          " joining two commented lines
endif

set showmatch  			      " when inserting a bracket, briefly jump to its
                          " match

set nojoinspaces	  	    " Use only one space after '.' when joining
                          " lines, instead of two

set completeopt+=longest 	" better omni-complete menu

set nrformats-=octal      " don't treat numbers with leading zeros as octal
                          " when incrementing/decrementing

" ----------------------------------------------------------------------------
"  Tabs and indenting 
" ----------------------------------------------------------------------------
set tabstop=4             " tab = 4 spaces
set shiftwidth=4          " autoindent indents 4 spaces
set smarttab              " <TAB> in front of line inserts 'shiftwidth' blanks
set softtabstop=4
set shiftround            " round to 'shiftwidth' for "<<" and ">>"
set expandtab

" ----------------------------------------------------------------------------
"  Folding 
" ----------------------------------------------------------------------------
if has('folding')
  set nofoldenable 		         " When opening files, all folds open by default
  set foldtext=NeatFoldText()  " Use a custom foldtext function
endif

" ----------------------------------------------------------------------------
"  Diff mode 
" ----------------------------------------------------------------------------
set diffopt+=vertical       " start diff mode with vertical splits by default

" ----------------------------------------------------------------------------
"  Mapping 
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Reading and writing files 
" ----------------------------------------------------------------------------
set autoread			          " Automatically re-read files changed outside
                            " of Vim

" ----------------------------------------------------------------------------
"  The swap file 
" ----------------------------------------------------------------------------


" ----------------------------------------------------------------------------
"  Command line editing 
" ----------------------------------------------------------------------------
set history=200    " Save more commands in history

set wildmode=list:longest,full

" ignore binary files
set wildignore+=*.exe,*.png,*.jpg,*.gif,*.doc,*.mov,*.xls,*.msi
" Vim files
set wildignore+=*.sw?,*.bak,tags

set wildmenu

" Add guard around 'wildignorecase' to prevent terminal vim error
if exists('&wildignorecase')
  set wildignorecase
endif

" ----------------------------------------------------------------------------
"  Executing external commands 
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Running make and jumping to errors 
" ----------------------------------------------------------------------------

if executable('grep')
  set grepprg=grep\ --line-number\ -rIH\ --exclude-dir=tmp\ --exclude-dir=.git\ --exclude=tags\ $*\ /dev/null
endif

" ----------------------------------------------------------------------------
"  Language specific 
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Multi-byte characters 
" ----------------------------------------------------------------------------
set encoding=utf-8

" ----------------------------------------------------------------------------
"  Various 
" ----------------------------------------------------------------------------
set gdefault              " For :substitute, use the /g flag by default

" Don't save global options. These should be set in vimrc
" Idea from tpope/vim-sensible
set sessionoptions-=options   

" ----------------------------------------------------------------------------
" Autocmds 
" ----------------------------------------------------------------------------

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
" From https://github.com/thoughtbot/dotfiles/blob/master/vimrc
autocmd BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" ----------------------------------------------------------------------------
" Allow overriding these settings {{{1
" ----------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif


