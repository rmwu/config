" download + configure vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'airblade/vim-gitgutter'

Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

highlight Pmenu ctermbg=gray


"" syntax highlighting
syntax on
hi LineNr    ctermfg=red
hi Function  ctermfg=cyan
hi Statement ctermfg=211

" code folding
"" default fold code by indent block (makes sense in Python)
set foldmethod=indent
"" 238=#444444 151=#afd7af
highlight Folded ctermbg=238 ctermfg=151
augroup OpenAllFoldsOnFileOpen
        autocmd!
            autocmd BufRead * normal zR
        augroup END
"" unfold using space
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
"" remove stupid folding
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

"" set to auto read when a file is changed from the outside
set autoread

"" show line numbers
set number
set relativenumber

"" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

"" Turn on the WiLd menu
set wildmenu
"" Ignore compiled files
set wildignore=*.o,*~,*.pyc
"Always show current position
set ruler
"" Height of the command bar
set cmdheight=1
"" A buffer becomes hidden when it is abandoned
set hid
"" Configure backspace so it acts as it should act
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
"" Ignore case when searching
set ignorecase
"" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
hi Search cterm=NONE ctermfg=Green ctermbg=238
" Makes search act like search in modern browsers
set incsearch
"" For regular expressions turn magic on
set magic
"" Show matching brackets when text indicator is over them
set showmatch
"" How many tenths of a second to blink when matching brackets
set mat=2
" Highlight current line
set cursorline
hi CursorLine term=None cterm=None ctermbg=238
hi CursorLineNR cterm=None ctermfg=red ctermbg=238
"" Empty line hide ~ symbols
hi EndOfBuffer ctermbg=Black ctermfg=Black

" whitespace
"" indent = 4 space
filetype plugin indent on

"" Use spaces instead of tabs
set autoindent
set smartindent
set wrap "Wrap lines
set linebreak
set textwidth=80
set nolist
set tabstop=4
set shiftwidth=4
set expandtab

"" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"" auto remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

"" make divider less ugly
set fillchars=vert:│
set fillchars+=stl:–

"" split bars
hi VertSplit    ctermfg=Black  ctermbg=238
hi StatusLine   ctermfg=Black  ctermbg=Red
hi StatusLineNC ctermfg=Black  ctermbg=238

hi TabLineFill ctermfg=238  ctermbg=238
hi TabLine     ctermfg=Green     ctermbg=238
hi TabLineSel  ctermfg=Green     ctermbg=Black

" nerdtree
map <C-n> :NERDTreeToggle<CR>
"" automatically open with vim
autocmd vimenter * NERDTree
"" automatically open if no file provided
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"" automatically open with directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
"" close vim if only nerdtree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"" nerdtree close ? for help
let NERDTreeMinimalUI = 1
"" nerdtree highlight current line
let NERDTreeHighlightCursorline = 1

" fzf
map ; :Files<CR>
let g:fzf_layout = { 'down': '~30%' }
"" feed fzf results from ag, which ignores .gitignore
let $FZF_DEFAULT_COMMAND='ag -g .'

" tmuxline
let g:airline_theme='bubblegum'
let g:tmuxline_powerline_separators = 0

"\'a'    : '#S',
let g:tmuxline_preset = {
      \'a'    : '#H',
      \'b'    : '#(curl icanhazip.com)',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '#(date)',
      \'z'    : '♥ always ♥'}

let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '',
    \ 'right' : '',
    \ 'right_alt' : ' ',
    \ 'space' : ' '}

