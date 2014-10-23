set nocompatible              " be iMproved, required
set shell=/bin/bash
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" NODE
Plugin 'moll/vim-node'
Plugin 'walm/jshint.vim'
Plugin 'rking/ag.vim'

" Git
Plugin 'tpope/vim-fugitive'

" JavaScript
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'scrooloose/syntastic'
Plugin 'ahayman/vim-nodejs-complete'
Plugin 'mattn/emmet-vim'
Plugin 'marijnh/tern_for_vim'

Plugin 'scrooloose/nerdtree'
Plugin 'surround.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'claco/jasmine.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'flazz/vim-colorschemes'

" colorscheme
Plugin 'altercation/vim-colors-solarized'

call vundle#end()

"********************
""Syntax and colors
"********************

syntax enable
filetype plugin on

" Set terminal to 256 colors

" set colorscheme
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html'] }

let g:syntastic_javascript_checkers = ['jshint', 'jscs']
let g:syntastic_check_on_open=1

" turn on suggestion list
set wildmenu
set wildmode=list:longest
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" line numbers and indentation
set mouse=a
set mousehide
set colorcolumn=80
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent
set ruler
" refresh buffer if file was change from outside
set autoread

" turn off sound alerts
set visualbell

" better search options
set incsearch
set ignorecase
set smartcase
set gdefault
set showmatch
set hlsearch

" basic options
set encoding=utf-8
set scrolloff=3
set hidden
set copyindent
set visualbell
set cursorline
set ttyfast
set ttymouse=xterm
set backspace=indent,eol,start
set laststatus=2
set virtualedit=all
set nobackup " disable swapping
set noswapfile " disable swapping
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set fillchars+=vert:\ | set nowrap
" how many tenths of a second to blink when matching brackets
set mat=2
set pt=<f12>

" set normal split behavior
set splitbelow
set splitright

" change mapleader
let mapleader = ","

" tweak cursor line
augroup cursorline
  au!
  au vimenter,winenter,bufwinenter * setlocal cursorline
  au winleave * setlocal nocursorline
augroup end

" Remove scrollbars
set guioptions-=L
set guioptions-=r

" set gui font
set guifont=Menlo:h14

nnoremap K i<CR><Esc>

" Vim doesn't set a FileType for JSON, so we'll do it manually:
autocmd BufNewFile,BufReadPost *.json setlocal filetype=javascript.json

" Requires that you have Python v2.6+ installed. (Most *nix systems do.)
autocmd FileType json let b:vimpipe_command="python -m json.tool"

" Strip white space at the end of line
autocmd BufWritePre * :%s/\s\+$//e

" Set syntax to jst for ejs files
autocmd BufNewFile,BufRead *.ejs set filetype=jst

" Markdown
autocmd BufRead *.md set ft=markdown

"****************
""Misc remaps
"****************

"" remap : to ;
nnoremap ; :
inoremap jj <ESC>

" Taming search
nnoremap / /\v
vnoremap / /\v
nnoremap <C-i> /\v
vnoremap <C-i> /\v

" Dismiss search highlight
nnoremap <leader><space> :noh<cr>

" fix vim's idiotic indentation
vnoremap > ><cr>gv
vnoremap < <<cr>gv

"**************
""Movement
"**************
"
"" navigating the splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" disable arrow keys for everything
" but insert mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

" show/hide
nnoremap <silent> <F1> :NERDTreeToggle<CR>
" show hidden files
let NERDTreeShowHidden = 1
" focus nerdtree
nmap <silent> <leader>m :NERDTreeFocus<CR>

" set ctrlp trigger
nnoremap <c-t> :CtrlPRoot<CR>

" set ctrlp trigger
nnoremap <c-t> :CtrlPRoot<CR>

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Set zen coding abbreviation expand key
let g:user_emmet_expandabbr_key = '<C-o>'
let g:user_emmet_mode = 'a'
let g:user_emmet_install_global = 1

set omnifunc=syntaxcomplete#Complete

let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_inactive_collapse=1
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#tabline#close_symbol = 'X'

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" These are the tweaks I apply to YCM's config, you don't need them but they might help.
" YCM gives you popups and splits by default that some people might not like, so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview
