" ----------------------------------------------------------------------------
"  Vim package manager 
" ----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'

Plug 'altercation/vim-colors-solarized'

" Make sure you use single quotes
"Plug 'junegunn/seoul256.vim'
"Plug 'junegunn/vim-easy-align'

" Group dependencies, vim-snippets depends on ultisnips
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using git URL
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Add plugins to &runtimepath

call plug#end()

" ----------------------------------------------------------------------------
"  Displaying text 
" ----------------------------------------------------------------------------

syntax on

set number

set scrolloff=3

set linebreak

set showbreak=>>\ \ 


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
"  Syntax, highlighting and spelling
" ----------------------------------------------------------------------------

let g:solarized_termcolors=256 "Not necessary if terminal colors set to
                               "solarized
set background=dark
colorscheme solarized
hi Normal ctermbg=none|        "Terminal transparent

if exists('+colorcolumn')
  set colorcolumn=80           " display a line in column 80 to show you
                               " where to line break.
endif

" ----------------------------------------------------------------------------
"  Messages and info
" ----------------------------------------------------------------------------
set ruler

" ----------------------------------------------------------------------------
"  Multiple Windows
" ----------------------------------------------------------------------------

set hidden
